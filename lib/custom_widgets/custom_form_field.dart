import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField
  ({ 
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String label,
    required String hint,
    required String initialValue,
    required Function(String value) validator,
    this.isObscure = false,
    this.isCapitalize = false,
    this.maxLines =1,
    this.isLabelEnabled = true

   }) : // reference variables are initialized through constructor.
         _emailController = controller,
         _focusNode=focusNode,
         _keyboardType = keyboardType,
         _inputAction = inputAction,
         _label = label,
         _hint = hint,
         _initialValue = initialValue,  
         _validator = validator,
        super(key: key);

//variable declaration
  final TextEditingController _emailController;
  final FocusNode _focusNode; 
  final TextInputType _keyboardType;
  final TextInputAction _inputAction;
  final String _label;
  final String _hint;
  final String _initialValue;
  final bool isObscure;
  final bool isCapitalize;
  final int maxLines;
  final bool isLabelEnabled;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) 
  {
    return _buildTextFormField();
  }

  Widget _buildTextFormField()
  {
    return TextFormField
    (
        style: TextStyle(color: Colors.grey),
        initialValue: _initialValue, 
        maxLines: maxLines,
        controller: _emailController,
        //focusNode: _emailFocusNode,
        keyboardType: _keyboardType,
        obscureText: isObscure,
        textCapitalization: isCapitalize? TextCapitalization.words:TextCapitalization.none,
        textInputAction:_inputAction,
        cursorColor: Colors.yellowAccent,
        validator: (value)=>_validator(value!),
        decoration: InputDecoration
        (
          labelText: isLabelEnabled? _label : null,
          labelStyle: TextStyle(color: Colors.yellowAccent),
          hintText: _hint,
          hintStyle: TextStyle(color: Colors.blueGrey),
          errorStyle: TextStyle
                      (
                         color: Colors.redAccent,
                         fontWeight: FontWeight.bold
                      ),
          focusedBorder:OutlineInputBorder
          (
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide
            (
              color: Colors.amberAccent,
              width: 2
            ),
            
          ),
          enabledBorder: OutlineInputBorder
          (
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide
            (
              color: Colors.blueGrey
            )
          ),
          errorBorder: OutlineInputBorder
          (
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide
            (
              color: Colors.redAccent,
              width: 2
            )
          ),
          focusedErrorBorder: OutlineInputBorder
          (
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide
            (
              color:Colors.redAccent,
              width: 2
            )
          )
        ),
    );
  }
}
