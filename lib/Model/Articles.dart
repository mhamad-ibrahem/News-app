import 'dart:convert';
import 'package:get/get.dart';
NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel {
  NewsModel({
    this.articles,
  });
  List<dynamic>? articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        articles: json["articles"],
      );
}

class Article {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author:
            json["author"] == null ? null : json["author"] ?? 'empty'.tr,
        title: json["title"] ?? 'empty'.tr,
        description: json["description"] ?? 'empty'.tr,
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ??
            'https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg',
        publishedAt: DateTime.parse(json["publishedAt"] ?? 'empty'.tr),
        content: json["content"] == null ? null : json["content"] ?? 'empty'.tr,
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}
