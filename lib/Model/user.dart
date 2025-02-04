class User {
  String? firstName;
  String? lastName;
  int? age;
  int? bpm;
  String? bloodType;
  String? gender;
  int? height;
  int? weight;
  bool withWheelChair = false;
  String? profileImage = '';
  List<User> emergencyCallList = [];
  List<User> emergencySmsList = [];
  List<User> emergencyBothList = [];
  List<double> bloodPressureHistoryList = [];
  List<double> bloodGlucoseHistoryList = [];
  List<double> bloodOxygenHistoryList = [];
  List<double> bloodTempratureHistoryList = [];
  List<double> heartRateHistoryList = [];
  List<double> heartRateVariabilityHistoryList = [];

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.bpm,
    required this.bloodType,
    required this.gender,
    required this.height,
    required this.weight,
  });

  // fromJson(Map<String, dynamic> json) {
  //   firstName = json['firstName'];
  //   lastName = json['lastName'];
  //   age = json['age'];
  //   bpm = json['bpm'];
  //   bloodType = json['bloodType'];
  //   profileImage = json['profileImage'];
  //   gender = json['gender'];
  //   height = json['height'];
  //   weight = json['weight'];
  // }
}
