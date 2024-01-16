import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/data/local_storage/shared_preferences.dart';
import 'package:notes_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const ChatApp());
  });
}
