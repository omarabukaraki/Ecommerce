// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/constant/app_constants.dart';
import 'package:ecommerce/view/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/screens/login_page.dart';

class FirebaseAuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  User get user => auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<void> signUpMethod(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      users.doc(auth.currentUser!.uid).set({
        'id': auth.currentUser!.uid,
        'firstName': firstName.trim(),
        'lastName': lastName.trim(),
        'email': email.trim(),
      });
      showSnackBar(context,
          'The account has been created successfully, you can now sign in');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> loginMethod(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else {
        showSnackBar(context, 'Your email or password is wrong');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> logoutMethod({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const LoginPage();
      },
    ), (route) => false);
  }
}
