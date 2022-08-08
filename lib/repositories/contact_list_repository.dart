import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/contact.dart';

class ContactListRepository {

  List<Contact> contactList = [
    const Contact(
        name: 'Jack', surename: 'Leong', email: 'Jack.Leong@gmail.com'),
    const Contact(
        name: 'Marry', surename: 'Leong', email: 'Mary.Leong@gmail.com'),
    const Contact(
        name: 'Beatrice', surename: 'Chang', email: 'Beatrice.Chang@gmail.com'),
  ];

  List<Contact> getContactList(String filterText) {
    if (filterText.isNotEmpty) {
      List<Contact> list = [];
      for (Contact element in contactList) {
        String fullName = '${element.name.toLowerCase()} ${element.surename.toLowerCase()}';
        if (fullName.contains(filterText.toLowerCase())){
          list.add(element);
        }
      }
      return list;
    } else {
      return contactList;
    }
  }
}

/// Providers used by rest of the app
final contactListRepositoryProvider = Provider<ContactListRepository>((ref) {
  return ContactListRepository();
});

