import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/settings/settings.dart';
import 'package:newsapp/widgets/news_list.dart';
import 'package:newsapp/services/api.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  late List<NewsItem> _allNews;
  late List<NewsItem> _topNews;
  late List<NewsItem> _articleNews;

  Future<void> loadAllData() async {
    _allNews = await Api.getNews(APIChoice.all.value);
  }

  Future<void> loadTopData() async {
    _topNews = await Api.getNews(APIChoice.top.value);
  }

  Future<void> loadArticleData() async {
    _articleNews = await Api.getNews(APIChoice.article.value);
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([loadAllData(), loadTopData(), loadArticleData()]),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return const Center(
                child: Text('An error occured'),
              );
            } else {
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: const TabBar(
                      labelColor: Colors.white,
                      tabs: [
                        Tab(text: "лента"),
                        Tab(text: "важное"),
                        Tab(text: "статьи"),
                      ],
                    ),
                    title: const Text('Регион 64'),
                  ),
                  body: TabBarView(
                    children: [
                      newsListWidget(widget.key, _allNews),
                      newsListWidget(widget.key, _topNews),
                      newsListWidget(widget.key, _articleNews),
                    ],
                  ),
                ),
              );
            }
          }
        });
  }
}
