import 'package:bhi_punchlog/models/punch.dart';

/// User class defines all the employees of the establishment
class User {
  String username;
  String name;
  String role;
  String firstPunch;
  String lastPunch;
  String totalTime;
  String timeInOffice;
  String timeForBreak;

  String punchDate;
  String photoUrl;
  bool isPresent;
  int _selectedTabIndex = 0;
  List<Punch> punchLog;

  get selectedTabIndex => _selectedTabIndex;

  set selectedTabIndex(int index) {
    if (_selectedTabIndex == index) return;
    _selectedTabIndex = index;
  }

  User({
    this.username,
    this.name,
    this.role,
    this.firstPunch,
    this.lastPunch,
    this.timeInOffice,
    this.timeForBreak,
    this.punchDate,
    this.isPresent,
    this.punchLog,
    this.photoUrl,
    this.totalTime,
  });

  List<User> users;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      name: json['fullname'] as String,
      role: json['userrole'] as String,
      firstPunch: json['firstpunch'] as String,
      lastPunch: json['lastpunch'] as String,
      timeInOffice: formatTime(json["intime"] as int),
      timeForBreak: formatTime(json["outtime"] as int),
      totalTime: formatTime(json["tot"] as int),
      punchDate: json['pdate'] as String,
      isPresent: json['status'].toString() == 'In',
      photoUrl: json['picture'] as String,
      punchLog: List<Punch>.from(
        json["punches"].map(
          (x) => Punch.fromJson(x),
        ),
      ).toList().reversed.toList(),
    );
  }

  @override
  String toString() {
    return this.name;
  }

  static String formatTime(int time) {
    Duration duration = Duration(seconds: time.round());
    return [duration.inHours, duration.inMinutes]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }
}
