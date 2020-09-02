import 'package:flutter/material.dart';
import 'app/router.gr.dart' as RT;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: RT.Routes.startupView,
      onGenerateRoute: RT.Router().onGenerateRoute,
    );
  }
}
