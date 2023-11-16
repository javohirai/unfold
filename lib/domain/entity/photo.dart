import 'package:json_annotation/json_annotation.dart';
import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/domain/entity/photo_user.dart';
import 'package:unsplash/domain/entity/tag.dart';
import 'package:unsplash/domain/extensions/date_time.dart';

part 'photo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Photo {
  String id;
  String slug;
  @JsonKey(fromJson: parseMovieDateFromString)
  DateTime? createdAt;
  String updatedAt;
  String? promotedAt;
  int width;
  int height;
  String color;
  String? blurHash;
  String? description;
  String? altDescription;
  // List<String> breadcrumbs;
  PhotoUrl urls;
  int likes;
  bool likedByUser;
  List<Collection> currentUserCollections;
  PhotoUser user;
  PhotoLocation? location;
  int? views;
  int? downloads;
  List<Tag>? tags;
  ReleteadCollections? relatedCollections;

  Photo({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    // required this.breadcrumbs,
    required this.urls,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.user,
    required this.views,
    required this.downloads,
    required this.tags,
    required this.relatedCollections,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoUrl {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  PhotoUrl({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });
  factory PhotoUrl.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoUrlToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoLink {
  String self;
  String html;
  String download;
  String downloadLocation;

  PhotoLink({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });
  factory PhotoLink.fromJson(Map<String, dynamic> json) =>
      _$PhotoLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoLinkToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoLocation {
  String? name;
  String? city;
  String? country;
  PhotoLocationPosition position;

  PhotoLocation({
    required this.name,
    required this.city,
    required this.country,
    required this.position,
  });

  factory PhotoLocation.fromJson(Map<String, dynamic> json) =>
      _$PhotoLocationFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoLocationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoLocationPosition {
  double latitude;
  double longitude;

  PhotoLocationPosition({
    required this.latitude,
    required this.longitude,
  });

  factory PhotoLocationPosition.fromJson(Map<String, dynamic> json) =>
      _$PhotoLocationPositionFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoLocationPositionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ReleteadCollections {
  int total;
  String type;
  List<Collection> results;

  ReleteadCollections({
    required this.total,
    required this.type,
    required this.results,
  });

  factory ReleteadCollections.fromJson(Map<String, dynamic> json) =>
      _$ReleteadCollectionsFromJson(json);

  Map<String, dynamic> toJson() => _$ReleteadCollectionsToJson(this);
}
