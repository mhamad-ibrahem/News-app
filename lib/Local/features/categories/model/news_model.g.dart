// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 20;

  @override
  Article read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Article(
      author: fields[200] as String?,
      title: fields[201] as String?,
      description: fields[202] as String?,
      url: fields[203] as String?,
      urlToImage: fields[204] as String?,
      publishedAt: fields[205] as DateTime?,
      content: fields[206] as String?,
      category: fields[207] as String?,
      isLiked: fields[208] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer
      ..writeByte(9)
      ..writeByte(200)
      ..write(obj.author)
      ..writeByte(201)
      ..write(obj.title)
      ..writeByte(202)
      ..write(obj.description)
      ..writeByte(203)
      ..write(obj.url)
      ..writeByte(204)
      ..write(obj.urlToImage)
      ..writeByte(205)
      ..write(obj.publishedAt)
      ..writeByte(206)
      ..write(obj.content)
      ..writeByte(207)
      ..write(obj.category)
      ..writeByte(208)
      ..write(obj.isLiked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
