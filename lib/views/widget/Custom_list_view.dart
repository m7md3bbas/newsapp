import 'package:flutter/material.dart';
import 'package:newsapp/models/Caterory_model.dart';
import 'package:newsapp/views/widget/custom_Card.dart';

// ignore: must_be_immutable
class CategoryListView extends StatelessWidget {
   CategoryListView({
    super.key,
  });
List<CategoryModel> category = [
    CategoryModel(image: "assets/technology.jpeg", text: "Business",categoryName:"Business" ),
    CategoryModel(image: "assets/technology.jpeg", text: "Entertainment",categoryName: "Entertainment"),
    CategoryModel(image: "assets/technology.jpeg", text: "Technology",categoryName:"Technology" ),
    CategoryModel(image: "assets/technology.jpeg", text: "Sports",categoryName: "Sports"),
    CategoryModel(image: "assets/technology.jpeg", text: "Science",categoryName: "Science"),
    CategoryModel(image: "assets/technology.jpeg", text: "Health",categoryName: "Health"),

  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) => CustomCategoryCard(categoryModel: category[index],)));
  }
}
