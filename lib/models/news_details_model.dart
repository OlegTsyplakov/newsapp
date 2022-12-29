import 'package:newsapp/helpers/string_helpers.dart';

class NewsItemDetails {
  Data? data;

  NewsItemDetails({this.data});

  NewsItemDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? date;
  String? text;
  String? url;
  List<Gallery>? gallery;
  String? img;

  Data(
      {this.id,
      this.title,
      this.date,
      this.text,
      this.url,
      this.gallery,
      this.img});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'].substring(0, 10);
    text = StringHelpers.stripHtml(json['text']);
    // text = json['text'];
    url = json['url'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['text'] = text;
    data['url'] = url;
    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
    data['img'] = img;
    return data;
  }
}

class Gallery {
  int? sortId;
  String? smallImg;
  String? bigImg;

  Gallery({this.sortId, this.smallImg, this.bigImg});

  Gallery.fromJson(Map<String, dynamic> json) {
    sortId = json['sortId'];
    smallImg = json['smallImg'];
    bigImg = json['bigImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sortId'] = sortId;
    data['smallImg'] = smallImg;
    data['bigImg'] = bigImg;
    return data;
  }
}
