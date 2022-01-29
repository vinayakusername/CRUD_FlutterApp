import 'package:crud_firebase_flutter_application_1/custom_widgets/custom_form_field.dart';
import 'package:crud_firebase_flutter_application_1/validators/database.dart';
import 'package:crud_firebase_flutter_application_1/validators/validator.dart';
import 'package:flutter/material.dart';

class AddItemForm extends StatefulWidget 
{
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;

  const AddItemForm
  ({ 
    Key? key, 
    required this.titleFocusNode,
    required this.descriptionFocusNode 
  }) : super(key: key);

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> 
{
  //Using GlobalKey we can uniquely identifies the Form, and allows validation of the form.
  final _addItemFormKey = GlobalKey<FormState>();

  bool isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _getTitle = '';
  String _getDescription =''; 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView
    (
      child: Form
      (
        key: _addItemFormKey,
        child: Center
        (
          child: Container
          (
            width:MediaQuery.of(context).size.width * .5,
            child: Column
            (
              children: 
              [
                Padding
                (
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom:24.0),
                  child: Column
                  (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [
                      SizedBox(height: 24.0,),
                      Text
                      (
                        'Title',
                        style: TextStyle
                        (
                          color:Colors.yellow,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1
    
                        ),
                      ),
                      SizedBox(height: 8.0,),
                      CustomFormField
                      (
                        initialValue: "",
                        isLabelEnabled: false,
                        controller: _titleController, 
                        focusNode:widget.titleFocusNode, 
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next, 
                        label: 'Title', 
                        hint: 'Write your title here', 
                        validator: (value)
                        { 
                          Validator.validateField(value: value);
                          _getTitle = value;
                        }
                      ),
                      SizedBox(height: 24.0,),
                      Text
                      (
                        'Description',
                        style: TextStyle
                        (
                          color:Colors.yellow,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1
    
                        ),
                      ),
                      SizedBox(height: 8.0,),
                      CustomFormField
                      (
                        initialValue: "",
                        maxLines: 10,
                        isLabelEnabled: false,
                        controller: _descriptionController, 
                        focusNode:widget.descriptionFocusNode, 
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next, 
                        label: 'Description', 
                        hint: 'Write description title here', 
                        validator: (value)
                        {
                          Validator.validateField(value: value);
                          _getDescription = value;
                        }
                      ),
                    ],
                  ),
                ),
               isProcessing 
                        ? Padding
                          (
                            padding: const EdgeInsets.all(16.0),
                            child: CircularProgressIndicator
                            (
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent)
                            ),
                          ) : Container
                              ( 
                                width: double.maxFinite,
                                child: ElevatedButton
                                       (
                                         onPressed:() async
                                         {
                                             widget.titleFocusNode.unfocus();
                                             widget.descriptionFocusNode.unfocus();
    
                                             if(_addItemFormKey.currentState!.validate())
                                             {
                                               setState(() 
                                               {
                                                  isProcessing =true;  
                                               });
    
                                               await Database.addItem(title: _getTitle, description:_getDescription);
    
                                               setState(() 
                                               {
                                                 isProcessing = false;
                                               });
    
                                               Navigator.of(context).pop();
                                             }
                                         }, 
                                         child:Padding
                                              (
                                                padding: const EdgeInsets.only(top: 16.0,bottom: 16.0),
                                                child: Text
                                                      (
                                                        'Add Data',
                                                        style: TextStyle
                                                        (
                                                          fontSize: 24.0,
                                                          letterSpacing:2,
                                                          fontWeight:FontWeight.bold,
                                                          color: Colors.blueGrey
                                                        ),
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
                                             )
                                           )
                                         ),
                                         
                                       ),
                              ) 
              
              ]
            ),
          ),
        ),
      ),
    );
  }
}