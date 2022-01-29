import 'package:cloud_firestore/cloud_firestore.dart';

//reference variable of firestore database is created
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//reference variable of root collection is created. 
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database
{
  static String? userId;

  // function to add data in firebase database.
  static Future<void> addItem({required String title,required String description}) async
  {
    DocumentReference documentReference = _mainCollection.doc(userId).collection('Items').doc();

    //Data is stored in Map collection got through form.
    Map<String,dynamic> data = <String,dynamic>
    {
      'title':title,
      'description':description
    };
    //Below statement is written to add collection of data passed through form into firestore database. 
    await documentReference.set(data)
                           .whenComplete(() => print('Not item inserted into the database'))
                           .catchError((e)=>print(e.to));
  }

  //Below function is used to updateItem in database
  static Future<void> updateItem({required String title,required String description,required String docId })async 
  {
    DocumentReference documentReference = _mainCollection.doc(userId).collection('Items').doc(docId);

    Map<String,dynamic> data = <String,dynamic>
    {
       'title':title,
       'description':description
    };

    /*await documentReference.set(data)
                           .whenComplete(() => print('Item not updated into database'))
                           .catchError((e)=>print(e.toString()));*/
    await documentReference.update(data)
                           .whenComplete(() => print('Item not updated into database'))
                           .catchError((e)=>print(e.toString())); 
  }

  //'readItems()' Function is created to read Items from database
  static Stream<QuerySnapshot> readItems()
  {
    CollectionReference notesCollectionReference = _mainCollection.doc(userId).collection('Items');
    return notesCollectionReference.snapshots();
  }

//deleteItem() function is created to delete Item from database
  static Future<void> deleteItem({required String docId})async
  {
    DocumentReference documentReference = _mainCollection.doc(userId).collection('Items').doc(docId);
    documentReference.delete()
                     .whenComplete(() => print('Requested Item is not deleted from Database'))
                     .catchError((e)=>print(e.toString()));
  }
}