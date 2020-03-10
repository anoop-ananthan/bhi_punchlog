import 'package:intl/intl.dart';

class Punch {
  DateTime punchtime;

  String doorName;

  Punch({
    this.punchtime,
    this.doorName,
  });

  factory Punch.fromJson(Map<String, dynamic> json) {
    try {
      return Punch(
        punchtime: DateTime.parse(json["punchtime"]),
        doorName: json["dname"],
      );
    } catch (e) {
      print(e.toString());
      print(json['punchtime']);
      return Punch(punchtime: DateTime.now(), doorName: 'Error');
    }
  }

  Map<String, dynamic> toJson() => {
        "punchtime": punchtime,
        "dname": doorName,
      };

  @override
  String toString() {
    try {
      return '${this.doorName}, ${DateFormat('h:mm').format(this.punchtime)}';
    } catch (e) {
      return 'Eror ';
    }
  }
}
