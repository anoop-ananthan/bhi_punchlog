import 'package:bhi_punchlog/widgets/inOrOut.dart';
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

  Widget getAvatar(context, position, length) {
    var i = length - position;
    if (length == 0)
      return InOrOut(condition: Condition.ABSENT, isIconVisible: true);
    if (i % 2 == 0) {
      return InOrOut(condition: Condition.OUT, isIconVisible: false);
    } else {
      return InOrOut(condition: Condition.IN, isIconVisible: false);
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
                child: this
                    .getAvatar(context, i, store.profileUser.punchLog.length),
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
