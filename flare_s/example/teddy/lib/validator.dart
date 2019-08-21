enum FormType{login, register}

class EmailValidator{
  static String validate(String value){
    return value.isEmpty ? "Email cannot be empty" : null;

  }
}

class PasswordValidator{
  static String validate(String value){
    return value.isEmpty ? "Password cannot be empty" : null;

  }
}

