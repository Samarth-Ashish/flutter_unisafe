// // //homepage.dart

// // import 'package:flutter/material.dart';
// // import 'package:flutter_works/MyReportsPage.dart';
// // import 'package:flutter_works/RecentReportsPage.dart';
// // import 'package:flutter_works/faq.dart';
// // import 'package:flutter_works/pageone.dart';
// // import 'package:flutter_works/stories.dart';
// // import 'package:flutter_works/tips.dart';
// // import 'package:provider/provider.dart';
// // import 'package:flutter_works/pagetwo.dart';

// // import 'theme_provider.dart';

// // class homepage extends StatefulWidget {
// //   const homepage({super.key});

// //   @override
// //   State<homepage> createState() => _homepageState();
// // }

// // class _homepageState extends State<homepage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final themeProvider = Provider.of<ThemeProvider>(context);
// //     final List<Widget> cards = [
// //       _buildCard(context, Icons.donut_large, 'Progress Report', () {
// //         // Your code to handle tap on Card A
// //       }),
// //       _buildCard(context, Icons.star, 'Old reports', () {
// //         // Your code to handle tap on Card B
// //       }),
// //     ];

// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Center(
// //             child: Text('Unisafe'),
// //           ),
// //           backgroundColor: const Color.fromARGB(255, 156, 39, 176),
// //           // actions: [
// //           //   IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
// //           // ],
// //           actions: [
// //             Icon(
// //               Icons.dark_mode,
// //               color: themeProvider.isDark ? Colors.blueAccent : null,
// //               size: 20,
// //             ),
// //             SizedBox(
// //               width: 50,
// //               child: FittedBox(
// //                 fit: BoxFit.fill,
// //                 child: themeModeSwitch(context, themeProvider),
// //               ),
// //             ),
// //             Icon(
// //               Icons.light_mode,
// //               color: themeProvider.isDark ? null : Colors.orangeAccent,
// //               size: 20,
// //             ),
// //           ],
// //         ),
// //         drawer: Drawer(
// //           child: Container(
// //             color: const Color.fromARGB(
// //                 255, 225, 187, 231), // Set the background color to pink
// //             child: ListView(
// //               // Important: Remove any padding from the ListView.
// //               padding: EdgeInsets.zero,
// //               children: <Widget>[
// //                 const UserAccountsDrawerHeader(
// //                   accountName: Text("LPU"),
// //                   accountEmail: Text("abc@gmail.com"),
// //                   currentAccountPicture: CircleAvatar(
// //                     backgroundColor: Colors.orange,
// //                     child: Text(
// //                       "L",
// //                       style: TextStyle(fontSize: 40.0),
// //                     ),
// //                   ),
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.home),
// //                   title: const Text("Home"),
// //                   onTap: () {
// //                     Navigator.pop(context); //routes
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.settings),
// //                   title: const Text("Settings"),
// //                   onTap: () {
// //                     Navigator.pop(context); //routes
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.contacts),
// //                   title: const Text("Contact Us"),
// //                   onTap: () {
// //                     Navigator.pop(context); //routes
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //         body: Column(
// //           children: [
// //             SizedBox(
// //               height: 150, // Adjust the height to your preference
// //               child: ListView(
// //                 scrollDirection: Axis.horizontal,
// //                 children: cards,
// //               ),
// //             ),
// //             Expanded(
// //               child: GridView.count(
// //                 crossAxisCount: 3,
// //                 children: List.generate(7, (index) {
// //                   // Changed from 8 to 7
// //                   final List<IconData> icons = [
// //                     Icons.dashboard,
// //                     Icons.psychology,
// //                     Icons.account_circle,
// //                     Icons.settings,
// //                     Icons.lightbulb_outline,
// //                     Icons.library_add,
// //                     Icons.help,
// //                   ];
// //                   final List<String> labels = [
// //                     "Report Incident",
// //                     "Support",
// //                     "My reports",
// //                     "Settings",
// //                     "Anonymous Tip",
// //                     "Stories",
// //                     "FAQ",
// //                   ];

