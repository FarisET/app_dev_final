import 'package:app_dev_final/core/network/api.dart';
import 'package:app_dev_final/core/repository/product_repo.dart';
import 'package:app_dev_final/firebase_options.dart';
import 'package:app_dev_final/pages/question_one.dart';
import 'package:app_dev_final/pages/question_two.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
      final ProductRepository userRepository = ProductRepository(
    userApiClient: UserApiClient(
      httpClient: http.Client(),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  // name: 'web',
  options: DefaultFirebaseOptions.currentPlatform,
);
 runApp(MyApp(
  userRepository: userRepository,
 ));
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.userRepository});
  final ProductRepository userRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App dev final',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UiScreen() //HomePage(userRepository: userRepository,),
  //           routes: {
  //   '/signup_page':(context) => SignupPage(userRepository: userRepository,),
  //   '/login_page':(context) =>  LoginPage(userRepository: userRepository,),
  //   '/home_page': (context) => HomePage(userRepository: userRepository,)

  // },

    );
  }
}

