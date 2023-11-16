import 'package:json_annotation/json_annotation.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/entity/photo_user.dart';
import 'package:unsplash/domain/entity/tag.dart';
import 'package:unsplash/domain/extensions/date_time.dart';

part 'collection.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Collection {
  String id;
  String title;
  @JsonKey(fromJson: parseMovieDateFromString)
  DateTime? publishedAt;
  String lastCollectedAt;
  PhotoUser user;
  String updatedAt;
  Photo? coverPhoto;
  String? description;
  bool? featured;
  int? totalPhotos;
  bool? private;
  String? shareKey;
  List<Tag>? tags;


  Collection({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    required this.coverPhoto,
    required this.user,
    required this.tags,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}