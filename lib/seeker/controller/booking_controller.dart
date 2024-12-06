import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:findyourhostel/main.dart';
import 'package:findyourhostel/models/booking_model/booking_model.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/repositories/storage/storage_repo.dart';
import 'package:findyourhostel/utils/app_text.dart';
import 'package:findyourhostel/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mailer/smtp_server.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:jazzcash_flutter/jazzcash_flutter.dart';
import 'package:mailer/mailer.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController checkIn = TextEditingController();
  TextEditingController checkOut = TextEditingController();
  TextEditingController roomType = TextEditingController();
  TextEditingController beds = TextEditingController();
  List<String> roomTypes = [
    'Private Room',
    '2 Sharing',
    '3 Sharing',
    '4 Sharing',
    '5 Sharing',
    '6 Sharing',
  ];
  RxList<String> _newRoomTypeList = <String>[].obs;
  List<String> get newRoomTypeList => _newRoomTypeList.value;
  RxBool _showRoomType = false.obs;
  bool get showRoomType => _showRoomType.value;
  toggleShowRoomType() {
    _showRoomType.value = !_showRoomType.value;
  }

  RxInt _selectedRoomType = (-1).obs;
  int get selectedRoomType => _selectedRoomType.value;
  addRoomType(int index, String value) {
    roomType.text = value;
    print('Room Type Inde $index');
    _selectedRoomType.value = index;
    toggleShowRoomType();
  }

  checkRoomType(List<Map<String, dynamic>> rooms) {
    final providedList = rooms.map((e) => RoomType.fromJson(e)).toList();
    _newRoomTypeList.clear();
    newRoomTypeList.clear();
    for (int i = 0; i < roomTypes.length; i++) {
      for (var x in providedList) {
        if (x.type == i) {
          newRoomTypeList.add(
              roomTypes[i]); // Add the value if the index is in selectedIndices
        } else {
          newRoomTypeList.add(
              ''); // Replace with an empty string if the index is not in selectedIndices
        }
      }
    }
  }

  checkInOut({required BuildContext context, bool isCheckin = false}) async {
    DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: isCheckin
            ? DateTime.now().add(const Duration(days: 30))
            : DateTime.now().add(const Duration(days: 360)));
    if (date != null) {
      if (isCheckin) {
        checkIn.text = DateFormat('dd-MM-yyyy').format(date);
      } else {
        checkOut.text = DateFormat('dd-MM-yyyy').format(date);
      }
    }
  }

  pickAge({
    required BuildContext context,
  }) async {
    DateTime? date = await showDatePicker(
        context: context, firstDate: DateTime(1940), lastDate: DateTime.now());
    if (date != null) {
      age.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  bookingHostel(
      {required HostelAddModel model, required BuildContext context}) async {
    _loading.value = true;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _firestore
        .collection('booking')
        .doc()
        .set(BookingModel(
          name: name.text,
          email: email.text,
          phone: phone.text,
          age: age.text,
          createdDate: DateTime.timestamp().toString(),
          bookerId: await _storageRepo.getUid(),
          hostel_model: model.toJson(),
          check_in: checkIn.text,
          cnic: cnic.text,
          roomType: _selectedRoomType.value,
          check_out: checkOut.text,
        ).toJson())
        .whenComplete(() {
      // toast(msg: 'Hostel Book Successfully.', context: context);
      _loading.value = false;
      Get.back();
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: appText(
                    textAlign: TextAlign.center,
                    context: context,
                    fontSize: 12,
                    title:
                        'Payment received successfully. Your booking has been confirmed..',
                    maxLine: 2),
              ),
            );
          });
      Future.delayed(const Duration(seconds: 2), () {
        Get.back();
      });
    });
  }

  late StorageRepo _storageRepo;
  @override
  void onInit() {
    _storageRepo = getIt();
    getBookings();
    // TODO: implement onInit
    super.onInit();
  }

  RxList<BookingModel> _bookedHostel = <BookingModel>[].obs;
  List<BookingModel> get bookedHostel => _bookedHostel.value;

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
                  if (x.bookerId == await _storageRepo.getUid()) {
                    _bookedHostel.add(x);
                  }
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

  sendEmail(String hostlerEmail, String hostelNme) async {
    final smtpServer = gmail('fyourhostel@gmail.com', 'ggsazjhrnosasczy');
    // Creating the Gmail server

    // Create our email message.
    final message1 = Message()
      ..from = Address('fyourhostel@gmail.com')
      ..recipients.add(
        email.text,
      )
      ..subject =
          'Find Your Hostel Booking :: 😀 :: ${DateTime.now()}' //subject of the email
      ..text =
          "Dear ${name.text} You Booked $hostelNme\nBooking Detail\nName: ${name.text}\nAge: ${age.text}\nPhone Number : ${phone.text}\nEmail: ${email.text}\nCNIC: ${cnic.text}\nCheck In: ${checkIn.text} |  Check Out: ${checkOut.text}\nRoom Type: ${roomTypes[_selectedRoomType.value]}";
    final message2 = Message()
      ..from = Address('fyourhostel@gmail.com')
      ..recipients.add(
        hostlerEmail,
      )
      ..subject =
          'Find Your Hostel Booking :: 😀 :: ${DateTime.now()}' //subject of the email
      ..text =
          "Dear Recruiter ${name.text}  Booked Your Hostel: $hostelNme\nBooking Detail\nName: ${name.text}\nAge: ${age.text}\nPhone Number : ${phone.text}\nEmail: ${email.text}\nCNIC: ${cnic.text}\nCheck In: ${checkIn.text} |  Check Out: ${checkOut.text}\nRoom Type: ${roomTypes[_selectedRoomType.value]}";

    try {
      final sendReport = await send(message1, smtpServer);
      final sendReport2 = await send(message2, smtpServer);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
      print('Message sent: ' +
          sendReport2.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  Future<void> deleteBooking(String targetDate, String hostelerId,
      String hostelName, String userName) async {
    try {
      // Format the date as per your Firestore structure (assuming `date` is stored as a Timestamp)
      // Timestamp targetTimestamp = Timestamp.fromDate(DateTime.parse(targetDate));

      // Query the booking collection where date matches the target date
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('booking')
          .where('createdDate', isEqualTo: targetDate)
          .get();

      // Loop through each matching document and delete it
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        await doc.reference.delete().whenComplete(() async {
          final smtpServer = gmail('fyourhostel@gmail.com', 'ggsazjhrnosasczy');
          final message2 = Message()
            ..from = Address('fyourhostel@gmail.com')
            ..recipients.add(
              hostelerId,
            )
            ..subject =
                'Find Your Hostel Booking :: 😀 :: ${DateTime.now()}' //subject of the email
            ..text =
                "Dear Recruiter ${userName}  Cancel Your Hostel: $hostelName Booking";
          final sendReport2 = await send(message2, smtpServer);
        });
      }

      print('Booking(s) on the specified date have been deleted successfully.');
    } catch (e) {
      print('Failed to delete booking(s): $e');
    }
  }
}

class JazzCashClass {
  String generateHmacSha256(String data, String secret) {
    var key = utf8.encode(secret);
    var bytes = utf8.encode(data);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  Future<void> openJazzCashPayment(String price, String description) async {
    // Prepare the data
    String txnDatetime = DateTime.now()
        .toUtc()
        .toIso8601String()
        .replaceAll("-", "")
        .replaceAll(":", "")
        .split(".")[0];
    String txnExpiryDatetime = DateTime.now()
        .add(Duration(hours: 1))
        .toUtc()
        .toIso8601String()
        .replaceAll("-", "")
        .replaceAll(":", "")
        .split(".")[0];
    String txnRefNo = "T$txnDatetime";
    String uniqueBillReference = txnDatetime;

    // Prepare the string to be hashed
    String sortedString =
        "0vyt00dd9d'&${price}00&TBANK&$uniqueBillReference&$description&EN&MC113738&8wwfd37v1t&RETL&${"www.jazcash.com"}&PKR&$txnDatetime&$txnExpiryDatetime&$txnRefNo&1.1&1&2&3&4&5";

    // Generate HMAC-SHA256 hash
    String ppSecureHash = generateHmacSha256(sortedString, '0vyt00dd9d');

    // Prepare the data for the URL
    Map<String, String> postData = {
      'pp_Version': '1.1',
      'pp_TxnType': '',
      'pp_Language': 'EN',
      'pp_MerchantID': 'MC113738',
      'pp_SubMerchantID': '',
      'pp_Password': '8wwfd37v1t',
      'pp_BankID': 'TBANK',
      'pp_ProductID': 'RETL',
      'pp_TxnRefNo': txnRefNo,
      'pp_Amount': '${price}00',
      'pp_TxnCurrency': 'PKR',
      'pp_TxnDateTime': txnDatetime,
      'pp_BillReference': uniqueBillReference,
      'pp_Description': description,
      'pp_TxnExpiryDateTime': txnExpiryDatetime,
      'pp_ReturnURL': "www.jazcash.com",
      'pp_SecureHash': ppSecureHash,
      'ppmpf_1': '1',
      'ppmpf_2': '2',
      'ppmpf_3': '3',
      'ppmpf_4': '4',
      'ppmpf_5': '5',
      'pp_Outlet': 'JazzCash'
    };

    // Construct the URL with query parameters
    String url = Uri.https(
      'sandbox.jazzcash.com.pk',
      '/CustomerPortal/transactionmanagement/merchantform/',
      postData,
    ).toString();

    // Launch the URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
