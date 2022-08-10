import 'package:flutter/material.dart';
import 'package:upwork_practice/constants/app_const.dart';
import 'package:upwork_practice/constants/route_names.dart';
import 'package:upwork_practice/features/detail_page/detail_page.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../entities/contact.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    final _contactData = ModalRoute.of(context)!.settings.arguments as Contact;
    final _formKey = GlobalKey<FormBuilderState>();
    return Card(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FormField(
                labelString: 'Name',
                initialValue: _contactData.name ?? '',
              ),
              FormField(
                labelString: 'Surename',
                initialValue: _contactData.surename ?? '',
              ),
              FormField(
                labelString: 'Email',
                initialValue: _contactData.email ?? '',
                inputType: TextInputType.emailAddress,
              ),
              const Spacer(),
              EditButton(
                text: 'SAVE',
                onPressed: () {
                  _formKey.currentState?.save();
                  Contact contact = Contact(
                    id: 0,
                    name: _formKey.currentState!.value['Name'] ?? '',
                    surename: _formKey.currentState?.value['Surename'].toString() ?? '',
                    email: _formKey.currentState?.value['Email'].toString() ?? ''
                  );
                  if (contact.name.isEmpty && contact.surename.isEmpty && contact.email.isEmpty){
                    return;
                  }  else {
                    // save Contact here
                  }
                  Navigator.pushNamedAndRemoveUntil(context, RouteNames.homePage, (Route<dynamic> route) => false);
                },
              ),
            ],
            ),
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
      child: FormBuilderTextField(
        name: labelString,
          decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: labelString, labelStyle: AppConst.textStyleGeneral),
          initialValue: initialValue,
          keyboardType: inputType ?? TextInputType.name,
      ),
    );
  }
}
