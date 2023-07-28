import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/shared/data/local_video_posts.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/domain/datasources/video_posts_datasource.dart';


class LocalvideoDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 1));

    final List<VideoPost> newVideos = videoPosts.map( 
      ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    return newVideos;
  }

}