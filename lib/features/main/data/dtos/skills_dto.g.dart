// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsDto _$SkillsDtoFromJson(Map<String, dynamic> json) => SkillsDto(
  skills: (json['skills'] as List<dynamic>?)
      ?.map((e) => SkillDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

SkillDto _$SkillDtoFromJson(Map<String, dynamic> json) => SkillDto(
  title: json['title'] as String,
  icon: appIconFromJson(json['icon'] as String?),
);
