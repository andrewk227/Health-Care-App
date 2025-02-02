class User {
  String? firstName;
  String? lastName;
  int? age;
  int? bpm;
  String? bloodType;
  String? profileImage;
  List<User> emergencyCallList = [];
  List<User> emergencySmsList = [];
  List<User> emergencyBothList = [];

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.bpm,
    required this.bloodType,
    required this.profileImage,
  });
}
