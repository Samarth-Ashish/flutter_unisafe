// // // // import 'package:flutter/material.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // No changes needed, the import statement is correct
// // // // import 'package:fl_chart/fl_chart.dart';

// // // // class RecentReportsPage extends StatelessWidget {
// // // //   final String studentId;

// // // //   RecentReportsPage({required this.studentId});

// // // //   Widget _buildCard(BuildContext context, IconData icon, String label, String studentId) {
// // // //     return Card(
// // // //       child: StreamBuilder<QuerySnapshot>(
// // // //         stream: FirebaseFirestore.instance
// // // //             .collection('reports')
// // // //             .where('registrationId', isEqualTo: studentId)
// // // //             .snapshots(),
// // // //         builder: (context, snapshot) {
// // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // //             return Center(child: CircularProgressIndicator());
// // // //           }
// // // //           if (snapshot.hasError) {
// // // //             return Center(child: Text('Error: ${snapshot.error}'));
// // // //           }
// // // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // //             return ListTile(
// // // //               leading: Icon(icon),
// // // //               title: Text(label),
// // // //               subtitle: Text('No reports'),
// // // //             );
// // // //           }

// // // //           // Get the latest report submitted by the student
// // // //           var latestReport = snapshot.data!.docs.last;
// // // //           bool isPending = latestReport['decisionPending'];

// // // //           return Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               ListTile(
// // // //                 leading: Icon(icon),
// // // //                 title: Text(label),
// // // //                 subtitle: Text(isPending ? 'Decision Pending' : 'Resolved'),
// // // //               ),
// // // //               SizedBox(
// // // //                 height: 200,
// // // //                 child: PieChart(
// // // //                   PieChartData(
// // // //                     sections: [
// // // //                       PieChartSectionData(
// // // //                         color: isPending ? Colors.blue : Colors.green,
// // // //                         value: isPending ? 1 : 0,
// // // //                         title: 'Pending',
// // // //                         radius: 80,
// // // //                         titleStyle: TextStyle(fontSize: 16, color: Colors.white),
// // // //                       ),
// // // //                       PieChartSectionData(
// // // //                         color: isPending ? Colors.green : Colors.blue,
// // // //                         value: isPending ? 0 : 1,
// // // //                         title: 'Resolved',
// // // //                         radius: 80,
// // // //                         titleStyle: TextStyle(fontSize: 16, color: Colors.white),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Progress Reports'),
// // // //       ),
// // // //       body: ListView(
// // // //         children: [
// // // //           _buildCard(context, Icons.donut_large, 'Progress Report', studentId),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:fl_chart/fl_chart.dart';

// // // // class RecentReportsPage extends StatelessWidget {
// // // //   final String studentId;

// // // //   RecentReportsPage({required this.studentId});

// // // //   Widget _buildCard(BuildContext context, IconData icon, String label, String studentId) {
// // // //     return Card(
// // // //       child: StreamBuilder<QuerySnapshot>(
// // // //         stream: FirebaseFirestore.instance
// // // //             .collection('reports')
// // // //             .where('registrationId', isEqualTo: studentId)
// // // //             .snapshots(),
// // // //         builder: (context, snapshot) {
// // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // //             return Center(child: CircularProgressIndicator());
// // // //           }
// // // //           if (snapshot.hasError) {
// // // //             return Center(child: Text('Error: ${snapshot.error}'));
// // // //           }
// // // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // //             return ListTile(
// // // //               leading: Icon(icon),
// // // //               title: Text(label),
// // // //               subtitle: Text('No reports'),
// // // //             );
// // // //           }

// // // //           // Get the latest report submitted by the student
// // // //           var latestReport = snapshot.data!.docs.last;
// // // //           bool isPending = latestReport['decisionPending'];

// // // //           return Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               ListTile(
// // // //                 leading: Icon(icon),
// // // //                 title: Text(label),
// // // //                 subtitle: Text(isPending ? 'Decision Pending' : 'Resolved'),
// // // //               ),
// // // //               SizedBox(
// // // //                 height: 200,
// // // //                 child: Padding(
// // // //                   padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
// // // //                   child: PieChart(
// // // //                     PieChartData(
// // // //                       sections: [
// // // //                         PieChartSectionData(
// // // //                           color: isPending ? Colors.blue : Colors.green,
// // // //                           value: isPending ? 1 : 0,
// // // //                           title: 'Pending',
// // // //                           radius: 80,
// // // //                           titleStyle: TextStyle(fontSize: 16, color: Colors.white),
// // // //                         ),
// // // //                         PieChartSectionData(
// // // //                           color: isPending ? Colors.green : Colors.blue,
// // // //                           value: isPending ? 0 : 1,
// // // //                           title: 'Resolved',
// // // //                           radius: 80,
// // // //                           titleStyle: TextStyle(fontSize: 16, color: Colors.white),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Progress Reports'),
// // // //       ),
// // // //       body: Container(
// // // //         color: Colors.white, // Set background color to cover the entire screen
// // // //         child: ListView(
// // // //           children: [
// // // //             _buildCard(
// // // //                 context, Icons.donut_large, 'Progress Report', studentId),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:fl_chart/fl_chart.dart';

