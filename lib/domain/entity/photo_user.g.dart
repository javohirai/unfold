// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoUser _$PhotoUserFromJson(Map<String, dynamic> json) => PhotoUser(
      id: json['id'] as String,
      updatedAt: json['updated_at'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      portfolioUrl: json['portfolio_url'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      links: PhotoUserLink.fromJson(json['links'] as Map<String, dynamic>),
      profileImage: UserProfileImage.fromJson(
          json['profile_image'] as Map<String, dynamic>),
      instagramUsername: json['instagram_username'] as String?,
      totalCollections: json['total_collections'] as int,
      totalLikes: json['total_likes'] as int?,
      totalPhotos: json['total_photos'] as int,
      acceptedTos: json['accepted_tos'] as bool?,
      forHire: json['for_hire'] as bool?,
    );

Map<String, dynamic> _$PhotoUserToJson(PhotoUser instance) => <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'username': instance.username,
      'name': instance.name,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'twitter_username': instance.twitterUsername,
      'portfolio_url': instance.portfolioUrl,
      'bio': instance.bio,
      'location': instance.location,
      'links': instance.links.toJson(),
      'profile_image': instance.profileImage.toJson(),
      'instagram_username': instance.instagramUsername,
      'total_collections': instance.totalCollections,
      'total_likes': instance.totalLikes,
      'total_photos': instance.totalPhotos,
      'accepted_tos': instance.acceptedTos,
      'for_hire': instance.forHire,
    };

UserProfileImage _$UserProfileImageFromJson(Map<String, dynamic> json) =>
    UserProfileImage(
      small: json['small'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$UserProfileImageToJson(UserProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

PhotoUserLink _$PhotoUserLinkFromJson(Map<String, dynamic> json) =>
    PhotoUserLink(
      self: json['self'] as String,
      html: json['html'] as String,
      photos: json['photos'] as String,
      likes: json['likes'] as String,
      portfolio: json['portfolio'] as String,
      following: json['following'] as String,
      followers: json['followers'] as String,
    );

Map<String, dynamic> _$PhotoUserLinkToJson(PhotoUserLink instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
      'portfolio': instance.portfolio,
      'following': instance.following,
      'followers': instance.followers,
    };

PhotoUserSocial _$PhotoUserSocialFromJson(Map<String, dynamic> json) =>
    PhotoUserSocial(
      instagramUsername: json['instagram_username'] as String?,
      portfolioUrl: json['portfolio_url'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      paypalEmail: json['paypal_email'] as String?,
    );

Map<String, dynamic> _$PhotoUserSocialToJson(PhotoUserSocial instance) =>
    <String, dynamic>{
      'instagram_username': instance.instagramUsername,
      'portfolio_url': instance.portfolioUrl,
      'twitter_username': instance.twitterUsername,
      'paypal_email': instance.paypalEmail,
    };