// //                   IconData icon = icons[index];
// //                   String label = labels[index];

// //                   return Card(
// //                     color: Colors.pinkAccent,
// //                     elevation: 20,
// //                     child: InkWell(
// //                       onTap: () {
// //                         navigateToPage(context, index);
// //                       },
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Icon(icon, size: 50),
// //                           Text(label),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 }),
// //               ),
// //             )
// //             // Expanded(
// //             //   child: GridView.count(
// //             //     crossAxisCount: 3,
// //             //     children: List.generate(8, (index) {
// //             //       // Define a list of icons and labels for your cards
// //             //       final List<IconData> icons = [
// //             //         Icons.dashboard,
// //             //         Icons.psychology,
// //             //         Icons.account_circle,
// //             //         Icons.settings,
// //             //         Icons.lightbulb_outline,
// //             //         Icons.library_add,
// //             //         // Icons.feedback_rounded,
// //             //         Icons.help,
// //             //       ];
// //             //       final List<String> labels = [
// //             //         "Report Incident",
// //             //         "Support",
// //             //         "My reports",
// //             //         "Settings",
// //             //         "Anonymous Tip",
// //             //         "Stories",
// //             //         // "Feedbacks",
// //             //         "FAQ",
// //             //       ];

// //             //       // Ensursing the index is within the range of available icons and labels
// //             //       IconData icon = icons[index % icons.length];
// //             //       String label = labels[index % labels.length];

// //             //       return Card(
// //             //         // color: const Color.fromARGB(255, 225, 187, 231),
// //             //         color: Colors.pinkAccent,
// //             //         elevation: 20, // Sky-blue color for the card
// //             //         child: InkWell(
// //             //           onTap: () {
// //             //             navigateToPage(context, index);
// //             //           },
// //             //           child: Column(
// //             //             mainAxisAlignment: MainAxisAlignment.center,
// //             //             children: [
// //             //               Icon(icon, size: 50), // Icon for the card
// //             //               Text(label), // Text label for the card
// //             //             ],
// //             //           ),
// //             //         ),
// //             //       );
// //             //     }),
// //             //   ),
// //             // )
// //           ],
// //         ),
// //         bottomNavigationBar: BottomNavigationBar(
// //           items: const <BottomNavigationBarItem>[
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.dashboard),
// //               label: 'Dashboard',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.feedback_sharp),
// //               label: 'Feedback',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Icons.person),
// //               label: 'Profile',
// //             ),
// //             // Add other navigation items as needed
// //           ],
// //           currentIndex: 0,
// //           backgroundColor: const Color.fromARGB(
// //               255, 225, 187, 231), // Sets the background color to green
// //           onTap: (index) {
// //             // Handle navigation tap
// //           },
// //         ));
// //   }

// //   void navigateToPage(BuildContext context, int index) {
// //     switch (index) {
// //       case 0:
// //         Navigator.push(
// //             context, MaterialPageRoute(builder: (context) => PageOne()));
// //         break;
// //       case 1:
// //         Navigator.push(
// //             context, MaterialPageRoute(builder: (context) => PageTwo()));
// //         break;
// //       case 2:
// //         Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //                 builder: (context) => MyReportsPage(
// //                       studentId: '12110528',
// //                     )));
// //         break;
// //       case 4:
// //         Navigator.push(
// //             context, MaterialPageRoute(builder: (context) => TipsPage()));
// //         break;
// //       // // case 4:
// //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => PageFive()));
// //       //   break;
// //       case 5:
// //         Navigator.push(context, MaterialPageRoute(builder: (context) => StoriesPage()));
// //         break;
// //       case 6:
// //         Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
// //         break;
// //       // case 7:
// //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => PageEight()));
// //       //   break;
// //       default:
// //         // You could navigate to a default page or show an error
// //         break;
// //     }
// //   }

// //   Widget _buildCard(
// //       BuildContext context, IconData icon, String label, VoidCallback onTap) {
// //     double cardWidth =
// //         MediaQuery.of(context).size.width * 0.5; // 50% of screen width

