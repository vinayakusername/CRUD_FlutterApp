import 'package:crud_firebase_flutter_application_1/screens/add_screen.dart';
import 'package:crud_firebase_flutter_application_1/screens/app_bar_title.dart';
import 'package:crud_firebase_flutter_application_1/screens/item_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
       backgroundColor: Color(0xFF2C348A),
       appBar: AppBar
       (
         elevation: 2.0,
         backgroundColor: Color(0xFF2C348A),
         title: AppBarTitle(sectionName: 'CRUD'),
       ),  

       floatingActionButton: FloatingActionButton
       (
         backgroundColor:Colors.orangeAccent,
         child:Icon
         (
           Icons.add,
           color: Colors.white,
           size: 32.0,
         ),
         onPressed:()=> Navigator.of(context).push
                                             (
                                               MaterialPageRoute
                                                (
                                                  builder:(context)=>AddScreen()
                                                )
                                              ),
       ),

      /*
         SafeArea is an important and useful widget in Flutter which makes UI dynamic and adaptive to a wide variety of devices. 
         While designing the layout of widgets, we consider different types of devices and their pre-occupied constraints of screen 
         like status bar, notches, navigation bar, etc. 
         But new devices are being launched with different designs and in certain scenarios, 
         your app might overlay any of those pre-occupied constraints. So, in order to make our UI adaptive 
         and error-free, we use SafeArea widget.

        In simple words, SafeArea is basically a padding widget, which adds any necessary padding to your app, 
        based on the device it is running on. 
        If your app’s widgets are overlaying any of the system’s features like notches, status bar, camera holes, 
        or any other such features, then SafeArea would add padding around the app, as required.

        Internally SafeArea uses MediaQuery to check the dimensions of the display screen 
        and includes extra padding if needed.
       */

       body: SafeArea
       (
         child: Padding
         (
           padding:const EdgeInsets.only(left:160.0,right: 16.0,bottom: 20.0),
           child: Container
           (
             width: MediaQuery.of(context).size.width * .8,
             child: ItemList()
           ),
         )
       ),
    );
  }
}