enum PasswordValidationError { empty, invalid }

class PasswordCriteriaItem {
  final String title;
  final String regEx;
  final bool isMatch;

  PasswordCriteriaItem({
    required this.title,
    required this.regEx,
    this.isMatch = true,
  });
}

abstract class PasswordValidator {
  static const String _has8Character = '.{8,32}';
  static const String _hasLetterAndNumbers = '^(?=.*[a-zA-Z])(?=.*[0-9])';
  static const String _hasUpperAndLowerCase = '^(?=.*[a-z])(?=.*[A-Z])';
  static const String _hasSpecialCharacters =
      '[*!@\$#%^&(){}:\\[\\];<>,.?~_\\+\\-=|]';

  static List<PasswordCriteriaItem> getCriteria() {
    final List<PasswordCriteriaItem> passworeCriteria = [
      PasswordCriteriaItem(
        title: 'Minimum of 8 characters',
        regEx: _has8Character,
      ),
      PasswordCriteriaItem(
        title: 'Mix of letters and numbers',
        regEx: _hasLetterAndNumbers,
      ),
      PasswordCriteriaItem(
        title: 'At least 1 uppercase and 1 lowercase letter',
        regEx: _hasUpperAndLowerCase,
      ),
      PasswordCriteriaItem(
        title: 'Minimum of 1 special character (ie. @, \$, %, &, etc.)',
        regEx: _hasSpecialCharacters,
      ),
    ];
    return passworeCriteria;
  }

  static PasswordValidationError? validatePassword(String? value) {
    final isNotEmpty = value?.isNotEmpty == true;
    if (isNotEmpty) {
      final isValid = _validate(value!);
      return isValid ? null : PasswordValidationError.invalid;
    }
    return PasswordValidationError.empty;
  }

  static bool _validate(String password) {
    if (!password.contains(RegExp(_has8Character))) return false;
    // if (!password.contains(RegExp(_hasLetterAndNumbers))) return false;
    // if (!password.contains(RegExp(_hasUpperAndLowerCase))) return false;
    // if (!password.contains(RegExp(_hasSpecialCharacters))) return false;
    return true;
  }
}
