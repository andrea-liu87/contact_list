import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:upwork_practice/constants/route_names.dart';
import '../../constants/app_const.dart';
import '../../entities/contact.dart';

class ContentView extends StatelessWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactList = <Contact>[
      Contact(id: 0, name: 'Shania', surename: 'Twain', email: 's.twain@yahoo.com'),
      Contact(id: 1, name: 'Leonardo', surename: 'Dicaprio', email: 'leo.d@gmail.com')
    ];
    return Flexible(
      child: ContactListView(contactList: contactList,),
    );
  }
}

class ContactListView extends StatelessWidget {
  const ContactListView({Key? key, required this.contactList}) : super(key: key);
  final List<Contact> contactList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: contactList.length,
      itemBuilder: (context, position) {
        return Hero(
          tag: 'ListViewHero',
          child: ListTile(
              title: Text(
                '${contactList[position].name} ${contactList[position].surename}',
                style: AppConst.textStyleTitle,
              ),
              subtitle: Text(contactList[position].email, style: AppConst.textStyleGeneral,),
              onTap: (){
                Navigator.pushNamed(context, RouteNames.detailPage, arguments: contactList[position]);
                },
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {return const Divider(color: AppConst.kGray,);},
    );
  }
}