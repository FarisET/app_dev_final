import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class UserApiClient {
  final http.Client httpClient;

  static var auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  static FirebaseStorage storage = FirebaseStorage.instance;

  //getter method
  //static get user => auth.currentUser!;
  UserApiClient({required this.httpClient});


  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() {
    return firestore.collection("products").snapshots();
  }

  // Future<List<User>> fetchUserMoc() async {
  //   return [User()];
  // }
}

