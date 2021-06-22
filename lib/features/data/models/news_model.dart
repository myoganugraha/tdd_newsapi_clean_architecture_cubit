import 'package:newsapi_clean_architecture/features/data/models/source_model.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/news_entity.dart';
import 'package:meta/meta.dart';

class NewsModel extends NewsEntity {
  NewsModel(
      {required String author,
      required String title,
      required String description,
      required String url,
      required String urlToImage,
      required String content,
      required SourceModel source})
      : super(
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            content: content,
            source: source);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content'],
        source: SourceModel.fromJson(json['source']));
  }
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'content': content,
      'source': source
    };
  }
}
