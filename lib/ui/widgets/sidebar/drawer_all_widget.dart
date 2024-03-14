import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../global/constants/routes/routes.dart';
import 'drawer_welcome_widget.dart';

Drawer DrawerAll(
    BuildContext context, String _mail, Future<SharedPreferences> _prefs) {
  return Drawer(
      child: ListView(
    children: [
      DrawerWelcome(context, _mail),
      ListTile(
          leading: Icon(Icons.note_add_sharp, size: 35),
          title: Text(
            "Notes",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.todo_page);
          }),
      ListTile(
          leading: Icon(Icons.chat, size: 35),
          title: Text(
            "ChatGPT",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.speech_page);
          }),
      const Divider(),
      ListTile(
          leading: Icon(Icons.image, size: 35),
          title: Text(
            "Image generater",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.image_page);
          }),
      ListTile(
          leading: Icon(Icons.image_outlined, size: 35),
          title: Text(
            "Background remover",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.bg_page);
          }),
      const Divider(),
      ListTile(
          leading: Icon(Icons.volume_up, size: 35),
          title: Text(
            "Text To Speach",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.tts_page);
          }),
      ListTile(
          leading: Icon(Icons.campaign_sharp, size: 35),
          title: Text(
            "Speach To Text",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.stt_page);
          }),
      ListTile(
          leading: Icon(Icons.settings, size: 35),
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(Routes.theme_page);
          }),
      const Divider(),
      ListTile(
          leading: Icon(Icons.logout, size: 35),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18),
          ),
          onTap: () async {
// Remove data for the 'counter' key.
            final SharedPreferences prefs = await _prefs;
            prefs.remove('email');
            prefs.remove('id');
/*Navigator.pop(context);*/
            Navigator.of(context).pushNamed(Routes.login_page);
          }),
    ],
  ));
}
