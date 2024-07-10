import 'package:bloc_state_management/model/post_model.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { loading, success, failure }

class PostState extends Equatable {
  final String message;
  final List<PostModel> postList;
  final PostStatus postStatus;

  const PostState(
      {this.postStatus = PostStatus.loading,
      this.message = '',
      this.postList = const []});

  PostState copyWith(
      {String? message, List<PostModel>? postList, PostStatus? postStatus}) {
    return PostState(
        message: message ?? this.message,
        postList: postList ?? this.postList,
        postStatus: postStatus ?? this.postStatus);
  }

  @override
  List<Object?> get props => [message,postList,postStatus];
}

