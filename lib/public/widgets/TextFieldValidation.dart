

class TextFieldValidation {
  bool mobileNoValidate(String _mobileNo) {
    if (_mobileNo.length != 11) {
      return false;
    } else {
      return true;
    }
  }

  bool passwordValidation(String _password) {
    if (_password.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  bool firstNameValidation(String _username) {
    if (_username.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
  bool lastNameValidation(String _username) {
    if (_username.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool emailValidation(String _email) {
    if (_email.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool addressValidation(String _address) {
    if (_address.isEmpty) {
      return false;
    } else {
      return true;
    }
  }


}
