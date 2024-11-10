import 'package:dio/dio.dart';
import 'package:newsapp/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices({required this.dio});
  Future<List<NewsArticle>> getTopHeadlinesNews({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=5094c1c4c5864f4990e7899e019b0174&category=${category}");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<NewsArticle> articlesList = [];
      for (var article in articles) {
        NewsArticle newsArticle = NewsArticle.fromJson(article);
        articlesList.add(newsArticle);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
