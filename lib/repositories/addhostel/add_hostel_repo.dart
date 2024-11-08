import 'package:findyourhostel/models/hostel_add_model/hostel_add_model.dart';
import 'package:flutter/material.dart';

abstract class AddHostelRepo{
  Future<bool> addHostel({required BuildContext context,required HostelAddModel model});

  Future<bool> updateHostel({required BuildContext context,required HostelAddModel model});
}