import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:bhi_punchlog/data/store.dart';
import 'package:bhi_punchlog/globals.dart' as globals;

class PunchLog extends StatelessWidget {
  final AppStore store = globals.store;

  String formatTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }

  Widget inOrOut(context, position, length) {
    var i = length - position;
    if (i % 2 == 0) {
      return CircleAvatar(
        backgroundColor: Colors.red[50],
        child: Text(
          'Out',
          style: Theme.of(context).textTheme.subtitle.copyWith(
                letterSpacing: -0.60,
                color: Colors.red,
              ),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.green[50],
        child: Text(
          'IN',
          style: Theme.of(context).textTheme.subtitle.copyWith(
                letterSpacing: 1,
                color: Colors.green[900],
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: store.profileUser.punchLog.length,
          separatorBuilder: (context, i) => Divider(
            color: Colors.grey[300],
            height: 1.5,
          ),
          itemBuilder: (context, i) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[100],
                child:
                    this.inOrOut(context, i, store.profileUser.punchLog.length),
              ),
              title: Text(
                this.formatTime(store.profileUser.punchLog[i].punchtime),
              ),
              subtitle: Text(store.profileUser.punchLog[i].doorName),
            );
          },
        ),
      ),
    );
  }
}
