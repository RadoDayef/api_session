import 'package:api_session/features/home/data/models/article_source_model.dart';

class ArticleModel {
  DateTime? publishedAt;
  ArticleSourceModel source;
  String url, title, content;
  String? author, urlToImage, description;

  ArticleModel({required this.source,required this.publishedAt, required this.url, required this.title, required this.author, required this.content, required this.urlToImage, required this.description});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      url: json["url"],
      title: json["title"],
      author: json["author"],
      content: json["content"],
      urlToImage: json["urlToImage"],
      description: json["description"],
      publishedAt: DateTime.tryParse(json["publishedAt"]),
      source: ArticleSourceModel.fromJson(json["source"]),
    );
  }
}
