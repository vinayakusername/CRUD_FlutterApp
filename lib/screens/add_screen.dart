import 'package:crud_firebase_flutter_application_1/screens/add_item_form.dart';
import 'package:crud_firebase_flutter_application_1/screens/app_bar_title.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget 
{
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

   AddScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector
    (
      onTap: ()
      {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },

      child: Scaffold
      (
        backgroundColor: Color(0xFF2C348A),
        appBar:AppBar
        (
          elevation: 2.0,
          backgroundColor: Color(0xFF2C348A),
          title: AppBarTitle(sectionName: 'CRUD'),
        ),
        body: SafeArea
        (
          child: Padding
          (
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom:20.0),
            child:AddItemForm
            (
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
            )
          )
        ),
      ),
    );
  }
}