import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:bhi_punchlog/models/user.dart';

class UserService {
  Future<List<User>> fetchUsers({date}) async {
    if (date == null) date = DateTime.now();
    var dateText = DateFormat('yyyy-MM-dd').format(date);
    final url =
        "http://bhipms.net/index.php?r=punchresult/DailyPunchApi&pdate=$dateText";
    final response = await http.get(url);
    var userList = (json.decode(response.body) as List)
        .map<User>((u) => User.fromJson(u))
        .toList();
    userList.sort((a, b) => a.name.compareTo(b.name));
    return userList;
  }
}
