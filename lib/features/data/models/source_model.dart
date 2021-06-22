import 'package:newsapi_clean_architecture/features/domain/entities/source_entity.dart';

class SourceModel extends SourceEntity {
  SourceModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
