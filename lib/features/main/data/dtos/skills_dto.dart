import 'package:flutter_web_portfolio/core/enums/app_icon.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skills_dto.g.dart';

@JsonSerializable(createToJson: false)
class SkillsDto {
  SkillsDto({
    required this.skills,
  });

  factory SkillsDto.fromJson(Map<String, dynamic> json) =>
      _$SkillsDtoFromJson(json);

  final List<SkillDto>? skills;

  List<SkillsEntity> toEntity() =>
      skills
          ?.map(
            (skill) => SkillsEntity(
              title: skill.title,
              icon: skill.icon,
            ),
          )
          .toList() ??
      [];
}

@JsonSerializable(createToJson: false)
class SkillDto {
  SkillDto({
    required this.title,
    required this.icon,
  });

  factory SkillDto.fromJson(Map<String, dynamic> json) =>
      _$SkillDtoFromJson(json);
  final String title;
  @JsonKey(fromJson: appIconFromJson)
  final AppIcon? icon;
}

AppIcon? appIconFromJson(String? icon) {
  if (icon == null) return null;
  try {
    return AppIcon.values.firstWhere((e) => e.name == icon);
  } catch (_) {
    return null;
  }
}
