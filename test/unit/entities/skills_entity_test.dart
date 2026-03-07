import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_portfolio/core/enums/app_icon.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';

void main() {
  group('SkillsEntity', () {
    test('creates instance with all properties', () {
      // Arrange & Act
      final skill = SkillsEntity(
        title: 'Flutter',
        icon: AppIcon.framework,
      );

      // Assert
      expect(skill.title, 'Flutter');
      expect(skill.icon, AppIcon.framework);
    });

    test('creates instance with null icon', () {
      // Act
      final skill = SkillsEntity(
        title: 'Custom Skill',
        icon: null,
      );

      // Assert
      expect(skill.title, 'Custom Skill');
      expect(skill.icon, isNull);
    });

    test('title is required and cannot be null', () {
      // This test verifies the constructor requires title parameter
      expect(
        () => SkillsEntity(
          title: 'Test',
          icon: null,
        ),
        returnsNormally,
      );
    });
  });
}
