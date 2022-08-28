import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'recipe.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String images;
  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      // arguments mengambil parameter
      onTap: () => Navigator.pushNamed(context, '/recipes',
          arguments: {'id': id, 'title': title}),
      child: Container(
        // child: Text(title),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(images),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              stops: [0.05, 0.6],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent],
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
