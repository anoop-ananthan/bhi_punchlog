import 'package:flutter/material.dart';
import 'package:bhi_punchlog/data/store.dart';
import 'package:bhi_punchlog/screens/login/login.dart';
import 'package:bhi_punchlog/screens/profile/profile.dart';
import 'package:bhi_punchlog/screens/users_list.dart';

final AppStore store = AppStore();

void main() => runApp(
      MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/users_list': (context) => UsersListScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
