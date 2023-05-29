library field_guard;

import 'package:field_guard/src/error_messages.dart';
import 'package:flutter/services.dart';

part 'formatter.dart';

typedef FormFieldStringValidator = String? Function(String? val);

class FieldGuardValidator {
  final FieldGuardErrorMessages? customErrorMessages;
  final bool optionalField;

  FieldGuardValidator({
    this.customErrorMessages,
    this.optionalField = false,
  }) : _errorMessages = customErrorMessages ?? FieldGuardErrorMessages();

  late final FieldGuardErrorMessages _errorMessages;

  final List<FormFieldStringValidator> _validations = [];

  void _createValidation(FormFieldStringValidator validator) {
    _validations.add(validator);
  }

  FormFieldStringValidator validate() => _validate;

  String? _validate(String? val) {
    if (optionalField && (val == null || val.isEmpty)) {
      return null;
    }

    for (int idx = 0; idx < _validations.length; idx++) {
      String? res = _validations[idx].call(val);
      if (res != null) {
        return res;
      }
    }
    return null;
  }

  /// field required
  FieldGuardValidator required() {
    _createValidation((val) {
      if (val == null || val.isEmpty) {
        return _errorMessages.fieldRequiredErrorMessage();
      }
      return null;
    });
    return this;
  }

  /// range validation
  FieldGuardValidator range({
    required int min,
    required int max,
  }) {
    _createValidation((val) {
      int? value = int.tryParse(val!);
      if (value == null) {
        throw ('Parsing failed, make sure to provide a valid number');
      }
      if (value < min) return _errorMessages.rangeMinErrorMessage(min);
      if (value > max) return _errorMessages.rangeMinErrorMessage(max);

      return null;
    });
    return this;
  }

  // minimum length required
  FieldGuardValidator minLength(int len) {
    _createValidation((val) {
      if (val!.length < len) return _errorMessages.minLengthErrorMessage(len);
      return null;
    });
    return this;
  }

  // maximum lenght required
  FieldGuardValidator maxLength(int len) {
    _createValidation((val) {
      if (val!.length > len) return _errorMessages.maxLengthErrorMessage(len);

      return null;
    });
    return this;
  }

  // length
  FieldGuardValidator length(int len) {
    _createValidation((val) {
      if (val!.length != len) {
        return _errorMessages.invalidLengthErrorMessage(len);
      }

      return null;
    });
    return this;
  }

  // validate PAN INDIA
  FieldGuardValidator validPanIND() {
    String pattern = r'^(([a-zA-Z]{5})([0-9]{4})([a-zA-Z]{1})$)';
    RegExp regex = RegExp(pattern);
    return matchRegex(regex, _errorMessages.invaidPANErrorMessage());
  }

  // validate PAN INDIA
  FieldGuardValidator validIFSC() {
    String pattern = r'^[A-Z]{4}0[A-Z0-9]{6}$';
    RegExp regex = RegExp(pattern);
    return matchRegex(regex, _errorMessages.invaidIFSCErrorMessage());
  }

  // validate PAN INDIA
  FieldGuardValidator validEmail() {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(pattern);
    return matchRegex(regex, _errorMessages.invalidEmailErrorMessage());
  }

  // validate regex
  FieldGuardValidator matchRegex(RegExp regex, String errorMessage) {
    _createValidation((val) {
      if (!regex.hasMatch(val!)) {
        return errorMessage;
      }
      return null;
    });
    return this;
  }
}
