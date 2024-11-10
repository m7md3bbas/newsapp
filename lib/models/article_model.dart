class NewsArticle {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;
  final String? author;
  final String? publishedAt;
  final String? url;

  NewsArticle(
      {required this.title,
      required this.description,
      required this.urlToImage,
      required this.content,
      required this.author,
      required this.publishedAt,
      required this.url
      });
  factory NewsArticle.fromJson(json) {
    return NewsArticle(
      title: json['title'],
      description: json["description"],
      urlToImage: json["urlToImage"],
      content: json["content"],
      author: json["author"],
      publishedAt: json["publishedAt"],
      url:json["url"]
    );
  }
   String getFormattedPublishedAt() {
    if (publishedAt == null) return "No publication date";
    DateTime parsedDate = DateTime.parse(publishedAt!);
    return "Date :${parsedDate.day}/${parsedDate.month}/${parsedDate.year} ${parsedDate.hour}:${parsedDate.minute} UTC";
  }
}
