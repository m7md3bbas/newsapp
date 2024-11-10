import 'package:flutter/material.dart';
import 'package:newsapp/models/Caterory_model.dart';
import 'package:newsapp/views/main_pages/category_view.dart';

class CustomCategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  const CustomCategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryView(categoryName: categoryModel.categoryName),));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 250,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(categoryModel.image))),
        child: Center(
          child: Text(
            categoryModel.text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
