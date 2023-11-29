import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../idempiere_rest/idempiere_client.dart';
import '../../idempiere_rest/po.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({super.key});

  @override
  State<ManualPage> createState() => _ConditionalFieldsState();
}

class _ConditionalFieldsState extends State<ManualPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  int? option;
  TextEditingController inputtextfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          FormBuilderDropdown<int>(
            name: 'options',
            validator: FormBuilderValidators.required(),
            decoration: const InputDecoration(
              label: Text('Select the option'),
            ),
            onChanged: (value) {
              setState(() {
                option = value;
              });
            },
            items: const [
              DropdownMenuItem(value: 0, child: Text('Show textfield')),
              DropdownMenuItem(value: 1, child: Text('Show info text')),
            ],
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: option == 0,
            // Can use to recreate completely the field
            // maintainState: false,
            child: FormBuilderTextField(
              name: 'textfield',
              controller: inputtextfield..text = 'jozin',
              validator: FormBuilderValidators.minLength(4),
              decoration: const InputDecoration(
                label: Text('Magic field'),
              ),
            ),
          ),
          Visibility(
            visible: option == 1,
            child: const Text('Magic info'),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: ()
              //List<T> records = [];
             // client = IdempiereClient().instance;

          //    Future<List<Po>> records = IdempiereClient().get<Po>(
         //     "models/ad_user", (json) => Po(json),
          //    orderBy: [ 'Name'],
           //   select: ['Name', 'Value'],
           //   top: 10,
          //    skip: 2,
           //   showsql: true);
              async {
              Po? user = await IdempiereClient().getRecord<Po>(
                  "models/ad_user", 1000003, (json) => Po(json));
              if (user!=null && user.hasJson) {
                inputtextfield.text = user.json_po['Name'];// 'api_test@idempiere.sk';
              }
            },

          ),
        ],
      ),
    );
  }
}
