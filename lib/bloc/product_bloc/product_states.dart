import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductState {
  const ProductState([List props = const []]) : super();
}

class ProductEmpty extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> Function() user;

  ProductLoaded({required this.user}) : super([user]);
}

class ProductError extends ProductState {
  final String? errorMsg;
  ProductError({this.errorMsg});
}