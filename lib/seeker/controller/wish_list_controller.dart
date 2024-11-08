import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/models/wish_list_model/wish_list_model.dart';
import 'package:get/get.dart';

import '../../models/hostel_add_model/hostel_add_model.dart';

class WishListController extends GetxController {
  RxList<HostelAddModel> _hostelsList = <HostelAddModel>[].obs;
  List<HostelAddModel> get hostelsList => _hostelsList.value;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  Future<void> getFavorties() async {
    _loading.value = true;
    FirebaseFirestore _firebase = FirebaseFirestore.instance;

    try {
      // Fetch all documents in the 'hostel' collection
      _firebase.collection('favorites').snapshots().listen(
        (QuerySnapshot snapshot) {
          _hostelsList.clear(); // Clear the list before adding new data

          if (snapshot.docs.isNotEmpty) {
            // Iterate over each document in the 'hostel' collection
            snapshot.docs.forEach((doc) async {
              Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

              if (data != null) {
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

  @override
  void onInit() {
    getFavorties();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> toggleFavoriteStatus(HostelAddModel hostel) async {
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    final String hostelId = hostel.docId!;

    try {
      // Reference to the 'hostel' document
      DocumentReference hostelDoc =
          _firebase.collection('hostel').doc(hostelId);

      if (hostel.favorite == true) {
        // Remove from favorites and update 'favorite' to false
        await _firebase.collection('favorites').doc(hostelId).delete();
        await hostelDoc.update({'favorite': false});

        // Update local model with favorite set to false
        hostel = hostel.copyWith(favorite: false);
      } else {
        // Add to favorites and update 'fxwxavorite' to true
        await _firebase
            .collection('favorites')
            .doc(hostelId)
            .set(hostel.copyWith(favorite: true).toJson());
        await hostelDoc.update({'favorite': true});

        // Update local model with favorite set to true
        hostel = hostel.copyWith(favorite: true);
      }

      print('Favorite status toggled for hostel: ${hostel.name}');
    } catch (e) {
      print('Error toggling favorite status: $e');
    }
  }
}
