import 'package:app_dev_final/core/network/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final UserApiClient userApiClient;

  ProductRepository({required this.userApiClient});

  Future<Stream<QuerySnapshot<Map<String, dynamic>>> Function()> getproduct() async {
    return userApiClient.getAllProducts;
  }
  // Future<Future<List<User>>> getUserMoc() async {
  //   return userApiClient.fetchUserMoc();
  // }

}