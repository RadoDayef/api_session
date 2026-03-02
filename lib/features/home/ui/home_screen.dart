import 'package:api_session/features/details/ui/details_screen.dart';
import 'package:api_session/features/home/data/models/article_model.dart';
import 'package:api_session/features/home/logic/news_cubit/news_cubit.dart';
import 'package:api_session/features/home/logic/obscure_cubit/obscure_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, foregroundColor: Colors.white, centerTitle: true, title: Text("Test API")),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NewsCubit()),
          BlocProvider(create: (context) => ObscureCubit()),
        ],
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<ObscureCubit, bool>(
                builder: (context, state) {
                  return TextFormField(
                    obscureText: state,
                    decoration: InputDecoration(
                      hintText: "Password Test",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                      suffixIcon: InkWell(onTap: context.read<ObscureCubit>().changeObscure, child: Icon(state ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined)),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsSuccess) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.articles.length,
                      itemBuilder: (_, int index) {
                        ArticleModel article = state.articles[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsScreen(article.url)));
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Image.network(article.urlToImage ?? "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
                                SizedBox(height: 8),
                                Text(
                                  article.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, _) {
                        return SizedBox(height: 12);
                      },
                    );
                  } else if (state is NewsFailure) {
                    return Center(
                      child: Text(state.message, style: TextStyle(color: Colors.blue, fontSize: 30)),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator(color: Colors.blue));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
