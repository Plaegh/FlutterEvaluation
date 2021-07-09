import 'package:flutter/material.dart';
import 'package:flutter_evaluation/src/views/pages/firstScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import './src/views/routes.dart';
import './src/model/serviceModel.dart';
import 'locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<ServiceModel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        home: HomeScreen(),
        title: 'Flutter Evaluation',
        theme: ThemeData(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}



