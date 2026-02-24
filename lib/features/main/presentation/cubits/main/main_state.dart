import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({ProfileEntity? profile}) = _MainState;
}
