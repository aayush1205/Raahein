import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
    Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
      
    ))
        .user.uid;
  }
  
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user.uid;
  }

  Future<String> currentUser() async {
    return (await _firebaseAuth.currentUser()).uid;
  }
    Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
    

  
   Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _auth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: _auth.accessToken,
      idToken: _auth.idToken,
    );

    return (await _firebaseAuth.signInWithCredential(credential)).user.uid;
  }

}

