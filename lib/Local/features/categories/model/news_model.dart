import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'news_model.g.dart';

@HiveType(typeId: 20)
class Article {
  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.category,
      this.isLiked = false});
  @HiveField(200)
  String? author;
  @HiveField(201)
  String? title;
  @HiveField(202)
  String? description;
  @HiveField(203)
  String? url;
  @HiveField(204)
  String? urlToImage;
  @HiveField(205)
  DateTime? publishedAt;
  @HiveField(206)
  String? content;
  @HiveField(207)
  String? category;
  @HiveField(208)
  bool? isLiked;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"] == null ? null : json["author"] ?? 'empty'.tr,
        title: json["title"] ?? 'empty'.tr,
        description: json["description"] ?? 'empty'.tr,
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ??
            'https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg',
        publishedAt: DateTime.parse(json["publishedAt"] ?? 'empty'.tr),
        content: json["content"] ?? 'empty'.tr,
      );
}
