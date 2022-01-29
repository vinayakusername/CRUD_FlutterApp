import 'package:crud_firebase_flutter_application_1/screens/app_bar_title.dart';
import 'package:crud_firebase_flutter_application_1/screens/edit_item_form.dart';
import 'package:crud_firebase_flutter_application_1/validators/database.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget 
{
  final String currentTitle;
  final String currentDescription;
  final String documentId;
  const EditScreen
  ({ 
    Key? key, 
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId 
   }) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> 
{

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

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
         backgroundColor: Color(0xFF2C384A),
         appBar: AppBar
         (
           elevation: 2.0,
           backgroundColor:Color(0xFF2C384A),
           title: AppBarTitle
                  (
                    sectionName: 'CRUD'
                  ),
           actions: 
           [
             if (_isDeleting) Padding
                           (
                             padding: const EdgeInsets.only(top: 10.0,bottom:10.0,right: 16.0),
                             child: CircularProgressIndicator
                             (
                               valueColor: AlwaysStoppedAnimation<Color>
                               (
                                 Colors.redAccent
                               ),
                               strokeWidth: 3,
                             ),
                           ) else IconButton
                             (
                               onPressed:()async
                               {
                                 setState(() 
                                 {
                                    _isDeleting = true;
                                 });
                                 await Database.deleteItem(docId: widget.documentId);
                                 setState(() 
                                 {
                                    _isDeleting = false;  
                                 });
                                 Navigator.of(context).pop();
                               }, 
                               icon: Icon(Icons.delete_forever,color: Colors.redAccent,size: 32,)
                             ),
           ],
         ),
         body: SafeArea
               (
                 child: Padding
                 (
                   padding: const EdgeInsets.only(left:16.0,right:16.0,bottom: 20.0),
                   child:Center(
                     child: Container
                     (
                       width: MediaQuery.of(context).size.width * .5,
                       child: EditItemForm
                       (
                         currentTitle:widget.currentTitle,
                         currentDescription:widget.currentDescription,
                         documentId:widget.documentId,
                         titleFocusNode:_titleFocusNode,
                         descriptionFocusNode:_descriptionFocusNode
                       ),
                     ),
                   )
                 )
               ),
       ),

    );
  }
}