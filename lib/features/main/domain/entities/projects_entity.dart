class ProjectsEntity {
  const ProjectsEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
    required this.websiteUrl,
    required this.iosUrl,
    required this.androidUrl,
    required this.tags,
  });

  final String? title;
  final String? description;
  final String? imageUrl;
  final String? githubUrl;
  final String? websiteUrl;
  final String? iosUrl;
  final String? androidUrl;
  final String? tags;
}
