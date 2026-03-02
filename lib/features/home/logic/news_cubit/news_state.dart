part of 'news_cubit.dart';

abstract class NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  List<ArticleModel> articles;

  NewsSuccess(this.articles);
}

final class NewsFailure extends NewsState {
  String message;

  NewsFailure(this.message);
}
