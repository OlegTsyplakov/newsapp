

class NewsItem {

  String id = "";
  String img = "";
  String date = "";
  String title = "";
  String subtitle = "";
  int important = 0;
   NewsItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        img = json['img'],
        date = json['date'].substring(0, 10),
        title= json['title'],
        subtitle= json['subtitle'],
        important= json['important']
        ;

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'img': img,
  //     };
}
