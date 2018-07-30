import 'package:redux/redux.dart';
import 'package:yyets/models/help.dart';
import 'package:yyets/redux/actions/main.dart';
import 'package:flutter/foundation.dart';
import 'package:yyets/models/video_comment.dart';
import 'package:yyets/models/video_info.dart';

VideoState videoReducer(VideoState state, action) {
  switch (action.type) {
    case ReduxActions.updateVideoInfo:
      return state.copyWith(videoInfo: action.payload);
    case ReduxActions.updateVideoComments:
      return state.copyWith(videoComments: action.payload);
    default:
      return state;
  }
}

@immutable
class VideoState {
  final List<VideoComment> videoComments;
  final VideoInfo videoInfo;

  VideoState({
    this.videoInfo,
    this.videoComments,
  });

  VideoState copyWith(
      {VideoInfo videoInfo,
      List<Help> helps,
      List<VideoComment> videoComments}) {
    return VideoState(
        videoInfo: videoInfo ?? this.videoInfo,
        videoComments: videoComments ?? this.videoComments);
  }

  VideoState.initialState()
      : videoInfo = VideoInfo.initialState(),
        videoComments = [];
}

class VideoViewModel {
  final Store<VideoState> store;

  VideoViewModel(this.store);
  List<Help> get helps => this.store.state.videoInfo.helpList;
  List<VideoComment> get videoComments => this.store.state.videoComments;

  VideoInfo get videoInfo => this.store.state.videoInfo;
  List<SeasonList> get seasons => this.store.state.videoInfo.seasonList;
  String get title => videoInfo.resourceInfo?.cnname;
  String get cover => videoInfo.resourceInfo?.poster;
}
