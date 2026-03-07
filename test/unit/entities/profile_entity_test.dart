import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';

void main() {
  group('ProfileEntity', () {
    test('creates instance with all properties', () {
      // Arrange & Act
      final profile = ProfileEntity(
        cvPath: 'path/to/cv.pdf',
        github: 'https://github.com/test',
        linkedin: 'https://linkedin.com/in/test',
        email: 'test@example.com',
        aboutMe: 'Test bio',
      );

      // Assert
      expect(profile.cvPath, 'path/to/cv.pdf');
      expect(profile.github, 'https://github.com/test');
      expect(profile.linkedin, 'https://linkedin.com/in/test');
      expect(profile.email, 'test@example.com');
      expect(profile.aboutMe, 'Test bio');
    });

    test('creates instance with null properties', () {
      // Act
      final profile = ProfileEntity();

      // Assert
      expect(profile.cvPath, isNull);
      expect(profile.github, isNull);
      expect(profile.linkedin, isNull);
      expect(profile.email, isNull);
      expect(profile.aboutMe, isNull);
    });

    test('equality works correctly with same values', () {
      // Arrange
      final profile1 = ProfileEntity(
        cvPath: 'path/to/cv.pdf',
        github: 'https://github.com/test',
        linkedin: 'https://linkedin.com/in/test',
        email: 'test@example.com',
        aboutMe: 'Test bio',
      );

      final profile2 = ProfileEntity(
        cvPath: 'path/to/cv.pdf',
        github: 'https://github.com/test',
        linkedin: 'https://linkedin.com/in/test',
        email: 'test@example.com',
        aboutMe: 'Test bio',
      );

      // Assert
      expect(profile1, equals(profile2));
    });

    test('equality works correctly with different values', () {
      // Arrange
      final profile1 = ProfileEntity(
        email: 'test1@example.com',
      );

      final profile2 = ProfileEntity(
        email: 'test2@example.com',
      );

      // Assert
      expect(profile1, isNot(equals(profile2)));
    });

    test('props contains all properties', () {
      // Arrange
      final profile = ProfileEntity(
        cvPath: 'path/to/cv.pdf',
        github: 'https://github.com/test',
        linkedin: 'https://linkedin.com/in/test',
        email: 'test@example.com',
        aboutMe: 'Test bio',
      );

      // Assert
      expect(profile.props.length, 5);
      expect(
        profile.props,
        containsAll([
          'path/to/cv.pdf',
          'https://github.com/test',
          'https://linkedin.com/in/test',
          'test@example.com',
          'Test bio',
        ]),
      );
    });
  });
}
