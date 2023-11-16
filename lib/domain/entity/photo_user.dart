import 'package:json_annotation/json_annotation.dart';

part 'photo_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PhotoUser {
  String id;
  String updatedAt;
  String username;
  String name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  PhotoUserLink links;
  UserProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int? totalLikes;
  int totalPhotos;
  bool? acceptedTos;
  bool? forHire;

  PhotoUser({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
  });

  factory PhotoUser.fromJson(Map<String, dynamic> json) =>
      _$PhotoUserFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoUserToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UserProfileImage {
  String small;
  String medium;
  String large;

  UserProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });
  factory UserProfileImage.fromJson(Map<String, dynamic> json) =>
      _$UserProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileImageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoUserLink {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  PhotoUserLink({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory PhotoUserLink.fromJson(Map<String, dynamic> json) =>
      _$PhotoUserLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoUserLinkToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoUserSocial {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  String? paypalEmail;

  PhotoUserSocial({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
    required this.paypalEmail,
  });

  factory PhotoUserSocial.fromJson(Map<String, dynamic> json) =>
      _$PhotoUserSocialFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoUserSocialToJson(this);
}
