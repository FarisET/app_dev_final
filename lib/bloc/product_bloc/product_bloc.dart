

import 'package:app_dev_final/bloc/product_bloc/product_event.dart';
import 'package:app_dev_final/bloc/product_bloc/product_states.dart';
import 'package:app_dev_final/core/repository/product_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository userRepository;

  ProductBloc({required this.userRepository}) : super(ProductLoading()) {
    on<FetchProduct>((event, emit) async {
      await _getUser(emit);
    });

    // on<FetchUserMoc>((event, emit) async {
    //   await _getUserMoc(emit);
    // });

  }

  Future<void> _getUser(Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final Stream<QuerySnapshot<Map<String, dynamic>>> Function() user = await userRepository.getproduct();
      emit(ProductLoaded(user: user));
    } catch (e) {
      emit(ProductError(errorMsg: e.toString()));
    }
  }


  // Future<void> _getUserMoc(Emitter<UserState> emit) async {
  //   emit(UserLoading());
  //   try {
  //     final Future<List<Cuser>> user = await userRepository.getUserMoc();
  //     emit(UserLoaded(user: user));
  //   } catch (e) {
  //     emit(UserError(errorMsg: e.toString()));
  //   }
  // }
}

