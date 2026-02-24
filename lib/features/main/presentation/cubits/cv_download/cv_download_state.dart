import 'package:freezed_annotation/freezed_annotation.dart';

part 'cv_download_state.freezed.dart';

enum CvDownloadStatus { initial, loading, success, failure }

@freezed
abstract class CvDownloadState with _$CvDownloadState {
  const factory CvDownloadState({
    String? cvDownloadPath,
    @Default(CvDownloadStatus.initial) CvDownloadStatus status,
  }) = _CvDownloadState;
}
