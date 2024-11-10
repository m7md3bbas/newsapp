import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/serviecs/news_services.dart';
import 'package:newsapp/views/widget/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
Future<void> _refreshData(BuildContext context) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final newsResponse = await NewsServices(dio: Dio()).getTopHeadlinesNews(category: categoryName);

      if (newsResponse.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text('Everything is up to date!',style: TextStyle(color: Colors.black),),),backgroundColor: Colors.white,),
        );
      }
    } catch (error) {
      // Handle error case
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $error')),
      );
    }
  }

  CategoryView({super.key, required this.categoryName});
final String categoryName;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Center(child: Text(categoryName,style: const TextStyle(fontSize: 30),)),
      ),
      body:Stack(
        children:[ RefreshIndicator(
          onRefresh:()=> _refreshData(context),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
          slivers: [
            NewsListViewbuilder(category: categoryName,)
          ],
              ),
        ),
            
            ]
      ));
  }
}