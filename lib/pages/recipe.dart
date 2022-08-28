import 'package:flutter/material.dart';
import 'package:minggu_3_hari_4/pages/dummy._data.dart';

import '../model/food.dart';

class Recipe extends StatefulWidget {
  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filteredFood = dummy_food.where((food) {
      return food.category.contains(argsRecipe["id"]);
    }).toList();
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            argsRecipe['title'],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: filteredFood.length,
            itemBuilder: ((context, index) {
              final food = filteredFood[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail_food', arguments: {
                    'title': food.title,
                    'ingredients': food.ingredients,
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(food.imageUrl),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.timer_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      ' ${food.duration.toString()} mins',
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isFav = !isFav;
                                        food.isFavorite = isFav;
                                      });
                                      print(food.isFavorite);
                                    },
                                    icon: Icon(
                                      food.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      size: 30,
                                    ),
                                    color: Colors.redAccent)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
