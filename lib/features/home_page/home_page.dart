import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upwork_practice/features/home_page/search_bar.dart';

import '../../constants/route_names.dart';
import 'contact_list_controller.dart';
import 'content_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: const <Widget>[
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SearchBar(),
          ),
          SizedBox(
            height: 6,
          ),
          ContentView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(selectedContactProvider.state).state = null;
          Navigator.pushNamed(context, RouteNames.addPage);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
