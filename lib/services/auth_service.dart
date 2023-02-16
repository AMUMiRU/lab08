import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  Future<void> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print("sussess");
    } catch (err) {
      print(err);
    }
  }
  void googlesignout(){
    
  }
}