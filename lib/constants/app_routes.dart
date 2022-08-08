import 'package:flutter/material.dart';
import 'package:upwork_practice/constants/route_names.dart';
import 'package:upwork_practice/features/add_page/add_page.dart';
import 'package:upwork_practice/features/detail_page/detail_page.dart';
import 'package:upwork_practice/features/home_page/home_page.dart';

class AppRoutes{
  static final routes = {
    RouteNames.homePage : (context) => const HomePage(title: 'Contact List App'),
    RouteNames.addPage : (context) => const AddPage(),
    RouteNames.detailPage : (context) => const DetailPage(),
  };
}