// // // class RecentReportsPage extends StatelessWidget {
// // //   final String studentId;

// // //   RecentReportsPage({required this.studentId});

// // //   Widget _buildCard(BuildContext context, IconData icon, String label, String studentId) {
// // //     return Card(
// // //       child: StreamBuilder<QuerySnapshot>(
// // //         stream: FirebaseFirestore.instance
// // //             .collection('reports')
// // //             .where('registrationId', isEqualTo: studentId)
// // //             .snapshots(),
// // //         builder: (context, snapshot) {
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return Center(child: CircularProgressIndicator());
// // //           }
// // //           if (snapshot.hasError) {
// // //             return Center(child: Text('Error: ${snapshot.error}'));
// // //           }
// // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // //             return ListTile(
// // //               leading: Icon(icon),
// // //               title: Text(label),
// // //               subtitle: Text('No reports'),
// // //             );
// // //           }

// // //           // Get the latest report submitted by the student
// // //           var latestReport = snapshot.data!.docs.last;
// // //           bool isPending = latestReport['decisionPending'];

// // //           return Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               ListTile(
// // //                 leading: Icon(icon),
// // //                 title: Text(label),
// // //                 subtitle: Text(isPending ? 'Decision Pending' : 'Resolved'),
// // //               ),
// // //               SizedBox(
// // //                 height: 200,
// // //                 child: Padding(
// // //                   padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
// // //                   child: PieChart(
// // //                     PieChartData(
// // //                       sections: [
// // //                         PieChartSectionData(
// // //                           color: isPending ? Colors.blue : Colors.green,
// // //                           value: isPending ? 1 : 0,
// // //                           title: 'Pending',
// // //                           radius: 80,
// // //                           titleStyle: TextStyle(fontSize: 16, color: Colors.white),
// // //                         ),
// // //                         PieChartSectionData(
// // //                           color: isPending ? Colors.green : Colors.blue,
// // //                           value: isPending ? 0 : 1,
// // //                           title: 'Resolved',
// // //                           radius: 80,
// // //                           titleStyle: TextStyle(fontSize: 16, color: Colors.white),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Progress Reports'),
// // //       ),
// // //       backgroundColor: Color.fromRGBO(247, 246, 244, 1), // Set background color of the Scaffold
// // //       body: ListView(
// // //         children: [
// // //           _buildCard(
// // //               context, Icons.donut_large, 'Progress Report', studentId),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class RecentReportsPage extends StatefulWidget {
  final ValueNotifier userCredential;
  const RecentReportsPage({super.key, required this.userCredential});

  @override
  State<RecentReportsPage> createState() => _RecentReportsPageState();
}

class _RecentReportsPageState extends State<RecentReportsPage> {
  late bool _isPending;

  String _formatTimestampToDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String _formatTimestampToTime(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.hour}:${dateTime.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Reports'),
      ),
      // backgroundColor: const Color.fromRGBO(247, 246, 244, 1), // Set background color of the Scaffold
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('reports')
            .where('reportedFromEmail', isEqualTo: widget.userCredential.value.user!.email!.toString())
            .orderBy('submittedAt', descending: true) // Order by latest timestamp
            .limit(1) // Get only the first document (latest)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
          else {
            // return const ListTile(
            //   leading: Icon(Icons.donut_large),
            //   title: Text('Report Progress'),
            //   subtitle: Text('No reports'),
            // );
            final reportData = snapshot.data!.docs[0].data() as Map<String, dynamic>;
            if (reportData == {}) {
              return const Text('No reports found.');
            }
            // return recentReport(reportData);
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Incident :  ${reportData['reportIncident']}'),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name : ${reportData['name']}'),
                    Text('Email : ${reportData['email']}'),
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Submitted At'),
                    // SizedBox(width: 5, child: Divider(thickness: 1,)),
                    Text(_formatTimestampToDate(reportData['submittedAt'])),
                    Text(_formatTimestampToTime(reportData['submittedAt'])),
                  ],
                ),
              ),
            );
          }

          // // Get the latest report submitted by the student
          // var latestReport = snapshot.data!.docs.last;
          // // debugPrint(latestReport);
          // _isPending = latestReport['decisionPending'];

          // return _buildCard();
        },
      ),
    );
  }

  Widget _buildCard() {
    debugPrint(_isPending.toString());
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.donut_large),
            title: const Text('Report Progress'),
            subtitle: Text(_isPending ? 'Decision Pending' : 'Resolved'),
          ),
          // SizedBox(
          //   height: 200,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 20), // Adjust the top padding as needed
          //     child: PieChart(
          //       PieChartData(
          //         sections: [
          //           PieChartSectionData(
          //             color: _isPending ? Colors.blue : Colors.green,
          //             value: _isPending ? 1 : 0,
          //             title: 'Pending',
          //             radius: 80,
          //             titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          //           ),
          //           PieChartSectionData(
          //             color: _isPending ? Colors.green : Colors.blue,
          //             value: _isPending ? 0 : 1,
          //             title: 'Resolved',
          //             radius: 80,
          //             titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget recentReport(Map reportData) {
    return Text(reportData["name"]);
  }
}
