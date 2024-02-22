import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:jazz/app.dart';

// Driver program
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();
  await FlutterFlowTheme.initialize(); // may be able to remove

  runApp (const App()); // app made by Ilyas
}
