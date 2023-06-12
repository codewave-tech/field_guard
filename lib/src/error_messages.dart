
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
  
  String weakPasswordErrorMessage() =>
      'Your password should contain atleast 8 characters, \n1 uppercase, \n1 lowercase, \n1 number and \n1 special character';

  String invalidAccountNumberErrorMessage() => 'The account number is invalid';

  String invalidUpiIdErrorMessage() => 'The UPI ID is invalid';

  String invalidZipCodeErrorMessage() => 'The zip code is invalid';

  String invalidCardNumber() => 'The card number is invalid';
}
