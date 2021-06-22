import 'package:equatable/equatable.dart';
import 'package:newsapi_clean_architecture/features/domain/entities/source_entity.dart';

class NewsEntity extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;
  final SourceEntity source;

  NewsEntity(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content,
      required this.publishedAt,
      required this.source});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [author, title, description, publishedAt, url, urlToImage, content, source];
}
