// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<User?> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       final UserCredential userCredential = await _auth.signInWithCredential(credential);
//       await updateUserFirestore(userCredential.user);

//       bool isAdmin = await checkIfAdmin(userCredential.user!.email!);
//       if (isAdmin) {
//         // Redirect to admin page
//         // Replace the line below with the code to redirect to your admin page
//         // Example: Navigator.pushReplacementNamed(context, '/admin');
//       }
//       return userCredential.user;
//     }
//     return null;
//   }

//   Future<void> updateUserFirestore(User? user) async {
//     if (user != null) {
//       await _db.collection("users").doc(user.uid).set({
//         'uid': user.uid,
//         'email': user.email,
//         'displayName': user.displayName,
//         'lastLogin': DateTime.now(),
//       }, SetOptions(merge: true));
//     }
//   }

//   Future<bool> checkIfAdmin(String email) async {
//     DocumentSnapshot adminSnapshot = await _db.collection('admins').doc('admin_list').get();
    
//     if (adminSnapshot.exists) {
//       List<dynamic> adminEmails = adminSnapshot['admin_emails_list'];
//       if (adminEmails.contains(email.toString())) {
//         return true; // User is an admin
//       }
//     }
    
//     return false; // User is not an admin
//   }

//   Future<void> signOut() async {
//     await googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }
