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

  getContactList({required String filterText}) async {
    try {
      state = const AsyncValue.loading();
      List<Contact> contactList = await _contactListRepository.getContactList(filterText);
      state = AsyncValue.data(contactList);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }

  saveContact({required Contact contact}) async {
    await _contactListRepository.saveContact(contact);
    await refreshList();
  }

  updateContact({required Contact contact}) async {
    await _contactListRepository.updateContact(contact);
    refreshList();
  }

  deleteContact({required Contact contact}) async {
    await _contactListRepository.deleteContact(contact.id);
    refreshList();
  }

  Future<void> refreshList() async {
    List<Contact> contactList = await _contactListRepository.getContactList(filterText);
    state = AsyncValue.data(contactList);
  }
}

final contactListControllerProvider = StateNotifierProvider.autoDispose<
    ContactListController, AsyncValue<List<Contact>>>((ref) {
  final contactListRepository = ref.watch(contactListRepositoryProvider);
  final filterText = ref.watch(searchTextProvider);
  return ContactListController(contactListRepository, filterText: filterText);
});

final selectedContactProvider = StateProvider<Contact?>((ref) {
  return null;
});

final searchTextProvider = StateProvider<String>((ref) {
  return '';
});

