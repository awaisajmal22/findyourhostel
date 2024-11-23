import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/constant/asset_paths.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/booking_model/booking_model.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SeekerHomeController extends GetxController {
  RxList<HostelAddModel> _hostelsList = <HostelAddModel>[].obs;
  List<HostelAddModel> get hostelsList => _hostelsList.value;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  Rx<BitmapDescriptor?> icon = Rx<BitmapDescriptor?>(null);
 
  createCustomMarker()async{
    final BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
   AssetPaths.marker
    );
    icon.value = customIcon;
  }
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
            snapshot.docs.forEach((doc) async {
              Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

              if (data != null) {
                final m =HostelAddModel.fromJson(data);
                if(m.isActive == true){
                _hostelsList.add(m);

                }
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

  late StorageRepo _storage;
  @override
  void onInit() {
    _storage = getIt();
    getHostels();
    getBookings();
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
        // Add to favorites and update 'favorite' to true
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

  //Filter Functionality
  RxList<String> _gender = <String>[
    'Male',
    'Female',
  ].obs;
  List<String> get gender => _gender.value;
  RxInt _selectedGender = 0.obs;
  int get selectedGender => _selectedGender.value;
  selectGender(int index) {
    _selectedGender.value = index;
  }

  List<String> roomTypes = [
    'Private Room',
    '2 Sharing',
    '3 Sharing',
    '4 Sharing',
    '5 Sharing',
    '6 Sharing',
  ];

  RxList<int> _selectedRoomType = <int>[].obs;
  List<int> get selectedRoomType => _selectedRoomType.value;
  selectRoomType(int index) {
    if (_selectedRoomType.contains(index)) {
      _selectedRoomType.removeWhere((i) => i == index);
    } else {
      _selectedRoomType.add(index);
    }
  }

  Rx<RangeValues> _rangeValue = RangeValues(1000, 10000).obs;
  RangeValues get rangeValue => _rangeValue.value;
  changeRange(RangeValues val) {
    _rangeValue.value = val;
  }

  RxList<HostelAddModel> _filterList = <HostelAddModel>[].obs;
  List<HostelAddModel> get filterList => _filterList.value;

  filterHostels(
    List<HostelAddModel> hostelList,
    double minPrice,
    double maxPrice,
    List<int> roomTypeIndices,
    int gender,
  ) {
    _filterList.clear();
    List<HostelAddModel> data = hostelList.where((hostel) {
      // Convert price to double for comparison
      // double price = double.tryParse(hostel.price!) ?? 0.0;

      // bool isPriceInRange = price >= minPrice && price <= maxPrice;

      bool isGenderMatch = hostel.gender == gender;

      bool isRoomTypeMatch = roomTypeIndices.isNotEmpty
          ? roomTypeIndices.any((index) {
              List<RoomType> roomsData =
                  hostel.roomType!.map((e) => RoomType.fromJson(e)).toList();
              // Check if any RoomType matches the given index
              return roomsData
                  .any((room) => room.type?.toString() == index.toString());
            })
          : true;

      return isGenderMatch && isRoomTypeMatch;
    }).toList();
    print("Filter Data Lenght ${data.length}");
    _filterList.addAll(data);
  }

  clearFilter() {
    _filterList.clear();
    filterList.clear();
  }

  RxList<BookingModel> _bookedHostel = <BookingModel>[].obs;
  List<BookingModel> get bookedHostel => _bookedHostel.value;

 Future<void> getBookings() async {
  _loading.value = true;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  try {
    // Fetch all documents in the 'booking' collection
    _firebase.collection('booking').snapshots().listen(
      (QuerySnapshot snapshot) {
        _bookedHostel.clear(); // Clear the list before adding new data

        if (snapshot.docs.isNotEmpty) {
          for (var doc in snapshot.docs) {
            Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

            if (data != null) {
              final book = BookingModel.fromJson(data);
              final bookedHostel = HostelAddModel.fromJson(book.hostel_model!);

              // Check if a hostel with the same name already exists in _bookedHostel
              final alreadyExists = _bookedHostel.any((existingBooking) {
                final existingHostel = HostelAddModel.fromJson(existingBooking.hostel_model!);
                return existingHostel.name == bookedHostel.name;
              });

              // Add the booking only if it doesn't already exist
              if (!alreadyExists) {
                _bookedHostel.add(BookingModel.fromJson(data));
              }
            }
          }

          // Sort the list by createdDate
          _bookedHostel.sort((a, b) => b.createdDate!.compareTo(a.createdDate!));
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
}
