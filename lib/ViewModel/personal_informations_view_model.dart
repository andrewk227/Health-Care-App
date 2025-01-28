import 'package:flutter/material.dart';

class PersonalInformationsViewModel {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var ageController = TextEditingController();
  var blodTypeController = TextEditingController();
  var bulsePerMinuteController = TextEditingController();
  String title = "Give us some basic information";

  bool? wheelChair = false;
}
