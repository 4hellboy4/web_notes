import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_web/providers/sign_up_provider.dart';
import 'package:notes_web/shared_preferences/user_pref.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String? uid;
String? password;

class FirebaseFunctions {
  Future<User?> signUpWithEmailPassword(
      String email, String password, BuildContext context) async {
    User? user;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('An account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  Future<User?> SignInEmailPassword(
      String email, String password, BuildContext context) async {
    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;

      if (user != null) {
        Provider.of<SignUpProvider>(context)
            .setInfo(user.uid, user.email ?? "");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  Future<String> signOutFirebase() async {
    await _auth.signOut();

    UserInfoDb().singOut();

    return 'User signed out';
  }
}
