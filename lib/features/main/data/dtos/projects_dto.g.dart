// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsDto _$ProjectsDtoFromJson(Map<String, dynamic> json) => ProjectsDto(
  projects: (json['projects'] as List<dynamic>?)
      ?.map((e) => ProjectDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => ProjectDto(
  title: json['title'] as String?,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
  githubUrl: json['githubUrl'] as String?,
  websiteUrl: json['websiteUrl'] as String?,
  iosUrl: json['iosUrl'] as String?,
  androidUrl: json['androidUrl'] as String?,
  tags: json['tags'] as String?,
);
