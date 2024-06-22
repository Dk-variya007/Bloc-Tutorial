import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/api/post_bloc/post_event.dart';
import 'package:bloc_state_management/bloc/api/post_bloc/post_state.dart';
import 'package:bloc_state_management/repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<FetchPost>(fetchPost);
  }

  void fetchPost(FetchPost event, Emitter<PostState> emit) async {
    try {
      final data = await PostRepository.getData();
      emit(state.copyWith(
          postStatus: PostStatus.success, message: "success", postList: data));
    } catch (error) {
      emit(state.copyWith(
          message: error.toString(), postStatus: PostStatus.failure));
    }
  }
}
