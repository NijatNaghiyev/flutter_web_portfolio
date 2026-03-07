import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/projects_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';

/// Mock data for testing

class MockData {
  // Mock Profile
  static ProfileEntity get mockProfile => ProfileEntity(
    cvPath: 'path/to/cv.pdf',
    github: 'https://github.com/testuser',
    linkedin: 'https://linkedin.com/in/testuser',
    email: 'test@example.com',
    aboutMe: 'This is a test bio for testing purposes.',
  );

  // Mock Skills
  static List<SkillsEntity> get mockSkills => [
    SkillsEntity(title: 'Flutter', icon: null),
    SkillsEntity(title: 'Firebase', icon: null),
    SkillsEntity(title: 'Dart', icon: null),
    SkillsEntity(title: 'REST API', icon: null),
  ];

  // Mock Projects
  static List<ProjectsEntity> get mockProjects => [
    const ProjectsEntity(
      title: 'Portfolio Website',
      description: 'A modern portfolio website built with Flutter Web',
      imageUrl: 'https://example.com/portfolio.jpg',
      githubUrl: 'https://github.com/test/portfolio',
      websiteUrl: 'https://portfolio.example.com',
      iosUrl: null,
      androidUrl: null,
      tags: 'Flutter, Firebase, Web',
    ),
    const ProjectsEntity(
      title: 'Mobile App',
      description: 'A cross-platform mobile application',
      imageUrl: 'https://example.com/app.jpg',
      githubUrl: 'https://github.com/test/app',
      websiteUrl: null,
      iosUrl: 'https://apps.apple.com/app/test',
      androidUrl: 'https://play.google.com/store/apps/test',
      tags: 'Flutter, BLoC, REST API',
    ),
  ];

  // Result wrappers
  static Result<ProfileEntity> get successProfile =>
      Success(mockProfile);

  static Result<List<SkillsEntity>> get successSkills =>
      Success(mockSkills);

  static Result<List<ProjectsEntity>> get successProjects =>
      Success(mockProjects);

  static Result<ProfileEntity> get failureProfile =>
      const Failure('Failed to load profile');

  static Result<List<SkillsEntity>> get failureSkills =>
      const Failure('Failed to load skills');

  static Result<List<ProjectsEntity>> get failureProjects =>
      const Failure('Failed to load projects');
}
