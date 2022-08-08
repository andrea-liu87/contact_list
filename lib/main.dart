import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upwork_practice/constants/app_const.dart';
import 'package:upwork_practice/constants/app_routes.dart';
import 'package:upwork_practice/constants/route_names.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppConst.kThemeApp,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: RouteNames.homePage,
    );
  }
}
