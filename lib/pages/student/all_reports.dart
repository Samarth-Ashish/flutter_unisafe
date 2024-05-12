
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllReportsPage extends StatefulWidget {
  final ValueNotifier userCredential;
  const AllReportsPage({super.key, required this.userCredential});

  @override
  State<AllReportsPage> createState() => _AllReportsPageState();
}

class _AllReportsPageState extends State<AllReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Reports'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('reports')
            // .where('registrationId', isEqualTo: studentId)
            .where('reportedFromEmail', isEqualTo: widget.userCredential.value.user!.email!.toString())
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(data['reportIncident'] ?? 'No Title'),
                    subtitle: const Text('Resolved'),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No resolved reports found'));
        },
      ),
    );
  }
}
