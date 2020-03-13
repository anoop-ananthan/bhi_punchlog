import 'package:bhi_punchlog/data/store.dart';
import 'package:bhi_punchlog/globals.dart' as globals;
import 'package:bhi_punchlog/screens/login/login_background.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginScreen extends StatefulWidget {
  LoginScreen();
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount _currentUser;
  final AppStore appStore = globals.store;

  _LoginScreenState();

  void initState() {
    super.initState();
    appStore.getUsers();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      print(_currentUser);
    });
    // _googleSignIn.signInSilently();
  }

  void onLoginButtonClicked() async {
    try {
      await _googleSignIn.signIn();
      Navigator.pushReplacementNamed(context, '/users_list');
    } catch (error) {
      print(error);
      showToast('test');
    }
  }

  void showToast(String msg) {
    Toast.show(msg, context, backgroundRadius: 5, backgroundColor: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              LoginBackground(
                screenHeight: MediaQuery.of(context).size.height,
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 15),
                    child: Text('BHI Punch Log',
                        style: Theme.of(context).textTheme.title),
                  ),
                ),
              ),
            ],
          ),
          OutlineButton(
            splashColor: Colors.grey,
            onPressed: onLoginButtonClicked,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            highlightElevation: 0,
            borderSide: BorderSide(color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Disclaimer: This is not an offical application. This doesnot reflect any official responsibility, imposition or authority on or by the users. This application is developed strictly for academic purpose.",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
//           width: double.infinity,
//           height: 100,
//           padding: const EdgeInsets.all(20.0),
//           child: FlatButton(
//             onPressed: onLoginButtonClicked,
//             padding: EdgeInsets.all(10),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25)),
//             color: Colors.green,
//             child: Text(
//               'Login',
//               style: Theme.of(context)
//                   .textTheme
//                   .title
//                   .apply(color: Colors.white),
//             ),
//           ),
//         ),
