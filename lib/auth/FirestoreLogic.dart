import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseApp tukuntazoApp = Firebase.app('Tukuntazo-Travel');
FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: tukuntazoApp);

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(String name, String username, String password) {
  // Call the user's CollectionReference to add a new user
  return users
      .add({
    'full_name': name, // John Doe
    'user': username, // Stokes and Sons
    'password': password // 42
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}


// Add data to a collection
// Future<void> addData(String username, String password) {
//   return firestore.collection('users').add({
//     'user': '$username',
//     'password': '$password',
//   });
// }

// Query data from a collection
// Future<void> getData() async {
//   QuerySnapshot querySnapshot = await firestore.collection('users').get();
//   querySnapshot.docs.forEach((document) {
//     print('Name: ${document.data()['user']}');
//     print('Email: ${document.data()['password']}');
//   });
// }
