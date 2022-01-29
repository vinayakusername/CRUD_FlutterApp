import 'package:crud_firebase_flutter_application_1/custom_widgets/custom_form_field.dart';
import 'package:crud_firebase_flutter_application_1/screens/home_screen.dart';
import 'package:crud_firebase_flutter_application_1/validators/database.dart';
import 'package:crud_firebase_flutter_application_1/validators/validator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget 
{
  /*
  When a text field is selected and accepting input, it is said to have “focus.”
  Use the FocusNode to identify a specific TextField in Flutter’s “focus tree.” 
  This allows you to give focus to the TextField.

  Since focus nodes are long-lived objects, manage the lifecycle using a State object.
  */
  final FocusNode focusNode;
  const LoginForm
  ({ 
    Key? key,
    required this.focusNode 
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> 
{
   final TextEditingController _uidController = TextEditingController();
   final _loginFormKey = GlobalKey<FormState>();
   String _getID = '';
  @override
  Widget build(BuildContext context) 
  {
    return Center
    (
      child: Container
      (
        /*
          "MediaQuery.of(context).size" is used to adjust UI of app as per different devices automatically.
          size.width * .6 it describe the 60% widht of screen size it will occupy on which app is running.
          size.heigth * .3 it describe the 30% heigth of screen size it will occupy on which app is running. 
        */
        width: MediaQuery.of(context).size.width * .6,
        height: MediaQuery.of(context).size.width * .3,
        child: Form
         (
           key: _loginFormKey,
           child: Column
           (
             children: 
             [
              Padding
              (
                padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 24.0),
                child: Column
                (
                  children: 
                  [
                    CustomFormField
                    (
                      initialValue: "",
                      isObscure: true,
                      controller: _uidController, 
                      focusNode: widget.focusNode, 
                      keyboardType: TextInputType.text, 
                      inputAction: TextInputAction.done, 
                      label: 'Unique User ID', 
                      hint: 'Enter Your Unique Identifier', 
                      validator: (value)
                      {
                        Validator.validateUserId(uid: value);
                        _getID = value;
                      }
                    )
                  ],
                ),
              ),

              Padding
              (
                padding: const EdgeInsets.only(left: 0.0,right:0.0),
                child: Container
                (
                  width: double.maxFinite,
                  child: ElevatedButton
                  (
                    onPressed: ()
                    {
                      widget.focusNode.unfocus(); 

                      if(_loginFormKey.currentState!.validate())
                      {
                        //Database.userId = _uidController.text;
                        Database.userId = _getID;

                        Navigator.of(context).pushReplacement
                                             (
                                               MaterialPageRoute(builder:(context)=>HomeScreen())
                                             );
                      } 

                    }, 
                    child: Padding
                          (
                            padding: const EdgeInsets.only(top: 16.0,bottom:16.0),
                            child:Text
                                  (
                                    'Login',
                                    style: TextStyle
                                    (
                                      color: Colors.blueGrey,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2
                                    )
                                  ),
                          ),
                    style: ButtonStyle
                    (
                      backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                      shape: MaterialStateProperty.all
                      (
                        RoundedRectangleBorder
                        (
                          borderRadius: BorderRadius.circular(10)
                        ))
                    ),
                  ),

                ),
              )

             ],
           )
         ),
      ),
    );
  }
}