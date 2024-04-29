import 'package:fire_flutter/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    // Create an instance of the Firebase Authb and Google sign in
    final GoogleSignIn googleSignIn = GoogleSignIn();

    //Authentication Flow

    final GoogleSignInAccount? googleuser = await googleSignIn.signIn();

    //Obtain aiuth Details

    final GoogleSignInAuthentication googleAuth =
        await googleuser!.authentication;
    // create credentials

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

//Sign in the user
    // ignore: unused_local_variable
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("Login");
      Fluttertoast.showToast(
        msg: "Login successful",
        backgroundColor: Colors.green[600],
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        print("email id dose not exists");
        Fluttertoast.showToast(
          msg: "Email id dose not exists",
          backgroundColor: Colors.red[400],
        );
      } else if (ex.code == "wrong-password") {
        print("Wrong password");
        Fluttertoast.showToast(
          msg: "Wrong password",
          backgroundColor: Colors.red[400],
        );
      }
    }
  }

  Future<void> createAccount(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("Account Created");
      Fluttertoast.showToast(
        msg: "Account Created",
        backgroundColor: Colors.green[600],
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
        Fluttertoast.showToast(
          msg: "Week Password",
          backgroundColor: Colors.orange[400],
        );
        print("Weak Password");
      } else if (ex.code == "email-already-in-use") {
        Fluttertoast.showToast(
          msg: "Email Already exists",
          backgroundColor: Colors.red[400],
        );
        print("Email Already exists Login Please !");
      } else if (ex.code == "em") {
        Fluttertoast.showToast(
          msg: "Email Already exists",
          backgroundColor: Colors.red[400],
        );
        print("Email Already exists Login Please !");
      }
    } catch (ex) {
      print(ex);
    }
  }
}
