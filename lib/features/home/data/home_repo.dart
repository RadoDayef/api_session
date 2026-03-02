import 'package:api_session/features/home/data/models/news_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  Dio dio = Dio();

  Future<dynamic> getData() async {
    try {
      final response = await dio.get("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=68ef013cc9ce4747b8caf3505f25aa57");
      NewsModel newsModel = NewsModel.fromJson(response.data);
      return newsModel;
    } catch (error) {
      return error.toString();
    }
  }
}
