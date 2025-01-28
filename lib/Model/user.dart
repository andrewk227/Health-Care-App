class User {
  String? uid;
  String? name;
  String? email;
  int? age;
  List<User> userEmergencyCallList = [];
  List<User> userEmergencySmsList = [];

  User({this.uid, this.name, this.email, this.age});
}
