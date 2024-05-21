import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../admin/admin_dashboard.dart';
import '../student/student_homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

import 'login_page.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>[
//     'email',
//   ],
// );

/// The scopes required by this application.
// const List<String> scopes = <String>[
//   'email',
//   'https://www.googleapis.com/auth/contacts.readonly',
// ];

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: 'your-client_id.apps.googleusercontent.com',
//   scopes: scopes,
// );

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});
  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

// GoogleSignIn googleSignIn =
//     GoogleSignIn(clientId: const String.fromEnvironment("795818918492-32034kodv772djiuub711ndpr5s9tt3o.apps.googleusercontent.com"));

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  ValueNotifier userCredential = ValueNotifier('');
  int? blockNumber = 0;
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    signOutFromGoogle();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(
    //   userCredential.value.user!.email!.toString(),
    // );
    return ValueListenableBuilder(
      valueListenable: userCredential,
      builder: (context, value, child) {
        if (userCredential.value == '' || userCredential.value == null) {
          return SignupPage(userCredential: userCredential);
        } else {
          // Fetch the list of allowed emails from Firestore
          return FutureBuilder(
            future: fetchAllowedEmails(
              userCredential.value.user!.email!.toString(),
            ), // Implement fetchAllowedEmails() function
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // return Container(child: const CircularProgressIndicator()); // Show loading indicator
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<String> allowedEmails = snapshot.data!;
                String currentUserEmail = userCredential.value.user!.email!;
                if (allowedEmails.contains(currentUserEmail)) {
                  return AdminDashboard(
                    userCredential: userCredential,
                    block: blockNumber!,
                  );
                } else {
                  return StudentHomePage(userCredential: userCredential);
                }
              }
            },
          );
        }
      },
    );
  }

  Future<List<String>> fetchAllowedEmails(String userEmail) async {
    try {
      CollectionReference adminsCollection =
          FirebaseFirestore.instance.collection('admins');
      DocumentSnapshot adminListDoc =
          await adminsCollection.doc('admin_list').get();

      Map<String, dynamic>? adminEmailsMap = adminListDoc['admins_with_block'];

      if (adminEmailsMap != null) {
        List<String> allowedEmails = adminEmailsMap.keys.toList();
        blockNumber = adminEmailsMap[userEmail];
        return allowedEmails;
      } else {
        // debugPrint('==================\n empty =============');
        return [];
      }
    } catch (e) {
      // Handle any errors
      debugPrint('Error fetching allowed emails: $e');
      throw Exception('Failed to fetch allowed emails');
    }
  }
}

Future<UserCredential?> signInWithGoogle() async {
  try {
    // await signOutFromGoogle();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // bool isAdmin = await checkIfAdmin(userCredential.user!.email!);
      // if (isAdmin) {
      //   // Redirect to admin page
      //   // Replace the line below with the code to redirect to your admin page
      //   // Example: Navigator.pushReplacementNamed(context, '/admin');
      // }

      return userCredential;
    }
  } catch (e) {
    debugPrint('Sign in with Google failed: $e');
  }
  return null;
}

Future<bool> checkIfAdmin(String userEmail) async {
  try {
    // Get the list of admin emails from Firestore
    DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
        .collection('admins')
        .doc('admin_list')
        .get();

    if (adminSnapshot.exists) {
      List<dynamic> adminEmails = adminSnapshot['admins_with_block'];
      if (adminEmails.contains(userEmail)) {
        return true; // User is an admin
      }
    }
  } catch (e) {
    debugPrint('Error checking admin status: $e');
  }

  return false; // User is not an admin or error occurred
}

Future<bool> signOutFromGoogle() async {
  try {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    debugPrint('Logged out successfully');
    return true;
  } catch (e) {
    debugPrint('Sign out failed: $e');
    return false;
  }
}
