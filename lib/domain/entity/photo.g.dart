// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'] as String,
      slug: json['slug'] as String,
      createdAt: parseMovieDateFromString(json['created_at'] as String?),
      updatedAt: json['updated_at'] as String,
      promotedAt: json['promoted_at'] as String?,
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      blurHash: json['blur_hash'] as String?,
      description: json['description'] as String?,
      altDescription: json['alt_description'] as String?,
      urls: PhotoUrl.fromJson(json['urls'] as Map<String, dynamic>),
      likes: json['likes'] as int,
      likedByUser: json['liked_by_user'] as bool,
      currentUserCollections:
          (json['current_user_collections'] as List<dynamic>)
              .map((e) => Collection.fromJson(e as Map<String, dynamic>))
              .toList(),
      user: PhotoUser.fromJson(json['user'] as Map<String, dynamic>),
      views: json['views'] as int?,
      downloads: json['downloads'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedCollections: json['related_collections'] == null
          ? null
          : ReleteadCollections.fromJson(
              json['related_collections'] as Map<String, dynamic>),
    )..location = json['location'] == null
        ? null
        : PhotoLocation.fromJson(json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt,
      'promoted_at': instance.promotedAt,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'description': instance.description,
      'alt_description': instance.altDescription,
      'urls': instance.urls.toJson(),
      'likes': instance.likes,
      'liked_by_user': instance.likedByUser,
      'current_user_collections':
          instance.currentUserCollections.map((e) => e.toJson()).toList(),
      'user': instance.user.toJson(),
      'location': instance.location?.toJson(),
      'views': instance.views,
      'downloads': instance.downloads,
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'related_collections': instance.relatedCollections?.toJson(),
    };

PhotoUrl _$PhotoUrlFromJson(Map<String, dynamic> json) => PhotoUrl(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String,
      smallS3: json['small_s3'] as String,
    );

Map<String, dynamic> _$PhotoUrlToJson(PhotoUrl instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
      'small_s3': instance.smallS3,
    };

PhotoLink _$PhotoLinkFromJson(Map<String, dynamic> json) => PhotoLink(
      self: json['self'] as String,
      html: json['html'] as String,
      download: json['download'] as String,
      downloadLocation: json['download_location'] as String,
    );

Map<String, dynamic> _$PhotoLinkToJson(PhotoLink instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
      'download_location': instance.downloadLocation,
    };

PhotoLocation _$PhotoLocationFromJson(Map<String, dynamic> json) =>
    PhotoLocation(
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      position: PhotoLocationPosition.fromJson(
          json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoLocationToJson(PhotoLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'position': instance.position,
    };

PhotoLocationPosition _$PhotoLocationPositionFromJson(
        Map<String, dynamic> json) =>
    PhotoLocationPosition(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$PhotoLocationPositionToJson(
        PhotoLocationPosition instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

ReleteadCollections _$ReleteadCollectionsFromJson(Map<String, dynamic> json) =>
    ReleteadCollections(
      total: json['total'] as int,
      type: json['type'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReleteadCollectionsToJson(
        ReleteadCollections instance) =>
    <String, dynamic>{
      'total': instance.total,
      'type': instance.type,
      'results': instance.results,
    };
