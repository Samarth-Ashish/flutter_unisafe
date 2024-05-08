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

  // ValueNotifier isAdmin = false as ValueNotifier;

  // GoogleSignInAccount? _currentUser;
  // bool _isAuthorized = false; // has granted permissions?
  // String _contactText = '';

  // @override
  // void initState() {
  //   super.initState();

  //   _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
  //     if (account != null) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => StudentHomePage(),
  //         ),
  //       );
  //     }
  //   });
  //   _googleSignIn.signInSilently();
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
  //     // #docregion CanAccessScopes
  //     // In mobile, being authenticated means being authorized...
  //     bool isAuthorized = account != null;
  //     // However, on web...
  //     if (kIsWeb && account != null) {
  //       isAuthorized = await _googleSignIn.canAccessScopes(scopes);
  //     }
  //     // #enddocregion CanAccessScopes
  //     setState(() {
  //       _currentUser = account;
  //       _isAuthorized = isAuthorized;
  //     });
  //     // Now that we know that the user can access the required scopes, the app
  //     // can call the REST API.
  //     // if (isAuthorized) {
  //     //   unawaited(_handleGetContact(account!));
  //     // }
  //   });

  //   // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
  //   //
  //   // It is recommended by Google Identity Services to render both the One Tap UX
  //   // and the Google Sign In button together to "reduce friction and improve
  //   // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
  //   _googleSignIn.signInSilently();
  // }

  // // Calls the People API REST endpoint for the signed-in user to retrieve information.
  // Future<void> _handleGetContact(GoogleSignInAccount user) async {
  //   setState(() {
  //     _contactText = 'Loading contact info...';
  //   });
  //   final http.Response response = await http.get(
  //     Uri.parse('https://people.googleapis.com/v1/people/me/connections'
  //         '?requestMask.includeField=person.names'),
  //     headers: await user.authHeaders,
  //   );
  //   if (response.statusCode != 200) {
  //     setState(() {
  //       _contactText = 'People API gave a ${response.statusCode} '
  //           'response. Check logs for details.';
  //     });
  //     print('People API ${response.statusCode} response: ${response.body}');
  //     return;
  //   }
  //   final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
  //   final String? namedContact = _pickFirstNamedContact(data);
  //   setState(() {
  //     if (namedContact != null) {
  //       _contactText = 'I see you know $namedContact!';
  //     } else {
  //       _contactText = 'No contacts to display.';
  //     }
  //   });
  // }

  // String? _pickFirstNamedContact(Map<String, dynamic> data) {
  //   final List<dynamic>? connections = data['connections'] as List<dynamic>?;
  //   final Map<String, dynamic>? contact = connections?.firstWhere(
  //     (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
  //     orElse: () => null,
  //   ) as Map<String, dynamic>?;
  //   if (contact != null) {
  //     final List<dynamic> names = contact['names'] as List<dynamic>;
  //     final Map<String, dynamic>? name = names.firstWhere(
  //       (dynamic name) => (name as Map<Object?, dynamic>)['displayName'] != null,
  //       orElse: () => null,
  //     ) as Map<String, dynamic>?;
  //     if (name != null) {
  //       return name['displayName'] as String?;
  //     }
  //   }
  //   return null;
  // }

  // This is the on-click handler for the Sign In button that is rendered by Flutter.
  //
  // On the web, the on-click handler of the Sign In button is owned by the JS
  // SDK, so this method can be considered mobile only.
  // #docregion SignIn
  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // Prompts the user to authorize scopes.
  //
  // This action is *required* in platforms that don't perform Authentication
  // and Authorization at the same time (like the web).
  //
  // On the web, this must be called from an user interaction (button click).
  // #docregion RequestScopes
  // Future<void> _handleAuthorizeScopes() async {
  //   final bool isAuthorized = await _googleSignIn.requestScopes(scopes);
  //   // #enddocregion RequestScopes
  //   setState(() {
  //     _isAuthorized = isAuthorized;
  //   });
  //   // #docregion RequestScopes
  //   if (isAuthorized) {
  //     unawaited(_handleGetContact(_currentUser!));
  //   }
  //   // #enddocregion RequestScopes
  // }

  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

  // Widget _buildBody() {
  //   final GoogleSignInAccount? user = _currentUser;
  //   if (user != null) {
  //     // The user is Authenticated
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: <Widget>[
  //         ListTile(
  //           leading: GoogleUserCircleAvatar(
  //             identity: user,
  //           ),
  //           title: Text(user.displayName ?? ''),
  //           subtitle: Text(user.email),
  //         ),
  //         const Text('Signed in successfully.'),
  //         if (_isAuthorized) ...<Widget>[
  //           // The user has Authorized all required scopes
  //           Text(_contactText),
  //           ElevatedButton(
  //             child: const Text('REFRESH'),
  //             onPressed: () => _handleGetContact(user),
  //           ),
  //         ],
  //         if (!_isAuthorized) ...<Widget>[
  //           // The user has NOT Authorized all required scopes.
  //           // (Mobile users may never see this button!)
  //           const Text('Additional permissions needed to read your contacts.'),
  //           ElevatedButton(
  //             onPressed: _handleAuthorizeScopes,
  //             child: const Text('REQUEST PERMISSIONS'),
  //           ),
  //         ],
  //         ElevatedButton(
  //           onPressed: _handleSignOut,
  //           child: const Text('SIGN OUT'),
  //         ),
  //       ],
  //     );
  //   } else {
  //     // The user is NOT Authenticated
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: <Widget>[
  //         const Text('You are not currently signed in.'),
  //         // This method is used to separate mobile from web code with conditional exports.
  //         // See: src/sign_in_button.dart
  //         ElevatedButton(onPressed: _handleSignIn, child: const Text('Sign in')),
  //       ],
  //     );
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: _buildBody(),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return ValueListenableBuilder(
  //       valueListenable: userCredential,
  //       builder: (context, value, child) {
  //         return (userCredential.value == '' || userCredential.value == null)
  //             ? SignupPage(userCredential: userCredential)
  //             // : StudentHomePage(userCredential: userCredential);
  //             : (userCredential.value.user!.email == 'samarthashish111@gmail.com'
  //                 ? AdminDashboard(userCredential: userCredential)
  //                 : StudentHomePage(userCredential: userCredential));
  //       });
  // }

  //

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: userCredential,
      builder: (context, value, child) {
        if (userCredential.value == '' || userCredential.value == null) {
          return SignupPage(userCredential: userCredential);
        } else {
          // Fetch the list of allowed emails from Firestore
          return FutureBuilder(
            future: fetchAllowedEmails(userCredential.value.user!.email!.toString()), // Implement fetchAllowedEmails() function
            builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
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
      CollectionReference adminsCollection = FirebaseFirestore.instance.collection('admins');
      DocumentSnapshot adminListDoc = await adminsCollection.doc('admin_list').get();

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

  // @override
  // Widget build(BuildContext context) {
  //   return ValueListenableBuilder(
  //     valueListenable: userCredential,
  //     builder: (context, value, child) {
  //       if (userCredential.value == '' || userCredential.value == null) {
  //         return SignupPage(userCredential: userCredential);
  //       } else {
  //         // Fetch the map of allowed emails and values from Firestore
  //         return FutureBuilder(
  //           future: fetchAllowedEmails(),
  //           builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return const CircularProgressIndicator(); // Show loading indicator
  //             } else if (snapshot.hasError) {
  //               return Text('Error: ${snapshot.error}');
  //             } else {
  //               // Map<String, dynamic> allowedEmailsMap = snapshot.data!;
  //               // String currentUserEmail = userCredential.value.user!.email!;
  //               // if (allowedEmailsMap.containsKey(currentUserEmail)) {
  //               //   // Fetch the corresponding value from the map
  //               //   dynamic correspondingValue = allowedEmailsMap[currentUserEmail];
  //               //   // Now you can use the correspondingValue as needed
  //               //   // For example, if it's a number:
  //               //   int correspondingNumber = correspondingValue as int;
  //               //   print('Corresponding number for $currentUserEmail: $correspondingNumber');
  //               //   return AdminDashboard(
  //               //     userCredential: userCredential,
  //               //     block: correspondingNumber,
  //               //   );
  //               // } else {
  //                 return StudentHomePage(userCredential: userCredential);
  //               // }
  //             }
  //           },
  //         );
  //       }
  //     },
  //   );
  // }

  // Future<Map<String, dynamic>> fetchAllowedEmails() async {
  //   try {
  //     // Get the "admins" collection
  //     CollectionReference adminsCollection = FirebaseFirestore.instance.collection('admins');

  //     // Get the "admin_list" document
  //     DocumentSnapshot adminListDoc = await adminsCollection.doc('admin_list').get();

  //     // Get the "admin_emails_list" map from the document
  //     Map<String, dynamic>? adminEmailsMap = adminListDoc['admin_emails_list'];

  //     if (adminEmailsMap != null) {
  //       // Return the admin emails map
  //       return adminEmailsMap;
  //     } else {
  //       // If the map is empty or null, return an empty map
  //       return {};
  //     }
  //   } catch (e) {
  //     // Handle any errors
  //     print('Error fetching allowed emails: $e');
  //     throw Exception('Failed to fetch allowed emails');
  //   }
  // }
}

Future<UserCredential?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is an admin
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
    DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance.collection('admins').doc('admin_list').get();

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
