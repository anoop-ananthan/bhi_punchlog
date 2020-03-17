import 'package:bhi_punchlog/data/store.dart';
import 'package:flutter/material.dart';
import 'package:bhi_punchlog/globals.dart' as globals;
import 'package:flutter_mobx/flutter_mobx.dart';

class Timing extends StatefulWidget {
  Timing({Key key}) : super(key: key);

  @override
  _TimingState createState() => _TimingState();
}

class _TimingState extends State<Timing> {
  final AppStore store = globals.store;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) => ListView(
          children: ListTile.divideTiles(
            color: Colors.grey[400],
            tiles: [
              ListTile(
                leading: Icon(
                  Icons.gavel,
                  color: Colors.brown,
                ),
                title: Text('First punch'),
                subtitle: Text(store.profileUser.firstPunch ?? 'Not arrived'),
              ),
              ListTile(
                leading: Icon(
                  Icons.access_time,
                  color: Colors.purple,
                ),
                title: Text(
                  'Total time',
                ),
                subtitle: Text(store.profileUser.totalTime ?? ''),
              ),
              ListTile(
                leading: Icon(
                  Icons.laptop_mac,
                  color: Colors.indigo,
                ),
                title: Text(
                  'Time in office',
                ),
                subtitle: Text(store.profileUser.timeInOffice ?? ''),
              ),
              ListTile(
                leading: Icon(Icons.fastfood, color: Colors.pink),
                title: Text('Break time'),
                subtitle: Text(store.profileUser.timeForBreak ?? ''),
              )
            ],
          ).toList(),
        ),
      ),
    );
  }
}
