import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;

  // initialized firebase app
  Future<FirebaseApp> _initializedFirebase() async {
    FirebaseApp firebaseapp = await Firebase.initializeApp();
    return firebaseapp;
  }

  // login function
  Future<User?> loginUsingEmailPass(
      {required String email, required String password}) async {
    User? user;
    try {
      UserCredential usercredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = usercredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("User not found");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializedFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(16),
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(40),
                        child: Text("My Irrigation",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("images/ag.gif")),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Login to your account!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "User Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black54,
                            )),
                        onChanged: ((value) {
                          _email = value;
                        }),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "User Password",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.black54,
                            )),
                        onChanged: ((value) {
                          _password = value;
                        }),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Take user to forgot password screen
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: <Color>[
                                    Color.fromARGB(255, 6, 249, 119),
                                    Color.fromARGB(255, 97, 156, 214),
                                    Color(0xFF42A5F5),
                                  ])),
                                ),
                              ),
                              TextButton(
                                  onPressed: () async {
                                    // DONE: Take user to user screen
                                    User? user = await loginUsingEmailPass(
                                        email: _email, password: _password);
                                    // check the user
                                    if (user != null) {
                                      Navigator.pushNamed(context,'/userScreen');
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
