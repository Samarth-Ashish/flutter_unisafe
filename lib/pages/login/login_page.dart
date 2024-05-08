import 'package:flutter/material.dart';
import 'google_login_handler.dart';

class SignupPage extends StatefulWidget {
  final ValueNotifier userCredential;
  const SignupPage({super.key, required this.userCredential});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Text(
                      // "Sign up",
                      "Welcome to UniSafe",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   "Create your account",
                    //   style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    // )
                  ],
                ),
                const Column(
                  children: <Widget>[
                    // TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "Username",
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(18),
                    //           borderSide: BorderSide.none),
                    //       fillColor: Colors.purple.withOpacity(0.1),
                    //       filled: true,
                    //       prefixIcon: const Icon(Icons.person)),
                    // ),

                    // const SizedBox(height: 20),

                    // TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "Email",
                    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
                    //       fillColor: Colors.purple.withOpacity(0.1),
                    //       filled: true,
                    //       prefixIcon: const Icon(Icons.email)),
                    // ),

                    // const SizedBox(height: 20),

                    // TextField(
                    //   decoration: InputDecoration(
                    //     hintText: "Password",
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
                    //     fillColor: Colors.purple.withOpacity(0.1),
                    //     filled: true,
                    //     prefixIcon: const Icon(Icons.password),
                    //   ),
                    //   obscureText: true,
                    // ),

                    // const SizedBox(height: 20),

                    // TextField(
                    //   decoration: InputDecoration(
                    //     hintText: "Confirm Password",
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
                    //     fillColor: Colors.purple.withOpacity(0.1),
                    //     filled: true,
                    //     prefixIcon: const Icon(Icons.password),
                    //   ),
                    //   obscureText: true,
                    // ),
                  ],
                ),
                // Container(
                //   padding: const EdgeInsets.only(top: 3, left: 3),
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //       shape: const StadiumBorder(),
                //       padding: const EdgeInsets.symmetric(vertical: 16),
                //       backgroundColor: Colors.purple,
                //     ),
                //     child: const Text(
                //       "Sign up",
                //       style: TextStyle(fontSize: 20, color: Colors.black),
                //     ),
                //   ),
                // ),
                // const Center(child: Text("Or")),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.purple,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () async {
                      // widget.userCredential.value = {'userCredential': await signInWithGoogle(), 'isAdmin': null};
                      // widget.userCredential.value['isAdmin'] =
                      //     await checkIfAdmin(widget.userCredential.value['userCredential'].user!.email);
                      // if (widget.userCredential.value != null) {
                      //   debugPrint(widget.userCredential.value['userCredential'].user!.email);
                      // }
                      widget.userCredential.value = await signInWithGoogle();
                      // widget.isAdmin.value = await checkIfAdmin(widget.userCredential.value.user!.email);
                      if (widget.userCredential.value != null || widget.userCredential == ValueNotifier(null)) {
                        debugPrint("\n Logged In using \n\n ======= ${widget.userCredential.value.user!.email} \n============");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            // image: DecorationImage(image: AssetImage('assets/images/download.png'), fit: BoxFit.cover),

                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Text(
                          "Sign In with Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     const Text("Already have an account?"),
                //     TextButton(
                //         onPressed: () {
                //           Navigator.pushNamed(context, '/signin');
                //         },
                //         child: const Text(
                //           "Login",
                //           style: TextStyle(color: Colors.purple),
                //         ))
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
