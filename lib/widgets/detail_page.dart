import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:newsapp/models/news_details_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/services/api.dart';
import 'package:newsapp/helpers/string_Helpers.dart';

class DetailPage extends StatefulWidget {
  final String newsId;
  const DetailPage({required this.newsId, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late NewsItemDetails _article;
  // late WebViewController _controller;

  Future<void> loadData() async {
    _article = await Api.getDetailNews(widget.newsId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
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
              return Scaffold(
                appBar: AppBar(
                  title: Text(_article.data!.title ?? ""),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl: _article.data!.img ?? "",
                        ),
                        const SizedBox(
                          width: 1,
                          height: 20,
                        ),
                        Text(StringHelpers.dateFormat(_article.data!.date),
                            style: Theme.of(context).textTheme.bodyText2),
                        const SizedBox(
                          width: 1,
                          height: 10,
                        ),
                        Text(_article.data!.title ?? "",
                            style: Theme.of(context).textTheme.headline1),
                        const SizedBox(
                          width: 1,
                          height: 10,
                        ),
                        const Divider(),
                        Text(_article.data!.text ?? "",
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),

                  // Flexible(
                  //   child: WebView(
                  //     key: widget.key,
                  //             initialUrl: "",
                  //             onWebViewCreated: (WebViewController webViewController) {
                  //    _controller = webViewController;
                  //    _loadHtmlFromAssets(_controller);
                  //             },
                  //       ),
                  // ),
                ),
              );
            }
          }
        });
  }

  // _loadHtmlFromAssets(WebViewController controller) async {
  //     await controller.loadHtmlString(_article.data!.text??"");
  // }

}
