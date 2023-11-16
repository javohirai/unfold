// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: json['id'] as String,
      title: json['title'] as String,
      publishedAt: parseMovieDateFromString(json['published_at'] as String?),
      lastCollectedAt: json['last_collected_at'] as String,
      updatedAt: json['updated_at'] as String,
      coverPhoto: json['cover_photo'] == null
          ? null
          : Photo.fromJson(json['cover_photo'] as Map<String, dynamic>),
      user: PhotoUser.fromJson(json['user'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..description = json['description'] as String?
      ..featured = json['featured'] as bool?
      ..totalPhotos = json['total_photos'] as int?
      ..private = json['private'] as bool?
      ..shareKey = json['share_key'] as String?;

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'published_at': instance.publishedAt?.toIso8601String(),
      'last_collected_at': instance.lastCollectedAt,
      'user': instance.user,
      'updated_at': instance.updatedAt,
      'cover_photo': instance.coverPhoto,
      'description': instance.description,
      'featured': instance.featured,
      'total_photos': instance.totalPhotos,
      'private': instance.private,
      'share_key': instance.shareKey,
      'tags': instance.tags,
    };
