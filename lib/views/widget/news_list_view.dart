import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/views/widget/text_tile.dart';

// ignore: must_be_immutable
class NewsListView extends StatelessWidget {
  NewsListView({super.key, required this.article});
  List<NewsArticle> article = [];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final newsArticle = article[index];
          if (newsArticle.title == "[Removed]" ||
              newsArticle.description == "[Removed]") {
            return const SizedBox.shrink(); 
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextTile(article: newsArticle),
          );
        },
        childCount: article.length,
      ),
    );
  }
}
