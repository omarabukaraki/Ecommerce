import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class UserProvider extends ChangeNotifier {
  late UserModel _user = UserModel();

  UserModel get user => _user;

  Future<void> fetchUser() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (var doc in snapshot.docs) {
        if (doc['id'] == userId) {
          _user = UserModel.fromJson(doc.data());
          break;
        }
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
