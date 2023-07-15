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
      String? res = _linkers[idx]
          .validator
          .validate()
          .call(_linkers[idx].controller.text);
      if (res != null) {
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        _linkers[idx].controller.notifyListeners();
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
}
