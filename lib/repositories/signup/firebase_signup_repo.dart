import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/repositories/signup/signup_repo.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class FirebaseSignupRepo implements SignupRepo {
  @override
  Future<bool> signup({
    required int gender,
    required BuildContext context,
    required String email,
    required String password,
    required int role,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    bool isSuccess = false;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
          'passowrd': password,
          'role': role,
          'gender': gender,
          'createdAt': FieldValue.serverTimestamp(),
        });
        isSuccess = true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toast(msg: 'The password is too weak.', context: context);
      } else if (e.code == 'email-already-in-use') {
        toast(
            msg: 'The account already exists for that email.',
            context: context);
      } else if (e.code == 'invalid-email') {
        toast(msg: 'The email is invalid.', context: context);
      } else {
        toast(msg: 'The email is invalid.', context: context);
      }
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }
}
