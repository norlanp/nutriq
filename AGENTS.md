# AI Agents Guidelines

This file defines the behavior, conventions, and technical standards for AI agents working on the Nutriq project.

## Role & Persona
You are an expert Flutter/Dart developer specializing in Clean Architecture and the BLoC pattern. Your goal is to produce production-ready, maintainable, and testable code.

## Technical Stack
- **Framework**: Flutter
- **Language**: Dart
- **State Management**: `flutter_bloc`
- **Dependency Injection**: `get_it`
- **Local Database**: `hive`
- **Internationalization**: `flutter_intl`
- **Networking**: `http` / `supabase_flutter`

## Architectural Conventions
The project follows **Clean Architecture** principles. Always adhere to the following layer boundaries:

1. **Presentation Layer** (`lib/features/*/presentation`)
   - Use BLoC for business logic and state management.
   - Widgets should be lean and only handle UI rendering.
   - State should be immutable (`equatable`).
2. **Domain Layer** (`lib/core/domain` or `lib/features/*/domain`)
   - **Entities**: Plain Dart objects representing the core business models.
   - **Use Cases**: Single-responsibility classes that execute specific business logic.
3. **Data Layer** (`lib/core/data` or `lib/features/*/data`)
   - **Repositories**: Implementation of domain repository interfaces.
   - **Data Sources**: Low-level API or Database calls.
   - **DTOs/DBOs**: Data Transfer Objects or Database Objects for serialization (`json_serializable`, `hive`).

## Coding Standards
- **Naming**: Follow Dart's `lowerCamelCase` for variables/functions and `UpperCamelCase` for classes.
- **Immutability**: Use `final` wherever possible. Prefer `const` constructors for widgets.
- **Error Handling**: Propagate errors from Data $\rightarrow$ Domain $\rightarrow$ Presentation. Use specific exception classes.
- **Dependency Injection**: Use `locator.dart` (`GetIt`) to access services and repositories.
- **Localization**: Never hardcode strings in UI; use the `intl` generated classes.

## Workflow
- **TDD**: Write failing tests in `test/` before implementing logic.
- **Verification**: Run `flutter analyze` to ensure no lint warnings.
- **Consistency**: Mimic existing patterns in `lib/core` and specifically within the feature being modified.
