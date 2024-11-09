import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:ionicons/ionicons.dart';

import '../../models/booking_model/booking_model.dart';

class DetailController extends GetxController {
  RxInt _selectedImage = 0.obs;
  int get selectImage => _selectedImage.value;
  onImageChange(int index) {
    _selectedImage.value = index;
  }

  List<String> roomTypes = [
    'Private Room',
    '2 Sharing',
    '3 Sharing',
    '4 Sharing',
    '5 Sharing',
    '6 Sharing',
  ];
  List<AmModel> aminties = [
    AmModel(icon: Ionicons.stop, title: 'Parking'),
    AmModel(icon: Ionicons.wifi, title: 'Wifi'),
    AmModel(icon: Ionicons.tv, title: 'TV'),
    AmModel(icon: Ionicons.water_sharp, title: 'Loundary'),
    AmModel(icon: Icons.security, title: 'Security'),
    AmModel(icon: Ionicons.ice_cream, title: 'Refregenrator'),
    AmModel(icon: Icons.camera_indoor_sharp, title: 'CCTV'),
  ];

  RxBool _onMapCameraMove = false.obs;
  bool get onMapCameraMove => _onMapCameraMove.value;
  onCameraMove(bool val) {
    _onMapCameraMove.value = val;
  }

  RxList<BookingModel> _bookedHostel = <BookingModel>[].obs;
  List<BookingModel> get bookedHostel => _bookedHostel.value;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  Future<void> getBookings() async {
    _loading.value = true;
    FirebaseFirestore _firebase = FirebaseFirestore.instance;

    try {
      // Fetch all documents in the 'hostel' collection
      _firebase.collection('booking').snapshots().listen(
        (QuerySnapshot snapshot) {
          _bookedHostel.clear(); // Clear the list before adding new data

          if (snapshot.docs.isNotEmpty) {
            // Iterate over each document in the 'hostel' collection
            snapshot.docs.forEach((doc) async {
              Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

              if (data != null) {
                List<BookingModel> d = [];

                d.add(BookingModel.fromJson(data));
                for (var x in d) {
                  // if (x.bookerId == await _storageRepo.getUid()) {
                  _bookedHostel.add(x);
                  // }
                }
              }
            });

            // Sort the hostels list by createdDate (if applicable)
            _bookedHostel
                .sort((a, b) => b.createdDate!.compareTo(a.createdDate!));
          } else {
            _bookedHostel.clear(); // Clear list if no documents are found
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

  late StorageRepo _storageRepo;
  RxInt _gender = (-1).obs;
int get gender => _gender.value;
getGender() async {
  _gender.value = await _storageRepo.getGender();
}
  @override
  void onInit() {
    _storageRepo = getIt();
    getBookings();
    getGender();
    getUserDataFromFirestore();
    // TODO: implement onInit
    super.onInit();
  }

  String getAvailableRoom(String name, int room) {
    // Filter _bookedHostel to get only those with the matching name
    List<HostelAddModel> matchingHostels = _bookedHostel
        .map((m) => HostelAddModel.fromJson(m.hostel_model!))
        .where((hostel) => hostel.name == name)
        .toList();

    // Print the count of matching hostels (for debugging)
    print("Booked Data ${matchingHostels.length}");

    // Calculate available rooms by subtracting the count of matching hostels
    if (room > 0) {
      final availableRooms = room - matchingHostels.length;
      return availableRooms.toString();
    } else {
      return room.toString();
    }
  }

  RxDouble _rating = (0.0).obs;
  double get rating => _rating.value;
  TextEditingController comment = TextEditingController();
  changeRating(double val) {
    _rating.value = val;
  }

  RxBool _isReview = true.obs;
  bool get isRaview => _isReview.value;
  Future<void> addReview(String docId, BuildContext context) async {
    List<Review> reviewList = await getHostelReviews(docId);
    _isReview.value = false;
    String uid = await _storageRepo.getUid();
    if (reviewList.isEmpty) {
      try {
        final review = Review(
            image: _image.value,
            name: _name.value,
            uuid: uid,
            description: comment.text,
            star: _rating.value);
        final hostelRef =
            FirebaseFirestore.instance.collection('hostel').doc(docId);
        _isReview.value = false;
        await hostelRef.update({
          'review': FieldValue.arrayUnion([review.toJson()]),
        }).whenComplete(() {
          _isReview.value = true;
          comment.clear();
          _rating.value = 0.0;
        });
        _isReview.value = true;
        toast(msg: 'Review added successfully!', context: context);
        Get.back();
      } catch (e) {
        _isReview.value = true;
        Get.back();

        print("Failed to add review: $e");
      }
    } else {
      for (var v in reviewList) {
        if (v.uuid == uid) {
          toast(msg: "You already Give Review", context: context);
          _isReview.value = true;

          comment.clear();
          _rating.value = 0.0;
          Get.back();
        } else {
          try {
            final review = Review(
                image: _image.value,
                name: _name.value,
                uuid: uid,
                description: comment.text,
                star: _rating.value);
            final hostelRef =
                FirebaseFirestore.instance.collection('hostel').doc(docId);
            _isReview.value = false;
            await hostelRef.update({
              'review': FieldValue.arrayUnion([review.toJson()]),
            }).whenComplete(() {
              _isReview.value = true;
              comment.clear();

              _rating.value = 0.0;
            });

            toast(msg: 'Review added successfully!', context: context);
            Get.back();
          } catch (e) {
            _isReview.value = true;
            Get.back();
            print("Failed to add review: $e");
          }
        }
      }
    }
  }

  RxString _name = ''.obs;
  String get name => _name.value;
  RxString _image = ''.obs;
  String get image => _image.value;
  Future<void> getUserDataFromFirestore() async {
    // Fetch user data from Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(await _storageRepo.getUid())
        .get();

    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      // Access custom user fields
      _name.value = userData['name'] ?? '';
      _image.value = userData['image'] ?? '';
    } else {
      print("User document does not exist in Firestore.");
    }
  }

  Rx<HostelAddModel> _model = HostelAddModel().obs;
  HostelAddModel get model => _model.value;
  Future<List<Review>> getHostelReviews(String docId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('hostel')
          .doc(docId)
          .get();

      if (docSnapshot.exists) {
        HostelAddModel hostel = HostelAddModel.fromJson(
          docSnapshot.data() as Map<String, dynamic>,
        ).copyWith(docId: docSnapshot.id);
        _model.value = hostel;
        List<Review> reviews =
            hostel.review!.map((e) => Review.fromJson(e)).toList();

        return reviews;
      } else {
        print("Hostel not found.");
        return [];
      }
    } catch (e) {
      print("Error fetching hostel reviews: $e");
      return [];
    }
  }
}

class AmModel {
  final String title;
  final IconData icon;
  AmModel({required this.icon, required this.title});
}
