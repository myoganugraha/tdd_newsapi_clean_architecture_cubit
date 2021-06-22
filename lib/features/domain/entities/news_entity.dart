import 'package:equatable/equatable.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/source_entity.dart';

class NewsEntity extends Equatable{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  SourceEntity source;

  NewsEntity({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.source
  });

  @override
  // TODO: implement props
  List<Object?> get props => [author, title, description, url, urlToImage, content, source];
}