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
              validator:
                  FieldGuardValidator().required().validEmail().validate(),
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

  String _titleCase(String input) {
    if (input.isEmpty) return input;

    List<String> words = input.split(' ');
    List<String> titleCaseWords = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).toList();

    return titleCaseWords.join(' ');
  }
}
