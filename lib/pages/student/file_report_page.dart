import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_unisafe/pages/student/student_homepage.dart';

class FileReportPage extends StatefulWidget {
  final ValueNotifier userCredential;
  const FileReportPage({super.key, required this.userCredential});

  @override
  State<FileReportPage> createState() => _FileReportPageState();
}

class _FileReportPageState extends State<FileReportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _reportController = TextEditingController();
  final TextEditingController _registrationIdController = TextEditingController();
  bool _physicalBully = false;
  bool _verbalBully = false;
  bool _cyberBully = false;
  bool _socialBully = false;
  late int _block;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _reportController.dispose();
    _registrationIdController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<int>> get _dropDownItems {
    List<DropdownMenuItem<int>> items = [];
    for (int i = 1; i <= 56; i++) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text('$i'),
        ),
      );
    }
    return items;
  }

  Future<void> _submitReport() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        'reportedFromEmail': widget.userCredential.value.user!.email!.toString(), //! Logged in email
        'name': _nameController.text,
        'email': _emailController.text,
        'reportIncident': _reportController.text,
        'registrationId': _registrationIdController.text,
        'physicalBullying': _physicalBully,
        'verbalBullying': _verbalBully,
        'cyberBullying': _cyberBully,
        'socialBullying': _socialBully,
        'decisionPending': true,
        'block': _block,
        'submittedAt': Timestamp.now(), // Adding timestamp here
      };

      try {
        await FirebaseFirestore.instance.collection('reports').add(data);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Report submitted successfully')));
        // Navigator.pop(context);
      } catch (e) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to submit report: $e')));
        // Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Incident'),
        backgroundColor: const Color.fromARGB(255, 219, 165, 228),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 225, 187, 231),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: _registrationIdController,
                        decoration: const InputDecoration(labelText: 'Registration ID'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the registration ID';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _reportController,
                        decoration: const InputDecoration(
                          labelText: 'Report Incident',
                        ),
                        maxLines: 5, // Makes it a multiline textbox for longer text
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the incident details';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField<int>(
                        // hint: const Text('Block'),
                        value: null, // Set the initial value
                        items: _dropDownItems, // List of dropdown menu items
                        onChanged: (int? value) {
                          setState(() {
                            _block = value!; // Update selected number
                          });
                          // widget.onSelected(value!); // Call the callback function
                        },
                        decoration: InputDecoration(
                          labelText: 'Block',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: const EdgeInsets.all(10.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isNaN) {
                            return 'Please enter Block';
                          }
                          return null;
                        },
                      ),
                      // TextFormField(
                      //   controller: _registrationIdController,
                      //   decoration: InputDecoration(labelText: 'Registration ID'),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter the registration ID';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      CheckboxListTile(
                        title: const Text('Physical Bullying'),
                        value: _physicalBully,
                        onChanged: (bool? value) {
                          setState(() {
                            _physicalBully = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Verbal Bullying'),
                        value: _verbalBully,
                        onChanged: (bool? value) {
                          setState(() {
                            _verbalBully = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Cyber Bullying'),
                        value: _cyberBully,
                        onChanged: (bool? value) {
                          setState(() {
                            _cyberBully = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Social Bullying'),
                        value: _socialBully,
                        onChanged: (bool? value) {
                          setState(() {
                            _socialBully = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _submitReport,
                    child: const Text('Save & Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // _formKey.currentState?.reset();
                      // _formKey.currentState?.validate();
                      setState(() {
                        // _physicalBully = false;
                        // _verbalBully = false;
                        // _cyberBully = false;
                        // _socialBully = false;
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
