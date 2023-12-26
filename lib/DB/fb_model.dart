import 'package:equatable/equatable.dart';

class FacebookModel extends Equatable {
  final int id;
  final String titlename;
  final String postWhen;
  final String detailPost;
  final String image;
  final int totalLike;
  final int totalComment;
  final int totalShere;
  final bool imageType;
  final bool likepost;
  

  const FacebookModel({
    required this.id,
    required this.titlename,
    required this.postWhen,
    required this.detailPost,
    required this.image,
    required this.totalLike,
    required this.totalComment,
    required this.totalShere,
    this.imageType = false,
   required this.likepost,
  });

  FacebookModel copyWith({
    id,
    titlename,
    postWhen,
    detailPost,
    image,
    totalLike,
    totalComment,
    totalShere,
    imageType,
    likepost,
  }) {
    return FacebookModel(
      id: id??this.id,
      titlename: titlename ?? this.titlename,
      postWhen: postWhen ?? this.postWhen,
      detailPost: detailPost ?? this.detailPost,
      image: image ?? this.image,
      totalLike: totalLike ?? this.totalLike,
      totalComment: totalComment ?? this.totalComment,
      totalShere: totalShere ?? this.totalShere,
      imageType: imageType ?? this.imageType,
      likepost: likepost??this.likepost
    );
  }

  @override
  List<Object?> get props => [
        titlename,
        postWhen,
        detailPost,
        image,
        totalLike,
        totalComment,
        totalShere,
        imageType,
        likepost,
      ];
}
