import 'package:api_session/features/home/data/home_repo.dart';
import 'package:api_session/features/home/data/models/article_model.dart';
import 'package:api_session/features/home/data/models/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsLoading()) {
    getData();
  }

  void getData() {
    HomeRepo().getData().then((response) {
      if(response is NewsModel){
        emit(NewsSuccess(response.articles));
      }else{
        emit(NewsFailure(response.toString()));
      }
    });
  }
}
