import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/models/user_model/user_model.dart';
import 'package:findyourhostel/repositories/login/login_repo.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirebaseLoginRepo implements LoginRepo {
  @override
  Future<UserModel> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    UserModel user = UserModel.fromJson({});
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot userData = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userData.exists) {
        Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
        print('USER ID $data');
        user = UserModel.fromJson(data);
      } else {
        print("No user data found in Firestore.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        toast(
            msg:
                'Invalid credentials please check email and password and try again.',
            context: context);
      } else if (e.code == 'user-not-found') {
        toast(msg: 'No user found for that email.', context: context);
      } else if (e.code == 'wrong-password') {
        toast(msg: 'Wrong password provided for that user.', context: context);
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e);
    }

    return user;
  }
}
