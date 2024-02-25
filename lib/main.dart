import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:golden_circle/app.dart';
import 'backend/firebase/firebase_config.dart';
import 'map_settings/map_settings_theme.dart';

// Driver program
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();
  await FlutterFlowTheme.initialize(); // may be able to remove

  runApp(const App()); // app made by Ilyas
}
