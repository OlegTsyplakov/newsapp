import 'package:flutter/material.dart';
import 'package:newsapp/helpers/string_Helpers.dart';

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.id,
    required this.date,
    required this.img,
  });

  final String title;
  final String subtitle;
  final String id;
  final String date;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          StringHelpers.dateFormat(date),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline1,
        ),

        Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:  Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.id,
    required this.date,
    required this.img,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String id;
  final String date;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  id: id,
                  title: title,
                  subtitle: subtitle,
                  img: img,
                  date: date,
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
          ],
        ),
      ),
    );
  }
}
