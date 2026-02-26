import 'package:equatable/equatable.dart';

class ProfileEntity with EquatableMixin {

  ProfileEntity({
    this.cvPath,
    this.github,
    this.linkedin,
    this.email,
  });
  final String? cvPath;
  final String? github;
  final String? linkedin;
  final String? email;

  @override
  List<Object?> get props => [cvPath, github, linkedin, email];
}
