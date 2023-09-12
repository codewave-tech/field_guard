## field_guard

The `field_guard` library provides a set of tools to implement field validation and formatting functionalities for Flutter applications. It offers reusable components to enforce various rules and constraints on user input, making it easier to create custom forms with linked elements and error messages.

### Classes:

1. `FieldGuardValidator`:

   - Purpose: This class is responsible for defining field validation rules and error messages.
   - Constructor: `FieldGuardValidator({FieldGuardErrorMessages? customErrorMessages, bool optionalField = false})`
   - Methods:
     - `validate()`: Returns a `FormFieldStringValidator` function that performs the field validation based on the defined rules.
     - `required()`: Adds a validation rule to check if the field is required and not empty.
     - `range({int min, int max})`: Adds a range validation rule to check if the input value falls within the specified minimum and maximum values.
     - `minLength(int len)`: Adds a validation rule to check if the input value has a minimum length of `len`.
     - `maxLength(int len)`: Adds a validation rule to check if the input value has a maximum length of `len`.
     - `length(int len)`: Adds a validation rule to check if the input value has an exact length of `len`.
     - `validPanIND()`: Adds a validation rule to check if the input value is a valid PAN (Permanent Account Number) for India.
     - `validIFSC()`: Adds a validation rule to check if the input value is a valid IFSC (Indian Financial System Code).
     - `validEmail()`: Adds a validation rule to check if the input value is a valid email address.
     - `matchRegex(RegExp regex, String errorMessage)`: Adds a validation rule to check if the input value matches the specified regular expression.
     - `strongPassword()`: Adds a validation rule to check if the input value is a strong password.
     - `validAccountNumber()`: Adds a validation rule to check if the input value is a valid account number.
     - `validUpiID()`: Adds a validation rule to check if the input value is a valid UPI (Unified Payments Interface) ID.
     - `validIndianZipCode()`: Adds a validation rule to check if the input value is a valid Indian zip code.
     - `validCreditCardNumber()`: Adds a validation rule to check if the input value is a valid credit card number.

2. `FieldGuardFormatter`:

   - Purpose: This class provides field formatting functionalities to enforce specific text transformations on user input.
   - Constructor: `FieldGuardFormatter()`
   - Methods:
     - `format()`: Returns a list of `TextInputFormatter` objects containing the defined text formatting rules.
     - `toTitleCase()`: Adds a text formatter to convert the input text to title case (first letter of each word capitalized).
     - `allowedInput(FieldGuardAllowedInput allowedInput)`: Adds a text formatter to allow only specific input patterns based on the `FieldGuardAllowedInput` enum.
     - `disallowFirstWhiteSpace()`: Adds a text formatter to disallow entering a whitespace character as the first character of the input.
     - `maxCoupledWhiteSpaces({int max = 1})`: Adds a text formatter to limit consecutive white spaces to a maximum of `max` times and replaces extra spaces with generated whitespace characters.
     - `toLowerCase()`: Adds a text formatter to convert the input text to lowercase.
     - `toUpperCase()`: Adds a text formatter to convert the input text to uppercase.

3. `FieldGuardCustomValidatorForm`:

   - Purpose: This class represents a custom validator form with linked elements for managing field validation and data binding.
   - Constructor: `FieldGuardCustomValidatorForm({required List<FieldGuardLinkerElement> linkers})`
   - Methods:
     - `validateForm()`: Validates the entire form by calling individual validators of each linked element. Returns `true` if the form is valid; otherwise, returns `false`.
     - `getValidatorBykey(String key)`: Retrieves the `FieldGuardValidator` associated with the specified key from the form.
     - `getControllerByKey(String key)`: Retrieves the `TextEditingController` associated with the specified key from the form.
     - `updateLinkerElement(FieldGuardLinkerElement linkerElement)`: Updates a linked element in the form with a new `FieldGuardLinkerElement`.
     - `findLinkerElementByKey(String key)`: Retrieves the `FieldGuardLinkerElement` associated with the specified key from the form.

4. `FieldGuardLinkerElement`:
   - Purpose: This class represents a single linked element in the custom validator form.
   - Constructor: `FieldGuardLinkerElement({required String key, required TextEditingController controller, required FieldGuardValidator validator})`
   - Methods:
     - `update({TextEditingController? controller, FieldGuardValidator? validator})`: Creates a new instance of the linked element with optionally updated `controller` and `validator`.

### Enum:

1. `FieldGuardAllowedInput`:
   - Purpose: This enum defines various allowed input patterns that can be used with the `allowedInput` method of `FieldGuardFormatter`.
   - Patterns:
     - `numberOnly(pattern: '0-9')`: Allows only numeric input.
     - `alphabetOnly(pattern: 'A-Za-z')`: Allows only alphabetic input.
     - `alphaNumericOnly(pattern: '0-9A-Za-z')`: Allows only alphanumeric input.
     - `alphabetsWithWhiteSpaces(pattern: 'A-Za-z ')`: Allows alphabetic input with white spaces.
     - `numbersWithWhiteSpaces(pattern: '0-9 ')`: Allows numeric input with white spaces.
     - `alphaNumericWithWhiteSpaces(pattern: '0-9A-Za-z ')`: Allows alphanumeric input with white spaces.
     - `emailAddress(pattern: '0-9A-Za-z@.-_')`: Allows email address input.

### Class `FieldGuardErrorMessages`:

This class provides error messages used for field validation in the "field_guard" library. The messages are specific to different validation rules and can be customized or translated as per application requirements.

Methods:

1. `rangeMinErrorMessage(int min)`: Returns the error message for a range validation with the specified minimum value.
2. `rangeMaxErrorMessage(int max)`: Returns the error message for a range validation with the specified maximum value.
3. `minLengthErrorMessage(int length)`: Returns the error message for a minimum length validation.
4. `maxLengthErrorMessage(int length)`: Returns the error message for a maximum length validation.
5. `invaidPANErrorMessage()`: Returns the error message for an invalid PAN (Permanent Account Number) validation.
6. `fieldRequiredErrorMessage()`: Returns the error message for a required field validation.
7. `invalidEmailErrorMessage()`: Returns the error message for an invalid email address validation.
8. `invaidIFSCErrorMessage()`: Returns the error message for an invalid IFSC (Indian Financial System Code) validation.
9. `invalidLengthErrorMessage(int len)`: Returns the error message for an invalid length validation.
10. `weakPasswordErrorMessage()`: Returns the error message for a weak password validation.
11. `invalidAccountNumberErrorMessage()`: Returns the
