import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repositories/storage/storage_repo.dart';

class SeekerSearchController extends GetxController {
  TextEditingController search = TextEditingController();
  RxBool _isListView = false.obs;
  bool get isListView => _isListView.value;
  ChangeListView() {
    _isListView.value = !_isListView.value;
  }

  RxList<HostelAddModel> _hostelsList = <HostelAddModel>[].obs;
  List<HostelAddModel> get hostelsList => _hostelsList.value;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  Future<void> getHostels() async {
    _loading.value = true;
    FirebaseFirestore _firebase = FirebaseFirestore.instance;

    try {
      // Fetch all documents in the 'hostel' collection
      _firebase.collection('hostel').snapshots().listen(
        (QuerySnapshot snapshot) {
          _hostelsList.clear(); // Clear the list before adding new data

          if (snapshot.docs.isNotEmpty) {
            // Iterate over each document in the 'hostel' collection
            snapshot.docs.forEach((doc) {
              Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

              if (data != null) {
                // Convert each document's data to a HostelAddModel and add it to _hostelsList
                _hostelsList.add(HostelAddModel.fromJson(data));
              }
            });

            // Sort the hostels list by createdDate (if applicable)
            _hostelsList
                .sort((a, b) => b.createdDate!.compareTo(a.createdDate!));
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

  RxList<HostelAddModel> _filterList = <HostelAddModel>[].obs;
  List<HostelAddModel> get filterList => _filterList.value;
  void searchHostel(String value) {
    _filterList.clear();

    if (value.isEmpty) {
      _filterList.value = []; // Clear the filter list if search value is empty
      return;
    }

    // Add only items where name contains the search term
    _filterList.value = _hostelsList
        .where((data) =>
            data.name!.toLowerCase().contains(value.toLowerCase()) ||
                data.address!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  late StorageRepo _storage;
  @override
  void onInit() {
    _storage = getIt();
    getHostels();
    super.onInit();
  }
}
