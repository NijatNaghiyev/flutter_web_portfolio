import 'package:flutter_web_portfolio/core/cubits/base_cubit.dart';
import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/projects_entity.dart';
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
    getProjects();
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

  Future<void> getProjects() async {
    final res = await _mainUsecase.getProjects();

    res.when(
      success: (data) => emit(
        state.copyWith(
          projects: data,
        ),
      ),
      failure: (message) {
        AppLogger.error('Failed to fetch projects: $message');
      },
    );

    // emit(
    //   state.copyWith(
    //     projects: [
    //       ProjectsEntity(
    //         title: 'title',
    //         description: 'description' * 100,
    //         imageUrl:
    //             'https://i.pinimg.com/originals/13/be/95/13be95147b920e7c4ee958ff30db7a11.jpg',
    //         githubUrl: 'ddd',
    //         websiteUrl: 'ddd',
    //         iosUrl: 'ddd',
    //         androidUrl: 'ddd',
    //         tags: 'Flutter, Dart, Firebase, REST API, Provider, GitHub, CI/CD',
    //       ),
    //       ProjectsEntity(
    //         title: '',
    //         description: '',
    //         imageUrl:
    //             'https://pub.dev/static/hash-btvv2vbt/img/pub-dev-icon-cover-image.png',
    //         githubUrl: '',
    //         websiteUrl: '',
    //         iosUrl: '',
    //         androidUrl: '',
    //         tags: '',
    //       ),
    //       ProjectsEntity(
    //         title: '',
    //         description: '',
    //         imageUrl:
    //             'https://pub.dev/static/hash-btvv2vbt/img/pub-dev-icon-cover-image.png',
    //         githubUrl: '',
    //         websiteUrl: '',
    //         iosUrl: '',
    //         androidUrl: '',
    //         tags: '',
    //       ),
    //       ProjectsEntity(
    //         title: '',
    //         description: '',
    //         imageUrl:
    //             'https://pub.dev/static/hash-btvv2vbt/img/pub-dev-icon-cover-image.png',
    //         githubUrl: '',
    //         websiteUrl: '',
    //         iosUrl: '',
    //         androidUrl: '',
    //         tags: '',
    //       ),
    //       ProjectsEntity(
    //         title: '',
    //         description: '',
    //         imageUrl:
    //             'https://pub.dev/static/hash-btvv2vbt/img/pub-dev-icon-cover-image.png',
    //         githubUrl: '',
    //         websiteUrl: '',
    //         iosUrl: '',
    //         androidUrl: '',
    //         tags: '',
    //       ),
    //       ProjectsEntity(
    //         title: '',
    //         description: '',
    //         imageUrl:
    //             'https://pub.dev/static/hash-btvv2vbt/img/pub-dev-icon-cover-image.png',
    //         githubUrl: '',
    //         websiteUrl: '',
    //         iosUrl: '',
    //         androidUrl: '',
    //         tags: '',
    //       ),
    //       ProjectsEntity(
    //         title: '',
    //         description: '',
    //         imageUrl:
    //             'https://pub.dev/static/hash-btvv2vbt/img/pub-dev-icon-cover-image.png',
    //         githubUrl: '',
    //         websiteUrl: '',
    //         iosUrl: '',
    //         androidUrl: '',
    //         tags: '',
    //       ),
    //       ProjectsEntity(
    //         title: '',
    //         description: '',
    //         imageUrl:
    //             'https://pub.dev/static/hash-btvv2vbt/img/pub-dev-icon-cover-image.png',
    //         githubUrl: '',
    //         websiteUrl: '',
    //         iosUrl: '',
    //         androidUrl: '',
    //         tags: '',
    //       ),
    //     ],
    //   ),
    // );
  }
}
