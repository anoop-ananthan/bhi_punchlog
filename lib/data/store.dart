import 'package:mobx/mobx.dart';

import 'package:bhi_punchlog/models/user.dart';
import 'package:bhi_punchlog/services/user.dart';

part 'store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final UserService _service = UserService();

  @observable
  List<User> users;

  @observable
  User currentUser;

  @observable
  User profileUser;

  @observable
  int selectedTabIndex = 0;

  @observable
  DateTime selectedDate = DateTime.now();

  @action
  getUsers({date}) async {
    users = await _service.fetchUsers(date: date);
  }
}
