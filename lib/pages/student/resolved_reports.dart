import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_unisafe/pages/student/report_widgets.dart';

class MyReportsPage extends StatefulWidget {
  final ValueNotifier userCredential;
  const MyReportsPage({super.key, required this.userCredential});

  @override
  State<MyReportsPage> createState() => _MyReportsPageState();
}

class _MyReportsPageState extends State<MyReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange.withOpacity(0.7),
        title: const Text('Resolved Reports'),
      ),
      body: _buildReportsStream(),
    );
  }

  Widget _buildReportsStream() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('reports')
          .where('reportedFromEmail',
              isEqualTo: widget.userCredential.value.user!.email!.toString())
          .where('decisionPending', isEqualTo: false)
          .orderBy('submittedAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return buildReportCard(context, data);
            },
          );
        }
        return const Center(child: Text('No resolved reports found'));
      },
    );
  }
}
