import 'package:equatable/equatable.dart';

class ProfileEntity with EquatableMixin {
  final String? cvPath;
  final String? github;
  final String? linkedin;
  final String? email;

  ProfileEntity({
    this.cvPath,
    this.github,
    this.linkedin,
    this.email,
  });

  @override
  List<Object?> get props => [cvPath, github, linkedin, email];
}
