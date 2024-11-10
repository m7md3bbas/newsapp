import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/serviecs/news_services.dart';
import 'package:newsapp/views/widget/news_list_view.dart';

class NewsListViewbuilder extends StatefulWidget {
 const NewsListViewbuilder({super.key,required this.category});
final String category;
  @override
  State<NewsListViewbuilder> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NewsListViewbuilder> {
  var future;
  @override
  void initState() {
   future = NewsServices(dio: Dio(), ).getTopHeadlinesNews(category: widget.category);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsArticle>>(
        future:future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(article: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text("there was an error"),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
