import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter06/Services/database.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:google_sign_in/google_sign_in.dart';

var x = houseSpec(2, 3, 4);

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //gets changes in user sign in/out state auth change stream
  Stream<User?> get users {
    return _auth.authStateChanges();
  }

  //sign in with email and password
  Future signInemail(dynamic email, dynamic password) async {
    try {
      UserCredential usercred01 = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user01 = usercred01.user!;
      print(user01);
      return user01;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return null;
    }
  }

  //register with email and password
  Future signUpemail(String email02, String password02, String username) async {
    try {
      UserCredential usercred01 = await _auth.createUserWithEmailAndPassword(
          email: email02, password: password02);
      User user01 = usercred01.user!;

      databaseService(user01.uid).createuserindatabase(
          username,
          "https://firebasestorage.googleapis.com/v0/b/rentus02-39256.appspot.com/o/profile.png?alt=media&token=525c13cd-bf4b-427d-961e-c994fe0a0dca",
          email02);
      return user01;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }

  //create house listing

}

class googlesigninprovider extends ChangeNotifier {
  final googlesignin = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googlelogin() async {
    final googleuser = await googlesignin.signIn();

    if (googleuser == null) return null;
    _user = googleuser;

    final googleauth = await googleuser.authentication;

    final credentials = GoogleAuthProvider.credential(
        accessToken: googleauth.accessToken, idToken: googleauth.idToken);

    UserCredential credentialusr =
        await FirebaseAuth.instance.signInWithCredential(credentials);

    await FirebaseFirestore.instance
        .collection("user")
        .doc(credentialusr.user!.uid)
        .set({
      "uid": credentialusr.user!.uid,
      "username": googleuser.displayName,
      "imageurl": googleuser.photoUrl,
      "email": googleuser.email
    });
    print(googleuser.photoUrl);

    notifyListeners();
  }
}


/**
 * 
 * //create new user data in databse for new user
      databaseService(user01.uid).updateAkerayhouselistingData(
          "asdfasdf02",
          "Entire 2 bed apartmenr",
          "Luxurious 2 bed pension with amenities",
          4,
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
          ["wifi", "Kitchen", "Parking"],
          "Addis Ababa, Eth",
          ["no pets", "no stuff"],
          25,
          "https://firebasestorage.googleapis.com/v0/b/rentus02-39256.appspot.com/o/imagestest%2F958755_5755830_2-2_updates.jpg?alt=media&token=ce4d1e73-3109-42fc-b7aa-be88811c7056");
 */