import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/getx/theme/theme_service.dart';

import '../../../global/constants/routes/routes.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  // Obtain shared preferences.
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final primaryColorLight = const Color(0xFFD8E0ED);
  final primaryColorDark = const Color(0xFF2E3243);

  var isPressed = false;
  bool isDark = false;
  bool islightGrey = false;

  /*ThemeScreen crt = Get.put(ThemeScreen());*/

  void getSelectedPref() async {
    final SharedPreferences pref = await _prefs;
    if (pref.getBool('darkMode') == null) {
      pref.setBool('darkMode', false);
    }
    //Light Grey Mode
    if (pref.getBool('lightGreyMode') == null) {
      pref.setBool('lightGreyMode', false);
    }

    setState(() {
      isDark = (pref.getBool('darkMode') == true) /*!*/ /*?? false*/;
      //bool? isDark = pref.getString("darkMode");

      //Light Grey Mode
      islightGrey = (pref.getBool('lightGreyMode') == true) /*!*/;
    });
  }

  @override
  void initState() {
    getSelectedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final positionShadow = isDark ? -40.0 : -210.0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(Routes.userHomePage);
          },
        ),
        backgroundColor: isDark ? primaryColorDark : primaryColorLight,
        elevation: 0,
      ),
      backgroundColor: isDark ? primaryColorDark : primaryColorLight,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () async {
                      //Light Grey Mode
                      if (!isDark) {
                        setState(() {
                          islightGrey = !islightGrey;
                          ThemeService().changeThemeLight();
                        });
                        final SharedPreferences pref = await _prefs;
                        pref.setBool('lightGreyMode', islightGrey);
                      }
                    },
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: isDark
                              ? [
                                  const Color(0xFF30218F),
                                  const Color(0xFF8D81DD),
                                ]
                              : islightGrey
                                  ? [
                                      //const Color(0xFF02A1E7),
                                      //const Color(0xFF6F61C4),
                                      const Color(0xFFBE22E5),
                                      const Color(0xFF6F61C4),
                                    ]
                                  : [
                                      const Color(0xFFFFCC81),
                                      const Color(0xFFFF6E30),
                                    ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    top: positionShadow,
                    right: positionShadow,
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? primaryColorDark : primaryColorLight,
                      ),
                    ),
                  ),
                ],
              ),
              //const SizedBox(height: 36),
              // centerText(),
              Text(
                isDark
                    ? 'Good\nNight'
                    : islightGrey
                        ? 'Good\nEvening'
                        : 'Good\nMorning',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: isDark ? primaryColorLight : primaryColorDark,
                ),
              ),
              const SizedBox(height: 120),
              Listener(
                onPointerDown: (_) => setState(() {
                  isPressed = true;
                }),
                onPointerUp: (_) async {
                  setState(() {
                    isPressed = false;
                    isDark = !isDark;

                    islightGrey = false;

                    SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle(
                        statusBarBrightness:
                            isDark ? Brightness.dark : Brightness.light,
                      ),
                    );
                    setState(() {
                      ThemeService().changeTheme();
                    });
                  });
                  final SharedPreferences pref = await _prefs;
                  //isDark = (pref.getBool('darkMode'))!;
                  //pref.setBool('darkMode', !isDark);

                  pref.setBool('darkMode', isDark);
                  pref.setBool('lightGreyMode', islightGrey);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? primaryColorDark : primaryColorLight,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(-5, 5),
                        blurRadius: 10,
                        color: isDark
                            ? const Color(0xFF121625)
                            : const Color(0xFFA5B7D6),
                      ),
                      BoxShadow(
                        offset: const Offset(5, -5),
                        blurRadius: 10,
                        color:
                            isDark ? const Color(0x4D9DA7CF) : Colors.white70,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.power_settings_new,
                    size: 48,
                    color: isDark ? primaryColorLight : primaryColorDark,
                  ),
                ),
              ),
              SizedBox(height: 36),
              // powerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
