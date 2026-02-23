import 'package:api_session/features/home/data/models/article_model.dart';

class NewsModel {
  String status;
  int totalResults;
  List<ArticleModel> articles;

  NewsModel({required this.status, required this.totalResults, required this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List<ArticleModel> myArticles = (json["articles"] as List).map((article) => ArticleModel.fromJson(article)).toList();
    return NewsModel(status: json["status"], totalResults: json["totalResults"], articles: myArticles);
  }
}
