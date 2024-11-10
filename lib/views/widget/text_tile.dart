import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/views/main_pages/news_page_details.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    super.key,
    required this.article,
  });

  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsPageDetails(article: article),));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // Image loaded
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ); // Show loading indicator
                        }
                      },
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return Image.asset('assets/images.png'); // Fallback in case of an error
                      },
                    )
                  : Image.asset('assets/images.png'), // Local asset if URL is null
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              article.title ?? "no Title found",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              article.description ?? "no description found",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
