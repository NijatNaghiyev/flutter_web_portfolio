# Test Directory

This directory contains all tests for the Flutter Web Portfolio project.

## Structure

```
test/
├── helpers/              # Test utilities and helpers
│   ├── mock_data.dart           # Mock data for testing
│   └── widget_test_helpers.dart # Widget testing utilities
│
├── unit/                 # Unit tests
│   └── entities/                # Entity tests
│       ├── profile_entity_test.dart
│       └── skills_entity_test.dart
│
├── cubit/                # Cubit/BLoC tests
│   ├── app_theme_cubit_test.dart
│   ├── drawer_cubit_test.dart
│   └── main_cubit_test.dart
│
├── widget/               # Widget tests
│   └── icon_button_test.dart
│
└── widget_test.dart      # Main test file
```

## Running Tests

### Run all tests

```bash
flutter test
```

### Run specific test file

```bash
flutter test test/cubit/app_theme_cubit_test.dart
```

### Run tests with coverage

```bash
flutter test --coverage
```

### Run tests in a specific directory

```bash
flutter test test/unit/
flutter test test/cubit/
flutter test test/widget/
```

## Test Categories

### 1. Unit Tests (`test/unit/`)

Tests for individual classes, entities, and utility functions without dependencies.

**Examples:**

- Entity creation and equality
- Utility function logic
- Data transformations

### 2. Cubit Tests (`test/cubit/`)

Tests for state management using `bloc_test` package.

**Examples:**

- State transitions
- Event handling
- Business logic validation
- Mock usecase interactions

### 3. Widget Tests (`test/widget/`)

Tests for UI components and their behavior.

**Examples:**

- Widget rendering
- User interactions
- State updates in widgets
- Widget properties

## Dependencies

- **flutter_test**: Flutter's official testing framework
- **bloc_test**: Testing utilities for BLoC/Cubit
- **mocktail**: Mocking library for Dart

## Writing Tests

### Unit Test Example

```dart
test('creates instance with all properties', () {
  // Arrange
  final entity = MyEntity(value: 'test');
  
  // Act & Assert
  expect(entity.value, 'test');
});
```

### Cubit Test Example

```dart
blocTest<MyCubit, MyState>(
  'emits new state when action is called',
  build: () => MyCubit(),
  act: (cubit) => cubit.performAction(),
  expect: () => [expectedState],
);
```

### Widget Test Example

```dart
testWidgets('renders correctly', (tester) async {
  // Arrange
  await tester.pumpWidget(makeTestableWidget(MyWidget()));
  
  // Assert
  expect(find.byType(MyWidget), findsOneWidget);
});
```

## Best Practices

1. **Arrange-Act-Assert**: Structure tests clearly
2. **One assertion per test**: Keep tests focused
3. **Descriptive names**: Use clear test descriptions
4. **Mock external dependencies**: Use mocktail for mocking
5. **Clean up**: Close streams and dispose resources
6. **Test edge cases**: Include null, empty, and error scenarios

## Coverage

To generate and view coverage report:

```bash
# Generate coverage
flutter test --coverage

# Convert to HTML (requires lcov)
genhtml coverage/lcov.info -o coverage/html

# Open in browser (macOS)
open coverage/html/index.html
```

## Continuous Integration

Tests are automatically run in CI/CD pipeline on pull requests and merges to main branch.
