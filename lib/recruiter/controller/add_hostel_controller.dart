import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/repositories/addhostel/add_hostel_repo.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddHostelController extends GetxController {
  TextEditingController hostelname = TextEditingController();
  TextEditingController hostelAddress = TextEditingController();
  TextEditingController hostellocalAddress = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController avalRoom = TextEditingController();
  TextEditingController avalBed = TextEditingController();
  TextEditingController poilicy = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  RxString _qrCode = ''.obs;
  String get qrCode => _qrCode.value;
  TextEditingController search = TextEditingController();
  RxList<String> _pickedImages = <String>[].obs;
  List get pickedImages => _pickedImages.value;
  late GoogleMapController mapController;
  pickMultiImages({required BuildContext context}) async {
    final picker = await ImagePicker().pickMultiImage(
      limit: 5,
    );
    if (picker.isNotEmpty) {
      if (_pickedImages.length <= 5) {
        for (var p in picker) {
          _pickedImages.add(p.path);
        }
      } else {
        toast(msg: 'Already Pick 5 images..', context: context);
      }
    }
  }

  removeImage(int index) {
    _pickedImages.removeAt(index);
  }

  List<String> roomTypes = [
    'Private Room',
    '2 Sharing',
    '3 Sharing',
    '4 Sharing',
    '5 Sharing',
    '6 Sharing',
  ];

  List<TextEditingController> roomTypeController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<String> aminties = [
    'Parking',
    'Wifi',
    'TV',
    'Loundary',
    'Security',
    'Refregenrator',
    'CCTV',
  ];
  RxList<bool> _isRoomSelected = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  List<bool> get isRoomSelected => _isRoomSelected.value;
  RxList<RoomType> _selectedRoomType = <RoomType>[].obs;
  List<RoomType> get selectedRoomType => _selectedRoomType.value;
  void selectRoomType(RoomType data) {
    if (_selectedRoomType.any((room) => room.type == data.type)) {
      // If the room type is already selected, remove it
      _isRoomSelected[data.type!] = false;
      _selectedRoomType.removeWhere((room) => room.type == data.type);
    } else {
      // If the room type is not selected, add it
      _isRoomSelected[data.type!] = true;
      _selectedRoomType.add(data);
    }
  }

  RxList<int> _selectedAmenitiesType = <int>[].obs;
  List<int> get selectedAmenitiesType => _selectedAmenitiesType.value;
  selectAmenitiesType(int index) {
    if (_selectedAmenitiesType.contains(index)) {
      _selectedAmenitiesType.removeWhere((i) => i == index);
    } else {
      _selectedAmenitiesType.add(index);
    }
  }

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

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  Future addHostel({required BuildContext context}) async {
    if (_pickedImages.isEmpty) {
      toast(msg: 'Please pick images first.', context: context);
    } else if (hostelname.text.isEmpty) {
      toast(msg: 'Please enter your hostel name.', context: context);
    } else if (hostelAddress.text.isEmpty) {
      toast(msg: 'Please enter your hostel map address.', context: context);
    } else if (description.text.isEmpty) {
    } else if (hostellocalAddress.text.isEmpty) {
      toast(msg: 'Please enter your hostel local address.', context: context);
    } else if (description.text.isEmpty) {
      toast(msg: 'Please enter your hostel description.', context: context);
    } else if (avalRoom.text.isEmpty) {
      toast(msg: 'Please enter avaliable rooms.', context: context);
    } else if (avalBed.text.isEmpty) {
      toast(msg: 'Please eneter avaliable beds.', context: context);
    } else if (_selectedRoomType.isEmpty) {
      toast(msg: 'Please select room type.', context: context);
    } else if (_selectedAmenitiesType.isEmpty) {
      toast(msg: 'Please select amenties.', context: context);
    } else if (poilicy.text.isEmpty) {
      toast(msg: 'Please enter your hostel policies.', context: context);
    } else if (email.text.isEmpty) {
      toast(msg: 'Please enter your hostel email.', context: context);
    } else if (phone.text.isEmpty) {
      toast(msg: 'Please enter your hostel phone number.', context: context);
    } else if (_qrCode == '') {
      toast(msg: 'Please enter your Payment QR CODE.', context: context);
    } else {
      _loading.value = true;
      bool isSuccess = await repo.addHostel(
          context: context,
          model: HostelAddModel(
            uuid: await storageRepo.getUid(),
            images: _pickedImages,
            location: hostelAddress.text,
            name: hostelname.text,
            price: price.text,
            policies: poilicy.text,
            phone: phone.text,
            address: hostellocalAddress.text,
            lat: currentLatLng.value.latitude,
            long: currentLatLng.value.longitude,
            qrCode: _qrCode.value,
            gender: _selectedGender.value,
            amenities: _selectedAmenitiesType,
            roomType: _selectedRoomType.map((model) => model.toJson()).toList(),
            avalaibleBed: avalBed.text,
            avalaibleRoom: avalRoom.text,
            email: email.text,
            description: description.text,
            createdDate: DateTime.timestamp().toString(),
          ));
      if (isSuccess == true) {
        toast(msg: 'Hostel upload successfully.', context: context);

        _loading.value = false;
        Get.back();
      } else {
        toast(msg: 'Something went wrong.', context: context);
        _loading.value = false;
      }
    }
  }

  pickQrCode() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      _qrCode.value = picker.path;
    }
  }

  Future<void> searchLocation({
    required String val,
  }) async {
    try {
      List<Location> locations = await locationFromAddress(val);
      if (locations.isNotEmpty) {
        Location location = locations.first;

        currentLatLng.value = LatLng(location.latitude, location.longitude);

        mapController
            .animateCamera(CameraUpdate.newLatLng(currentLatLng.value));
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  late AddHostelRepo repo;
  late StorageRepo storageRepo;
  @override
  void onInit() {
    repo = getIt();
    storageRepo = getIt();
    super.onInit();
  }

  Rx<LatLng> currentLatLng = LatLng(30.3753, 69.3451).obs;

  RxBool isMapDragging = false.obs;
  onCameraStartMove() {
    isMapDragging.value = true;
  }

  clearSearch() {
    hostelAddress.clear();
    search.clear();
  }

  Future<String> getAddressFromLatLng(
      double latitude, double longitude, bool isSearch) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemarks[0];
      if (place.name == null) {
        String address = '${place.locality}, ${place.street}, ${place.country}';
        return address;
      } else if (place.locality == null) {
        String address = '${place.name}, ${place.street}, ${place.country}';
        return address;
      } else if (place.street == null) {
        String address = '${place.name}, ${place.locality}, ${place.country}';
        return address;
      } else if (place.name == null && place.locality == null) {
        String address = '${place.street}, ${place.country}';
        return address;
      } else if (place.name == null &&
          place.locality == null &&
          place.postalCode == null) {
        String address = '${place.country}';
        return address;
      } else if (place.name == null && place.postalCode == null) {
        String address = '${place.locality}, ${place.country}';
        return address;
      } else if (place.locality == null && place.postalCode == null) {
        String address = '${place.name}, ${place.country}';
        return address;
      } else {
        String address =
            '${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}';
        return address;
      }
    } catch (e) {
      print(e);
      return "";
    }
  }

  RxList<String> _languages = <String>[].obs;
  List<String> get languages => _languages.value;
  addLanguage(String lang) {
    if (!_languages.contains(lang)) {
      _languages.add(lang);
    }
  }

  void onCameraMove(CameraPosition position) async {
    if (isMapDragging.value) {
      print("Is Map Drag ${isMapDragging.value}, ${position.target.latitude}");
      currentLatLng.value = position.target;
    }
  }

  void onCameraIdle() async {
    isMapDragging.value = false;
    String address = await getAddressFromLatLng(
        currentLatLng.value.latitude, currentLatLng.value.longitude, false);
    hostelAddress.text = address.replaceAll(', ,', '');
  }
}
