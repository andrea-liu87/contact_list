import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upwork_practice/entities/contact.dart';
import 'package:upwork_practice/features/home_page/search_bar.dart';
import 'package:upwork_practice/repositories/contact_list_repository.dart';

class ContactListController extends StateNotifier<AsyncValue<List<Contact>>> {
  final ContactListRepository _contactListRepository;
  final String filterText;

  ContactListController(this._contactListRepository, {required this.filterText})
      : super(const AsyncValue.loading()) {
    getContactList(filterText: filterText);
  }

  getContactList({required String filterText}) {
    try {
      state = const AsyncValue.loading();
      List<Contact> contactList = _contactListRepository.getContactList(filterText);
      state = AsyncValue.data(contactList);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}

final contactListControllerProvider = StateNotifierProvider.autoDispose<
    ContactListController, AsyncValue<List<Contact>>>((ref) {
  final contactListRepository = ref.watch(contactListRepositoryProvider);
  final filterText = ref.watch(searchTextProvider);
  return ContactListController(contactListRepository, filterText: filterText);
});
