import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_web/providers/sign_up_provider.dart';
import 'package:notes_web/router/my_router.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String? uid;
String? password;

class FirebaseFunctions {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<User?> signUpWithEmailPassword(
      String email, String password, BuildContext context) async {
    User? user;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null && !FirebaseAuth.instance.currentUser!.emailVerified) {
        users.doc(user.uid).set({
          "email": email,
          "notes": [],
        });
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }
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

  Future<User?> signInEmailPassword(
      String email, String password, BuildContext context) async {
    User? user;

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;

      if (user != null) {
        Provider.of<SignUpProvider>(context, listen: false)
            .setInfo(user.uid, user.email ?? "");
        Provider.of<SignUpProvider>(context, listen: false).signIn();
        GoRouter.of(context).go(MyRouter.home);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
      else {
        print(e);
      }
    }

    return user;
  }

  Future<String> signOutFirebase(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Provider.of<SignUpProvider>(context, listen: false).signOut();

    return 'User signed out';
  }
}
