import 'package:flutter_web_portfolio/core/cubits/base_cubit.dart';
import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/domain/usecases/main_usecase.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/cv_download/cv_download_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CvDownloadCubit extends BaseCubit<CvDownloadState> {
  CvDownloadCubit(this._mainUsecase) : super(const CvDownloadState());
  final MainUsecase _mainUsecase;

  Future<void> downloadCv(String cvPath) async {
    emit(state.copyWith(status: CvDownloadStatus.loading));

    if (cvPath.isEmpty) {
      emit(state.copyWith(status: CvDownloadStatus.failure));
      return;
    }

    if (state.cvDownloadPath != null) {
      emit(state.copyWith(status: CvDownloadStatus.success));
      return;
    }

    final res = await _mainUsecase.getCvDownloadPath(cvPath);

    res.when(
      success: (data) => emit(
        state.copyWith(
          status: CvDownloadStatus.success,
          cvDownloadPath: data,
        ),
      ),
      failure: (error) =>
          emit(state.copyWith(status: CvDownloadStatus.failure)),
    );
  }
}
