
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent([List props = const []]) : super();
}

class FetchProduct extends ProductEvent {
  const FetchProduct() : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchUserMoc extends ProductEvent {
  const FetchUserMoc() : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}