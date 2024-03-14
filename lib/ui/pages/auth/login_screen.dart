import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/firebase/auth/shared/firebase_authentication.dart';

import '../../../global/constants/assets/assets_path.dart';
import '../../../global/constants/routes/routes.dart';
import '../../widgets/auth/email_widget.dart';
import '../../widgets/auth/login_widget.dart';
import '../../widgets/auth/sign_widget.dart';
import '../../widgets/auth/welcome_widget.dart';
import '../../widgets/snackBar/invalid_snackbar_widget.dart';
import '../../widgets/snackBar/valid_snackbar_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // SharedPreferences
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _email;

  String _message = '';
  bool _isLogin = true;
  bool _isObsecure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //Firebase Authentification
  late FirebaseAuthentication auth;
  // Form Controller
  final _formKey = GlobalKey<FormState>();
  //ScaffoldMessenger.of(context).showSnackBar(...);
  /*

  if (_formKey.currentState!.validate()) {
      //scaffoldKey.currentState.showSnackBar(validSnackBar);
      _messengerKey.currentState?.showSnackBar(validSnackBar);
    } else {
      //scaffoldKey.currentState.showSnackBar(invalidSnackBar);
      _messengerKey.currentState?.showSnackBar(invalidSnackBar);
    }
   */

  @override
  void initState() {
    TestLogin();
    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuthentication();
      //FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageReceived);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            /*backgroundColor: Colors.white,*/
            /*appBar: AppBar(
                  centerTitle: true,
                  title: (_isLogin) ? Text("Login") : Text("Signup"),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        auth.logout().then((value) {
                          if (value) {
                            setState(() {
                              _message = 'User Logged Out';
                            });
                          } else {
                            _message = 'Unable to Log Out';
                          }
                        });
                      },
                    ),
                  ],
                ),*/
            body: SafeArea(
                child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 0, bottom: 36, left: 36, right: 36),
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 45,
                                    backgroundColor:
                                        Theme.of(context).primaryColorLight,
                                    backgroundImage:
                                        AssetImage(Assets.shapeDark),
                                  ),
                                  /*Image.asset(Assets.shapeDark,
                                          height: 90.0,
                                          fit: BoxFit.fill,
                                          color: Theme.of(context).primaryColorDark),
                                      */
                                  SizedBox(width: 20),
                                  Welcome(context),
                                ],
                              ),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 25),
                                        Login(context, _isLogin),
                                        emailInput(context, _emailController),
                                        passwordInput(),
                                      ])),

                              /*txtMessage(),*/
                              SizedBox(height: 24),
                              SizedBox(height: 10),
                              btnMain(),
                              SizedBox(height: 15),
                              btnSecondary(),
                              //btnGoogle(),
                            ])))))));
  }

  ///////////////////////////////////////////////////////////////////
  Widget passwordInput() {
    return Padding(
        padding: EdgeInsets.only(top: 24),
        child: TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.emailAddress,
            obscureText: _isObsecure,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              //hintText: 'Email',
              prefixIcon: Icon(Icons.lock),
              //hintText: 'Password...',
              labelText: 'Password',
              labelStyle: TextStyle(
                  color: (Theme.of(context).brightness.name ==
                          Brightness.light.name)
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryTextTheme.bodyText2?.color),
              suffixIcon: IconButton(
                onPressed: () {
                  _isObsecure = !_isObsecure;
                  (context as Element).markNeedsBuild();
                },
                icon:
                    Icon(_isObsecure ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            validator: ((String? value) {
              if (value == null || value /*!*/ .isEmpty) {
                return 'Password is required';
              } else if (value.length < 6) {
                return "Password too short";
              } else {
                return null;
              }
            })));
  }
  ///////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  Widget btnMain() {
    String btnText = _isLogin ? 'Login' : 'Sign up';
    return Padding(
        padding: EdgeInsets.only(top: 0),
        child: Container(
            height: 60,
            width: double.infinity,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    /*gradient: LinearGradient(colors: [
                      Theme.of(context).primaryColorDark,
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).primaryColorLight,

                      //add more colors
                    ]),*/
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(blurRadius: 2), //blur radius of shadow
                    ]),
                child: ElevatedButton(
                    style: /*ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      //make color or elevated button transparent
                    )*/
                        ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColorLight),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColorDark)),
                      ),
                    ),
                    child: Text(btnText,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColorDark),
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if ((_formKey.currentState!.validate())) {
                        //_formKey.currentState?.reset();
                        String userId = '';
                        if (_isLogin) {
                          auth
                              .login(_emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            if (value == null) {
                              setState(() {
                                _message = 'Login Error';
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(InvalidSnackBar(_message));
                            } else {
                              userId = value;
                              setState(() {
                                _message =
                                    'User $userId successfully logged in';
                              });
                              SaveUser(userId.toString(),
                                  _emailController.text.toString());
                              changeScreen();
                            }
                          });
                        } else {
                          auth
                              .createUser(_emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            if (value == null) {
                              setState(() {
                                _message = 'Registration Error';
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(InvalidSnackBar(_message));
                            } else {
                              userId = value;
                              setState(() {
                                //$userId
                                _message = 'User successfully signed in';
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(ValidSnackBar(_message));
                              changeLogSign();
                            }
                          });
                        }
                      }
                    }))));
  }

  //////////////////////////////////////////////////////////////////////////////
  Widget btnSecondary() {
    String buttonText = _isLogin ? 'Sign up' : 'Log In';
    //
    return TextButton(
      child: Sign(context, buttonText, _isLogin),
      onPressed: () {
        changeLogSign();
      },
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  Widget txtMessage() {
    return Padding(
        padding: EdgeInsets.only(top: 24),
        child: Text(_message,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 16,
                    color: (Theme.of(context).brightness.name ==
                            Brightness.light.name)
                        ? Theme.of(context).primaryColorDark
                        : Theme.of(context).primaryTextTheme.bodyText2?.color,
                    fontWeight: FontWeight.bold))));
  }

  //////////////////////////////////////////////////////////////////////////////
  Future<void> TestLogin() async {
    final SharedPreferences prefs = await _prefs;
    final String? email = prefs.getString("email");

    if (email != null) {
      Navigator.of(context).pushNamed(Routes.todo_page);
    }
  }

  Future<void> SaveUser(String id, String email) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('id', id).then((bool success) {
      //return id;
    });
    prefs.setString('email', email).then((bool success) {
      //return email;
    });
  }

  void changeScreen() {
    Navigator.of(context).pushNamed(Routes.todo_page);
  }

  void changeLogSign() {
    FocusScope.of(context).unfocus();
    setState(() {
      _message = "";
      _isObsecure = true;

      _emailController.text = "example@gmail.com";
      _passwordController.text = "Example123456789*";
      _formKey.currentState?.validate();
      _emailController.text = "";
      _passwordController.text = "";

      _isLogin = !_isLogin;
    });
  }
}
