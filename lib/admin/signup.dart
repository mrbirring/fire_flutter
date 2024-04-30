import 'package:fire_flutter/admin/Login.dart';
import 'package:fire_flutter/contoller/firebasecont.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup_page extends StatefulWidget {
  const Signup_page({super.key});

  @override
  State<Signup_page> createState() => _Signup_pageState();
}

class _Signup_pageState extends State<Signup_page> {
  SignupController fb = Get.put(SignupController());
  final email_textcontoller = TextEditingController();
  final pass_textcontoller = TextEditingController();
  final fname_textcontoller = TextEditingController();
  final Uname_textcontoller = TextEditingController();
  final conf_pass_textcontoller = TextEditingController();
  late String password;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SignUp Page",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Spacer(),
                  const Text(
                    "SigNuP Page",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu_open,
                      color: Colors.white,
                    ),
                    hoverColor: Colors.white10,
                    highlightColor: Colors.white30,
                  )
                ]),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Center(
                      child: Image.asset(
                        "imgs/firelogo.png",
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: TextFormField(
                        controller: fname_textcontoller,
                        // validator: (value) {
                        //   if (value == null || value.length < 8) {
                        //     return "Enter some thing";
                        //   }
                        //   return null;
                        // },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'Enter FullName',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: TextFormField(
                        controller: email_textcontoller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'Email Here...',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: TextFormField(
                        controller: Uname_textcontoller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'Enter UserName',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: TextFormField(
                        controller: pass_textcontoller,
                        onEditingComplete: () {},
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'PassWord Here...',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: TextFormField(
                        controller: conf_pass_textcontoller,
                        onEditingComplete: () {},
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email_textcontoller.text,
                                    password: pass_textcontoller.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginpage()));
                            }).onError((error, stackTrace) {
                              print(error);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have account?",
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()),
                            );
                          },
                          child: const Text(
                            "Login here",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
