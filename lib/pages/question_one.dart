// ignore_for_file: prefer_const_constructors

import 'package:app_dev_final/bloc/product_bloc/product_bloc.dart';
import 'package:app_dev_final/bloc/product_bloc/product_event.dart';
import 'package:app_dev_final/bloc/product_bloc/product_states.dart';
import 'package:app_dev_final/models/product_model.dart';
import 'package:app_dev_final/core/repository/product_repo.dart';
import 'package:app_dev_final/widgets/transaction_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  final ProductRepository userRepository;

  const HomePage({super.key, required this.userRepository});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;

  late ProductBloc _userBloc;
  List<Products> _userList = [];

  @override
  void initState() {
    super.initState();
    _userBloc = ProductBloc(userRepository: widget.userRepository);
    _userBloc.add(const FetchProduct());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
          ],
        ),
        body: BlocBuilder(
          bloc: _userBloc,
          builder: (_, ProductState state) {
            if (state is ProductEmpty) {
              return const Center(child: Text('Empty state'));
            }
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoaded) {
              return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: state.user(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _userList = snapshot.data!.docs
                        .map((doc) => Products.fromJson(doc.data()))
                        .toList();

                    if (_userList.isEmpty) {
                      // Handle empty list
                      return const Center(
                        child: Text(
                          "No Transactions Available",
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    }

                    return ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 400,
                                child: ListView.builder(
                                  itemCount: _userList.length,
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * .01,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return TransactionCard(
                                      user: _userList[index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Handle error state
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  } else {
                    // Handle initial loading state
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            }
            if (state is ProductError) {
              return const Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
