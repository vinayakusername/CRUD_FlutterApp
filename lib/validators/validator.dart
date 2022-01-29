class Validator
{
  static String? validateField({required String value})
  {
    if(value.isEmpty)
    {
      return 'TextField can not be Empty';
    }
    return null;
  }

  static String? validateUserId({required String uid})
  {
     if(uid.isEmpty)
     {
       return 'User Id can not be empty';
     }
     else if(uid.length <= 5)
     {
       return 'User Id should be greater than 5 characters';
     }
     return null;
  }
}