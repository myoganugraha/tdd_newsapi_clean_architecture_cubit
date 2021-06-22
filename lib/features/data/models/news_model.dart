import 'package:newsapi_clean_architecture/features/data/models/source_model.dart';

class NewsModel{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  Source source;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.source
  });

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      source: Source.fromJson(json['source'])
    );
  }
}