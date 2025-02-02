import 'package:el72ny/Model/user.dart';
import 'package:flutter/material.dart';

class ProfileViewModel {
  User userProfile = User(
    firstName: 'Andrew',
    lastName: 'Ashraf',
    age: 30,
    bpm: 70,
    bloodType: 'A+',
    profileImage: '',
  );

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController bulsePerMinuteController = TextEditingController();
}
