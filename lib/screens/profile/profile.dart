import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:bhi_punchlog/data/store.dart';
import 'package:bhi_punchlog/models/user.dart';
import 'package:bhi_punchlog/screens/profile/punch_log.dart';
import 'package:bhi_punchlog/screens/profile/time_calculator.dart';
import 'package:bhi_punchlog/screens/profile/timing.dart';
import 'package:bhi_punchlog/globals.dart' as globals;
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  final AppStore store = globals.store;

  @override
  Widget build(BuildContext context) {
    final User user = store.profileUser;
    print(user.punchLog);
    List<Widget> tabs = [
      Timing(),
      PunchLog(),
      Calculator(),
      // PunchLog(),
    ];
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purple,
          title: Text(user.name),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 1),
                child: Text(
                  DateFormat('MMM d').format(store.selectedDate),
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 225,
                  color: Colors.green[200],
                  // color: Colors.purple,
                ),
                ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(
                    color: Colors.purple,
                    height: 225,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Center(
                  child: Hero(
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      final Hero toHero = toHeroContext.widget;
                      return RotationTransition(
                        turns: animation,
                        child: toHero.child,
                      );
                    },
                    tag: '${user.username}',
                    child: CircleAvatar(
                      radius: 105,
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                  ),
                )
              ],
            ),
            tabs[store.selectedTabIndex],
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: store.selectedTabIndex,
          onTap: (index) {
            store.selectedTabIndex = index;
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.watch),
              title: Text('Timing'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fingerprint),
              title: Text('Punch Log'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              title: Text('Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * .05, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
