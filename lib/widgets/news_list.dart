import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/widgets/news_list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/widgets/detail_page.dart';

import 'package:newsapp/services/api.dart';
import 'package:newsapp/settings/settings.dart';

class NewsListWidget extends StatefulWidget {
  NewsListWidget({super.key, required List<NewsItem> this.news});

  List<NewsItem> news;
  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  ScrollController scrollController = ScrollController();
  late List<NewsItem> moreNews;
  Future<void> loadAllData(String from) async {
    moreNews = await Api.getNews(APIChoice.all.value, from: from);
  }

  getMoreList() async {
    await loadAllData(widget.news.last.date);
    widget.news.addAll(moreNews);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: widget.news.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.news.length) {
          return const CupertinoActivityIndicator();
        }
        return Dismissible(
          key: Key(widget.news[index].id),
          onDismissed: (direction) {
            widget.news.removeAt(index);
               setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${widget.news[index].id} удалено')));
          },
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            newsId: widget.news[index].id,
                          )));
            },
            child: ListItem(
              thumbnail: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: widget.news[index].img,
              ),
              title: widget.news[index].title,
              subtitle: widget.news[index].subtitle,
              id: widget.news[index].id,
              date: widget.news[index].date.substring(0, 10),
              img: widget.news[index].img,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
