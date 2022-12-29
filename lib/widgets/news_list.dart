import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/widgets/news_list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/widgets/detail_page.dart';

Widget newsListWidget(Key? key, List<NewsItem> news) {
  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: news.length,
    itemBuilder: (BuildContext context, int index) {
      return Dismissible(
        key: Key(news[index].id),
        onDismissed: (direction) {
          news.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${news[index].id} удалено')));
        },
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          newsId: news[index].id,
                        )));
          },
          child: ListItem(
            thumbnail: CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: news[index].img,
            ),
            title: news[index].title,
            subtitle: news[index].subtitle,
            id: news[index].id,
            date: news[index].date,
            img: news[index].img,
          ),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}
