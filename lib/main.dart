import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/views/home_tab.dart';

import 'model/app_state_model.dart';

void main() {
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
	    builder: (context) => AppStateModel()..loadProducts(),
      child: StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store App',
      debugShowCheckedModeBanner: false,
      home: StoreHomePage(),
    );
  }
}