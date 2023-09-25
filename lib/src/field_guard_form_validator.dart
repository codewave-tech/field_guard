// ignore_for_file: public_member_api_docs, sort_constructors_first
part of field_guard;

class FieldGuardCustomValidatorForm {
  late List<FieldGuardLinkerElement> _linkers;
  final Map<String, FieldGuardLinkerElement> _linkerMap = {};
  FieldGuardCustomValidatorForm({
    required List<FieldGuardLinkerElement> linkers,
  }) {
    _linkers = linkers;
    _generateLinkerMap();
  }

  void _generateLinkerMap() {
    for (int idx = 0; idx < _linkers.length; idx++) {
      if (_linkerMap.containsKey(_linkers[idx].key)) {
        throw ('Duplicate key found');
      }
      _linkerMap[_linkers[idx].key] = _linkers[idx];
    }
  }

  bool validateForm() {
    for (int idx = 0; idx < _linkers.length; idx++) {
      FieldGuardLinkerElement? linker = _linkerMap[_linkers[idx].key];
      if (linker == null) continue;
      String? res =
          linker.validator.validate().call(_linkers[idx].controller.text);
      if (res != null) {
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        linker.controller.notifyListeners();
        return false;
      }
    }
    return true;
  }

  FieldGuardValidator getValidatorBykey(String key) {
    if (!_linkerMap.containsKey(key)) {
      throw ("No such key exists");
    }

    return _linkerMap[key]!.validator;
  }

  TextEditingController getControllerByKey(String key) {
    if (!_linkerMap.containsKey(key)) {
      throw ("No such key exists");
    }

    return _linkerMap[key]!.controller;
  }

  void updateLinkerElement(FieldGuardLinkerElement linkerElement) {
    _linkerMap[linkerElement.key] = linkerElement;
  }

  FieldGuardLinkerElement findLinkerElementByKey(String key) {
    if (!_linkerMap.containsKey(key)) {
      throw ("No such key exists");
    }
    return _linkerMap[key]!;
  }
}

class FieldGuardLinkerElement {
  final String key;
  final TextEditingController controller;
  final FieldGuardValidator validator;

  FieldGuardLinkerElement({
    required this.key,
    required this.controller,
    required this.validator,
  });

  FieldGuardLinkerElement update({
    TextEditingController? controller,
    FieldGuardValidator? validator,
  }) {
    return FieldGuardLinkerElement(
      key: key,
      controller: controller ?? this.controller,
      validator: validator ?? this.validator,
    );
  }
}
