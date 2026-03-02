import 'package:flutter_web_portfolio/features/main/domain/entities/projects_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projects_dto.g.dart';

@JsonSerializable(createToJson: false)
class ProjectsDto {
  const ProjectsDto({
    required this.projects,
  });

  factory ProjectsDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectsDtoFromJson(json);

  final List<ProjectDto>? projects;

  List<ProjectsEntity> toEntity() =>
      projects
          ?.map(
            (project) => ProjectsEntity(
              title: project.title,
              description: project.description,
              imageUrl: project.imageUrl,
              githubUrl: project.githubUrl,
              websiteUrl: project.websiteUrl,
              iosUrl: project.iosUrl,
              androidUrl: project.androidUrl,
              tags: project.tags,
            ),
          )
          .toList() ??
      [];
}

@JsonSerializable(createToJson: false)
class ProjectDto {
  const ProjectDto({
    this.title,
    this.description,
    this.imageUrl,
    this.githubUrl,
    this.websiteUrl,
    this.iosUrl,
    this.androidUrl,
    this.tags,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  final String? title;
  final String? description;
  final String? imageUrl;
  final String? githubUrl;
  final String? websiteUrl;
  final String? iosUrl;
  final String? androidUrl;
  final String? tags;
}
