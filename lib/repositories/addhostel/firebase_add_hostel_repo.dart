import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:findyourhostel/repositories/addhostel/add_hostel_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirebaseAddHostelRepo implements AddHostelRepo{
 @override
Future<bool> addHostel({required BuildContext context, required HostelAddModel model}) async {
  bool isSuccess = false;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  try {
    // Upload images and get the URLs
    String qrCode = await _uploadImageAndGetUrl(model.qrCode);
    List<String> uploadedImageUrls = await _uploadImages(model.images ?? []);

    // Update the model with the uploaded image URLs
    model = model.copyWith(images: uploadedImageUrls).copyWith(qrCode: qrCode);

    // Create a unique document reference for the new hostel
    DocumentReference hostelDoc = _firebase.collection('hostel').doc();

    // Use the docId in the model
    String docId = hostelDoc.id;

    // Update the model to include the generated docId
    model = model.copyWith(docId: docId);

    // Set the data as an object (including docId)
    await hostelDoc.set(model.toJson());

    isSuccess = true;
  } catch (e) {
    // Handle any errors here (e.g., show a message to the user)
    print('Error adding hostel: $e');
  }

  return isSuccess;
}
 @override
Future<bool> updateHostel({required BuildContext context, required HostelAddModel model}) async {
  bool isSuccess = false;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  try {
    // Upload images and get the URLs
    String qrCode = await _uploadImageAndGetUrl(model.qrCode);
    List<String> uploadedImageUrls = await _uploadImages(model.images ?? []);

    // Update the model with the uploaded image URLs
    model = model.copyWith(images: uploadedImageUrls).copyWith(qrCode: qrCode);

    // Create a unique document reference for the new hostel
    DocumentReference hostelDoc = _firebase.collection('hostel').doc(model.docId);

    // Use the docId in the model
    // String docId = hostelDoc.id;

    // Update the model to include the generated docId
    // model = model.copyWith(docId: docId);

    // Set the data as an object (including docId)
    await hostelDoc.update(model.toJson());

    isSuccess = true;
  } catch (e) {
    // Handle any errors here (e.g., show a message to the user)
    print('Error adding hostel: $e');
  }

  return isSuccess;
}
Future<List<String>> _uploadImages(List<String> imagePaths) async {
  Reference storage = FirebaseStorage.instance.ref();
  List<String> downloadUrls = [];

  for (String path in imagePaths) {
    try {
      File imageFile = File(path);
      
      // Check if the image file exists
      if (await imageFile.exists()) {
        // Create a unique file name
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        
        // Reference for the image in Firebase Storage
        Reference ref = storage.child('hostels_images/$fileName.jpeg');
        
        // Upload the file
        UploadTask uploadTask = ref.putFile(imageFile);
        TaskSnapshot snapshot = await uploadTask;
        
        // Get the download URL and add to the list
        String downloadUrl = await snapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      } else {
        print('File does not exist: $path');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  return downloadUrls;
}


  Future<String> _uploadImageAndGetUrl(
    String? filePath,
  ) async {
    Reference storage = FirebaseStorage.instance.ref();
    if (filePath == null || filePath.isEmpty) return '';

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Create a unique file path in Firebase Storage
      final uploadTask =
          storage.child('profileImage/$fileName.jpg').putFile(File(filePath));

      // Wait until the file is uploaded
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image : $e');
      return ''; // Return an empty string if there's an error
    }
  }
}