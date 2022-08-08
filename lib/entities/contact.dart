import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required String name,
    required String surename,
    required String email,
  }) = _Contact;

  factory Contact.fromJson(Map<String, Object?> json) =>
      _$ContactFromJson(json);
}
