import 'package:flutter/material.dart';

class DetailFoodPage extends StatelessWidget {
  const DetailFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // menyimpan aruments ynag sudah dikirim di halaman recipe
    // memberikan tanda "!" untuk memberitahu jika ini tidak boleh null /  sudah ada isinya
    Map<String, dynamic> argFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // membuat variable baru karena bertipe list
    List<String> ingredients = argFood["ingredients"];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 150, left: 24, right: 24),
        child: Column(
          children: [
            Text(
              argFood["title"],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('${ingredients.length} items'),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: ((context, index) {
                  // membuat data baru dari ingredients
                  final ing = ingredients[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(ing, style: TextStyle(color: Colors.black, fontSize: 16),));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
