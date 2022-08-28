import 'package:flutter/material.dart';
import 'package:minggu_3_hari_4/pages/category_item.dart';
import 'package:minggu_3_hari_4/pages/dummy._data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(15.0),
        itemCount: dummyCategories.length,
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 10 / 12),
        itemBuilder: (context, index) {
          final category = dummyCategories[index];
          return CategoryItem(id: category.id, title: category.title, images: category.images,);
        });
  }
}
