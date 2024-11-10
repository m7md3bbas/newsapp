import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPageDetails extends StatelessWidget {
  const NewsPageDetails({super.key, required this.article});

  final NewsArticle article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Title: ${article.title ?? 'No title available'}", // Handle null title
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // Image loaded
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            )
                          ); // Show loading indicator
                        }
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                            'assets/images.png'); // Fallback image
                      },
                    )
                  : Image.asset('assets/images.png'), // Fallback if no URL
            ),
            const SizedBox(height: 12),
            Text(
              "Content: ${article.content ?? 'No content available'}", // Handle null content
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            
            Text(
              "Author: ${article.author ?? 'Unknown'}", // Handle null author
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 12),
            Text(
              article.getFormattedPublishedAt(),
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
