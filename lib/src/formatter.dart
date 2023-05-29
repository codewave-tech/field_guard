part of field_guard;

class FieldGuardFormatter {
  final List<TextInputFormatter> _formatters = [];

  final Map<int, String> _wsCache = {};

  List<TextInputFormatter> format() => _formatters;

  FieldGuardFormatter toTitleCase() {
    _formatters.add(
      TextInputFormatter.withFunction(
        (oldValue, newValue) {
          return TextEditingValue(
            text: _titleCase(newValue.text),
            selection: newValue.selection,
          );
        },
      ),
    );

    return this;
  }

  FieldGuardFormatter allowedInput(FieldGuardAllowedInput allowedInput) {
    _formatters.add(
      FilteringTextInputFormatter.allow(
        RegExp('[${allowedInput.pattern}]'),
      ),
    );
    return this;
  }

  FieldGuardFormatter disallowFirstWhiteSpace() {
    _formatters.add(FilteringTextInputFormatter.deny(RegExp(r'^\s')));
    return this;
  }

  FieldGuardFormatter maxCoupledWhiteSpaces({int max = 1}) {
    _formatters.add(
      FilteringTextInputFormatter.deny(
        RegExp(r'\s{' + (max + 1).toString() + r',}'),
        replacementString: _generateWhiteSpaceChar(max),
      ),
    );
    return this;
  }

  String _generateWhiteSpaceChar(int n) {
    if (_wsCache.containsKey(n)) {
      return _wsCache[n]!;
    }

    String res = '';
    while (n-- > 0) {
      res += ' ';
    }

    _wsCache[n] = res;
    return res;
  }

  FieldGuardFormatter toLowerCase() {
    _formatters.add(
      TextInputFormatter.withFunction(
        (oldValue, newValue) {
          return TextEditingValue(
            text: newValue.text.toLowerCase(),
            selection: newValue.selection,
          );
        },
      ),
    );

    return this;
  }

  FieldGuardFormatter toUpperCase() {
    _formatters.add(
      TextInputFormatter.withFunction(
        (oldValue, newValue) {
          return TextEditingValue(
            text: newValue.text.toUpperCase(),
            selection: newValue.selection,
          );
        },
      ),
    );

    return this;
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

enum FieldGuardAllowedInput {
  numberOnly(pattern: '0-9'),
  alphabetOnly(pattern: 'A-Za-z'),
  alphaNumericOnly(pattern: '0-9A-Za-z'),
  alphabetsWithWhiteSpaces(pattern: 'A-Za-z '),
  numbersWithWhiteSpaces(pattern: '0-9 '),
  alphaNumericWithWhiteSpaces(pattern: '0-9A-Za-z '),
  emailAddress(pattern: '0-9A-Za-z@.-_');

  final String pattern;
  const FieldGuardAllowedInput({required this.pattern});
}