// //     return SizedBox(
// //       width: cardWidth, // Use the dynamic width
// //       child: InkWell(
// //         onTap: onTap,
// //         child: Card(
// //           // color:
// //           //     Color.fromARGB(255, 204, 137, 214), // Sky-blue background color
// //           color: Colors.purple,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Icon(icon, size: 40),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 8.0),
// //                 child: Text(
// //                   label,
// //                   style: const TextStyle(fontSize: 16),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_works/MyReportsPage.dart';
// import 'package:flutter_works/RecentReportsPage.dart';
// import 'package:flutter_works/faq.dart';
// import 'package:flutter_works/pageone.dart';
// import 'package:flutter_works/stories.dart';
// import 'package:flutter_works/tips.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_works/pagetwo.dart';

// import 'theme_provider.dart';

// class StudentHomePage extends StatefulWidget {
//   const StudentHomePage({Key? key}) : super(key: key);

//   @override
//   State<StudentHomePage> createState() => _StudentHomePageState();
// }

// class _StudentHomePageState extends State<StudentHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final List<Widget> cards = [
//       _buildCard(context, Icons.donut_large, 'Progress Report', () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => RecentReportsPage(studentId: '122212')),
//         );
//       }),
//       _buildCard(context, Icons.star, 'Old reports', () {
//         // Your code to handle tap on other cards
//       }),
//       // Add other cards as needed
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text('Unisafe'),
//         ),
//         backgroundColor: const Color.fromARGB(255, 156, 39, 176),
//         actions: [
//           Icon(
//             Icons.dark_mode,
//             color: themeProvider.isDark ? Colors.blueAccent : null,
//             size: 20,
//           ),
//           SizedBox(
//             width: 50,
//             child: FittedBox(
//               fit: BoxFit.fill,
//               child: themeModeSwitch(context, themeProvider),
//             ),
//           ),
//           Icon(
//             Icons.light_mode,
//             color: themeProvider.isDark ? null : Colors.orangeAccent,
//             size: 20,
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: Container(
//           color: const Color.fromARGB(255, 225, 187, 231),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               const UserAccountsDrawerHeader(
//                 accountName: Text("LPU"),
//                 accountEmail: Text("abc@gmail.com"),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundColor: Colors.orange,
//                   child: Text(
//                     "L",
//                     style: TextStyle(fontSize: 40.0),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.home),
//                 title: const Text("Home"),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.settings),
//                 title: const Text("Settings"),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.contacts),
//                 title: const Text("Contact Us"),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 150,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: cards,
//             ),
//           ),
//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 3,
//               children: List.generate(7, (index) {
//                 final List<IconData> icons = [
//                   Icons.dashboard,
//                   Icons.psychology,
//                   Icons.account_circle,
//                   Icons.settings,
//                   Icons.lightbulb_outline,
//                   Icons.library_add,
//                   Icons.help,
//                 ];
//                 final List<String> labels = [
//                   "Report Incident",
//                   "Support",
//                   "My reports",
//                   "Settings",
//                   "Anonymous Tip",
//                   "Stories",
//                   "FAQ",
//                 ];

//                 IconData icon = icons[index];
//                 String label = labels[index];

//                 return Card(
//                   color: Colors.pinkAccent,
//                   elevation: 20,
//                   child: InkWell(
//                     onTap: () {
//                       navigateToPage(context, index);
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(icon, size: 50),
//                         Text(label),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.feedback_sharp),
//             label: 'Feedback',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: 0,
//         backgroundColor: const Color.fromARGB(255, 225, 187, 231),
//         onTap: (index) {},
//       ),
//     );
//   }

//   void navigateToPage(BuildContext context, int index) {
//     switch (index) {
//       case 0:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => PageOne()));
//         break;
//       case 1:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => PageTwo()));
//         break;
//       case 2:
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => MyReportsPage(
//                       studentId: '12110528',
//                     )));
//         break;
//       case 4:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => TipsPage()));
//         break;
//       case 5:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => StoriesPage()));
//         break;
//       case 6:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => FAQPage()));
//         break;
//       default:
//         break;
//     }
//   }

//   Widget _buildCard(BuildContext context, IconData icon, String label, VoidCallback onTap) {
//     // Check if the label is 'Progress Report'
//     if (label == 'Progress Report') {
//       return InkWell(
//         onTap: onTap,
//         child: Card(
//           color: Colors.purple, // Customize the color as needed
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 40),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   label,
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return SizedBox(
//         width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
//         child: InkWell(
//           onTap: onTap,
//           child: Card(
//             color: Colors.pinkAccent, // Default color for other cards
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(icon, size: 40),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Text(
//                     label,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import '../login/google_login_handler.dart';
import 'MyReportsPage.dart';
import 'recent_reports.dart';
import 'faq.dart';
import 'file_report_page.dart';
import 'stories.dart';
import 'tips.dart';
import 'package:provider/provider.dart';
import 'pagetwo.dart';

import '../../models/theme_provider.dart';

class StudentHomePage extends StatefulWidget {
  final ValueNotifier userCredential;
  const StudentHomePage({super.key, required this.userCredential});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final List<Widget> cards = [
      _buildCard(context, Icons.donut_large, 'Recent Reports', () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecentReportsPage(
                    userCredential: widget.userCredential,
                  )),
        );
      }),
      _buildCard(context, Icons.star, 'Old reports', () {
        // Your code to handle tap on other cards
      }),
      // Add other cards as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Unisafe'),
        ),
        backgroundColor: const Color.fromARGB(255, 156, 39, 176),
        actions: [
          Icon(
            Icons.dark_mode,
            color: themeProvider.isDark ? Colors.blueAccent : null,
            size: 20,
          ),
          SizedBox(
            width: 50,
            child: FittedBox(
              fit: BoxFit.fill,
              child: themeModeSwitch(context, themeProvider),
            ),
          ),
          Icon(
            Icons.light_mode,
            color: themeProvider.isDark ? null : Colors.orangeAccent,
            size: 20,
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 225, 187, 231),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("LPU"),
                accountEmail: Text("abc@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "L",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("LogOut"),
                onTap: () async {
                  Navigator.pop(context); //routes
                  bool result = await signOutFromGoogle();
                  if (result) widget.userCredential.value = '';
                },
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cards,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(7, (index) {
                final List<IconData> icons = [
                  Icons.dashboard,
                  Icons.psychology,
                  Icons.account_circle,
                  Icons.settings,
                  Icons.lightbulb_outline,
                  Icons.library_add,
                  Icons.help,
                ];
                final List<String> labels = [
                  "Report Incident",
                  "Support",
                  "My reports",
                  "Settings",
                  "Anonymous Tip",
                  "Stories",
                  "FAQ",
                ];

                IconData icon = icons[index];
                String label = labels[index];

                return Card(
                  color: Colors.pinkAccent,
                  elevation: 20,
                  child: InkWell(
                    onTap: () {
                      navigateToPage(context, index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 50),
                        Text(label),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_sharp),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        backgroundColor: const Color.fromARGB(255, 225, 187, 231),
        onTap: (index) {},
      ),
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FileReportPage(
              userCredential: widget.userCredential,
            ),
          ),
        );
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageTwo()));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyReportsPage(
                      userCredential: widget.userCredential,
                    )));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => TipsPage()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => StoriesPage()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
        break;
      default:
        break;
    }
  }

//   Widget _buildCard(BuildContext context, IconData icon, String label, VoidCallback onTap) {
//     // Check if the label is 'Progress Report'
//     if (label == 'Progress Report') {
//       return InkWell(
//         onTap: onTap,
//         child: Card(
//           color: Colors.purple, // Customize the color as needed
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 40),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   label,
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return SizedBox(
//         width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
//         child: InkWell(
//           onTap: onTap,
//           child: Card(
//             color: Colors.pinkAccent, // Default color for other cards
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(icon, size: 40),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Text(
//                     label,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }

  Widget _buildCard(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    double cardWidth = MediaQuery.of(context).size.width * 0.50; // Adjust this value as needed

    return SizedBox(
      width: cardWidth,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Colors.purple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
