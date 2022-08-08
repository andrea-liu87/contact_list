import 'package:flutter/material.dart';
import 'package:upwork_practice/constants/app_const.dart';
import 'package:upwork_practice/features/detail_page/detail_page.dart';

import '../../entities/contact.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactData = ModalRoute.of(context)!.settings.arguments as Contact?;
    return Card(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FormField(
              labelString: 'Name',
              initialValue: contactData?.name ?? '',
            ),
            FormField(
              labelString: 'Surename',
              initialValue: contactData?.surename ?? '',
            ),
            FormField(
              labelString: 'Email',
              initialValue: contactData?.email ?? '',
              inputType: TextInputType.emailAddress,
            ),
            const Spacer(),
            EditButton(
              text: 'SAVE',
              onPressed: () {},
            ),
          ],
          ),
        ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    required this.labelString,
    required this.initialValue,
    this.inputType
  }) : super(key: key);

  final String labelString;
  final String initialValue;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: labelString, labelStyle: AppConst.textStyleGeneral),
          initialValue: initialValue,
          keyboardType: inputType ?? TextInputType.name,
      ),
    );
  }
}
