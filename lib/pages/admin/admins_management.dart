import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminManagementPage extends StatefulWidget {
  final ValueNotifier userCredential;

  const AdminManagementPage({
    super.key,
    required this.userCredential,
  });
  @override
  State<AdminManagementPage> createState() => _AdminManagementPageState();
}

class _AdminManagementPageState extends State<AdminManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(0.7),
        centerTitle: true,
        title: Text('Admin Management'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('admins').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No admins found'));
          }

          Map adminMap = snapshot.data!.docs[0]['admins_with_block']
              as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildAdminList(adminMap),
          );
        },
      ),
      floatingActionButton: buildAddAdminButton(context),
    );
  }

  Widget buildAddAdminButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showAddAdminDialog(context);
      },
      tooltip: 'Add Admin',
      child: Icon(Icons.add),
      backgroundColor: Colors.purple.withOpacity(0.7),
    );
  }

  void _showAddAdminDialog(BuildContext context) {
    String email = '';
    int block = 0;

    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Admin'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value as String;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Block',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    block = int.tryParse(value) ?? 0;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a block';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addAdmin(email, block);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addAdmin(String email, int block) {
    FirebaseFirestore.instance
        .collection('admins')
        .doc('admin_list')
        .get()
        .then((docSnapshot) {
      if (docSnapshot.exists) {
        Map<String, dynamic> adminMap =
            docSnapshot.data()!['admins_with_block'] ?? {};
        adminMap[email] = block;
        FirebaseFirestore.instance
            .collection('admins')
            .doc('admin_list')
            .update({'admins_with_block': adminMap}).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Admin added successfully'),
            duration: Duration(seconds: 2),
          ));
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to add admin: $error'),
            duration: Duration(seconds: 2),
          ));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Admin list not found'),
          duration: Duration(seconds: 2),
        ));
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to fetch admin list: $error'),
        duration: Duration(seconds: 2),
      ));
    });
  }

  Widget buildAdminList(Map adminMap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Admins',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: adminMap.length,
            itemBuilder: (context, index) {
              var keys = adminMap.keys.toList();
              var email = keys[index];
              var block = adminMap[email];
              return buildAdminCard(email, block, () {
                _showDeleteConfirmationDialog(context, email);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildAdminCard(String email, int block, VoidCallback onDelete) {
    return (email != widget.userCredential.value.user!.email!.toString())
        ? Card(
            elevation: 6,
            shadowColor: Colors.purple.withOpacity(0.8),
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(email),
              subtitle: Text('Block: $block'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red.withOpacity(0.8),
                onPressed: onDelete,
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, String email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are you sure you want to delete this admin?',
                  // style: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                Text(
                  'Email: $email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteAdmin(email);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAdmin(String email) {
    FirebaseFirestore.instance
        .collection('admins')
        .doc('admin_list')
        .get()
        .then((docSnapshot) {
      if (docSnapshot.exists) {
        Map<String, dynamic> adminMap =
            docSnapshot.data()!['admins_with_block'] ?? {};
        adminMap.remove(email);
        FirebaseFirestore.instance
            .collection('admins')
            .doc('admin_list')
            .update({'admins_with_block': adminMap}).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Admin deleted successfully'),
            duration: Duration(seconds: 2),
          ));
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to delete admin: $error'),
            duration: Duration(seconds: 2),
          ));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Admin list not found'),
          duration: Duration(seconds: 2),
        ));
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to fetch admin list: $error'),
        duration: Duration(seconds: 2),
      ));
    });
  }
}
