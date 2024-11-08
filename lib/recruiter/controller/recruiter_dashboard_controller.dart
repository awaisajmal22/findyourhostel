import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/bindings/app_routes.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecruiterDashBoardController extends GetxController {
  logout() {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signOut();
    _storage.clearSession();
    Get.offAllNamed(AppRoutes.login);
  }

  late StorageRepo _storage;
  @override
  void onInit() {
    _storage = getIt();
    getHostels();
    // TODO: implement onInit
    super.onInit();
  }

  RxList<HostelAddModel> _hostelsList = <HostelAddModel>[].obs;
  List<HostelAddModel> get hostelsList => _hostelsList.value;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
 Future<void> getHostels() async {
  _loading.value = true;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  try {
    // Fetch the current user's UID from storage
    final _uid = await _storage.getUid();
    print('My UID $_uid');

    // Get all documents in the 'hostel' collection
    _firebase.collection('hostel').snapshots().listen(
      (QuerySnapshot snapshot) {
        _hostelsList.clear(); // Clear the list before adding new data

        if (snapshot.docs.isNotEmpty) {
          // Iterate over each document in the 'hostel' collection
          snapshot.docs.forEach((doc) {
            Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

            if (data != null && data.containsKey('uuid') && data['uuid'] == _uid) {
              // Convert each document's data to a HostelAddModel and add it to _hostelsList
              _hostelsList.add(HostelAddModel.fromJson(data));
            }
          });

          // Sort the hostels list by createdDate (if applicable)
          _hostelsList.sort((a, b) => b.createdDate!.compareTo(a.createdDate!));
        } else {
          _hostelsList.clear(); // Clear list if no documents are found
        }

        _loading.value = false; // Stop loading after data is processed
      },
      onError: (error) {
        print('Error fetching hostels: $error');
        _loading.value = false; // Stop loading in case of an error
      },
    );
  } catch (e) {
    print('Error fetching hostels: $e');
    _loading.value = false; // Ensure loading stops in case of an exception
  }
}
List<String> roomTypes = [
    'Private Room',
    '2 Sharing',
    '3 Sharing',
    '4 Sharing',
    '5 Sharing',
    '6 Sharing',
  ];
 Future<void> deleteHostel(String docId) async {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  try {
    // Query the 'hostel' collection for a document where the 'docId' field matches the given docId
    QuerySnapshot snapshot = await _firebase
        .collection('hostel')
        .where('docId', isEqualTo: docId)
        .get();

    if (snapshot.docs.isNotEmpty) {
      // Assuming the query will only return one document
      DocumentReference docRef = snapshot.docs.first.reference;

      // Delete the document
      await docRef.delete();
      print('Document with docId $docId deleted successfully.');
    } else {
      print('No document found with docId $docId.');
    }
  } catch (e) {
    print('Error deleting document: $e');
  }
}

  }

