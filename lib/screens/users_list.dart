import 'dart:async';

import 'package:bhi_punchlog/data/store.dart';
import 'package:bhi_punchlog/globals.dart' as globals;
import 'package:bhi_punchlog/models/user.dart';
import 'package:bhi_punchlog/widgets/inOrOut.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class UsersListScreen extends StatelessWidget {
  final AppStore store = globals.store;
  UsersListScreen() {
    Timer.periodic(
      new Duration(minutes: 1),
      (timer) async {
        try {
          await store.getUsers(date: store.selectedDate);
          User oldUser = store.profileUser;
          if (oldUser == null) return;
          User newUser =
              store.users.firstWhere((u) => oldUser.username == u.username);
          store.profileUser = newUser;
        } catch (e) {
          print(".........................................");
          print(e);
          print(".........................................");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.bubble_chart),
          title: Text('Blueberries'),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  DateFormat('MMM d, EE').format(store.selectedDate),
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.date_range),
              color: Colors.white,
              onPressed: () async {
                var selectedDate = await showDatePicker(
                  context: context,
                  initialDate: store.selectedDate,
                  firstDate: DateTime(1998),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  store.selectedDate = selectedDate;
                  Toast.show('Please wait...', context,
                      duration: 1, backgroundRadius: 5);
                  await store.getUsers(date: selectedDate);
                  var dateText =
                      DateFormat("MMM d, EEEE").format(store.selectedDate);
                  Toast.show('Viewing data on $dateText', context,
                      duration: 2,
                      backgroundColor: Colors.green,
                      backgroundRadius: 5);
                }
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: store.users.length,
          itemBuilder: (context, i) {
            return ListTile(
                onTap: () {
                  store.profileUser = store.users[i];
                  Navigator.pushNamed(context, '/profile');
                },
                leading: Hero(
                  tag: '${store.users[i].username}',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(store.users[i].photoUrl),
                  ),
                ),
                title: Text(store.users[i].name),
                subtitle: Text(store.users[i].role),
                trailing: InOrOut(
                  condition: getCondition(store.users[i]),
                ));
          },
        ),
      ),
    );
  }

  Condition getCondition(User user) {
    if (user.punchLog.length == 0) return Condition.ABSENT;
    if (user.isPresent)
      return Condition.IN;
    else
      return Condition.OUT;
  }
}
