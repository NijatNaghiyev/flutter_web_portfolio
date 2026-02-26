import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable(createToJson: false)
class ProfileDto {

  ProfileDto({
    this.cvPath,
    this.github,
    this.linkedin,
    this.email,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
  final String? cvPath;
  final String? github;
  final String? linkedin;
  final String? email;

  ProfileEntity toEntity() {
    return ProfileEntity(
      cvPath: cvPath,
      github: github,
      linkedin: linkedin,
      email: email,
    );
  }
}
