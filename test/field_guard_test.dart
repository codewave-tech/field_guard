import 'package:flutter_test/flutter_test.dart';

import 'package:field_guard/field_guard.dart';

void main() {
  test('Testing required and PAN', () {
    FieldGuardValidator fieldGuardValidator =
        FieldGuardValidator().required().range(min: 100, max: 600);

    print(fieldGuardValidator.validate().call('90'));
  });
}
