import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final Function(String) onSubmitHandler;
  const InputForm({Key? key, required this.onSubmitHandler}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(hintText: 'Enter a TODO'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  widget.onSubmitHandler(myController.text);
                },
              ),
            )
          ],
        ));
  }
}
