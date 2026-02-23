import 'package:api_session/features/details/ui/details_screen.dart';
import 'package:api_session/features/home/data/home_repo.dart';
import 'package:api_session/features/home/data/models/article_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    updateDataOnUi();
    super.initState();
  }

  void updateDataOnUi() {
    HomeRepo().getData().then((data) {
      setState(() {
        articles = data.articles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, foregroundColor: Colors.white, centerTitle: true, title: Text("Test API")),
      body: articles.isEmpty
          ? Center(child: CircularProgressIndicator(color: Colors.blue))
          : ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (_, int index) {
                ArticleModel article = articles[index];
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
              itemCount: articles.length,
            ),
    );
  }
}
