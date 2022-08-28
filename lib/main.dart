import 'package:flutter/material.dart';
import 'package:minggu_3_hari_4/pages/category_screen.dart';
import 'package:minggu_3_hari_4/pages/detail_food.dart';
import 'package:minggu_3_hari_4/pages/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/recipes': (context) => Recipe(),
        '/detail_food': (context) => DetailFoodPage(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Recipes",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: CategoryScreen(),
        ));
  }
}
