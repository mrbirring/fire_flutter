import 'package:fire_flutter/admin/signup.dart';
import 'package:fire_flutter/contoller/firebasecont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  SignupController fb = Get.put(SignupController());
  final email_textcontoller = TextEditingController();
  final pass_textcontoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
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
                    "L0gIn",
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
                    controller: pass_textcontoller,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await fb.signInWithGoogle();
                      },
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {
                      fb.signIn(
                          email_textcontoller.text, pass_textcontoller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 3,
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
                      "Dont't have account yet?..",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup_page()),
                        );
                      },
                      child: const Text(
                        "Sign Up here",
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
    );
  }
}
