import 'package:field_guard/field_guard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Field Guard Example',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: textEditingController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              validator: FieldGuardValidator()
                  .required()
                  .validEmail()
                  .validEmail()
                  .validate(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: FieldGuardFormatter()
                  .toTitleCase()
                  .allowedInput(FieldGuardAllowedInput.alphabetsWithWhiteSpaces)
                  .maxCoupledWhiteSpaces()
                  .format(),
            ),
          ],
        ),
      ),
    );
  }
}
