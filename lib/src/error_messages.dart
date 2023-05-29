class FieldGuardErrorMessages {
  String rangeMinErrorMessage(int min) => 'Minimum : $min';

  String rangeMaxErrorMessage(int max) => 'Maximum : $max';

  String minLengthErrorMessage(int length) => 'Minimum Length : $length';

  String maxLengthErrorMessage(int length) => 'Maximum Length : $length';

  String invaidPANErrorMessage() => 'PAN invalid';

  String fieldRequiredErrorMessage() => 'This field is required';

  String invalidEmailErrorMessage() => 'The email provided is invalid';

  String invaidIFSCErrorMessage() => 'The IFSC code is invalid';

  String invalidLengthErrorMessage(int len) =>
      'length should be equal to : $len';
}
