import 'package:flutter_web_portfolio/core/cubits/base_cubit.dart';
import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/domain/usecases/main_usecase.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainCubit extends BaseCubit<MainState> {
  final MainUsecase _mainUsecase;
  MainCubit(this._mainUsecase) : super(const MainState());

  void init() {
    getProfile();
  }

  Future<void> getProfile() async {
    final res = await _mainUsecase.getProfile();

    res.when(
      success: (data) => emit(
        state.copyWith(
          profile: data,
        ),
      ),
      failure: (message) {},
    );
  }
}
