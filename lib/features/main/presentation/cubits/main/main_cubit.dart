import 'package:flutter_web_portfolio/core/cubits/base_cubit.dart';
import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:flutter_web_portfolio/features/main/domain/usecases/main_usecase.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainCubit extends BaseCubit<MainState> {
  MainCubit(this._mainUsecase) : super(const MainState());
  final MainUsecase _mainUsecase;

  void init() {
    getProfile();
    getSkills();
  }

  Future<void> getProfile() async {
    final res = await _mainUsecase.getProfile();

    res.when(
      success: (data) => emit(
        state.copyWith(
          profile: data,
        ),
      ),
      failure: (message) {
        AppLogger.error('Failed to fetch profile: $message');
      },
    );
  }

  Future<void> getSkills() async {
    final res = await _mainUsecase.getSkills();

    res.when(
      success: (data) => emit(
        state.copyWith(
          skills: data,
        ),
      ),
      failure: (message) {
        AppLogger.error('Failed to fetch skills: $message');
      },
    );
  }
}
