import 'package:equatable/equatable.dart';

class SourceEntity extends Equatable {
  final String id;
  final String name;

  SourceEntity({required this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
