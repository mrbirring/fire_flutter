import 'package:firebase_auth/firebase_auth.dart';
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
}
