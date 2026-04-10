# System Architecture: Nutriq

## Overview
Nutriq is built using **Clean Architecture** and the **BLoC (Business Logic Component) pattern**. The goal is to separate concerns, ensuring that the business logic is independent of the UI, framework, and external data sources.

## Layered Architecture

### 1. Presentation Layer
The presentation layer is responsible for the UI and interacting with the user.
- **Widgets**: Lean components that render the UI based on state.
- **BLoCs**: Manage the state of a particular feature. They receive events from the UI and emit new states.
- **State**: Immutable objects (extending `Equatable`) that represent the current state of the UI.
- **Events**: Signal user actions or system triggers that the BLoC should handle.

### 2. Domain Layer
The core of the application, containing purely business logic and rules. It is independent of any other layer.
- **Entities**: Core business models (e.g., `UserEntity`, `MealEntity`).
- **Use Cases**: Classes that orchestrate the flow of data to and from the repositories to perform a specific business action.
- **Repository Interfaces**: Abstract definitions of how the data layer should behave.

### 3. Data Layer
The implementation of data retrieval and persistence.
- **Repositories**: Implement the interfaces defined in the Domain layer. They decide whether to fetch data from a local source or a remote API.
- **Data Sources**: Low-level implementations for network calls (`http`, `supabase`) or local database operations (`hive`).
- **DTOs/DBOs (Data Transfer/Database Objects)**: Specialized objects used for serialization/deserialization. These are converted to Entities before entering the Domain layer.

## Data Flow
`UI (Widget)` $\rightarrow$ `Event` $\rightarrow$ `BLoC` $\rightarrow$ `Use Case` $\rightarrow$ `Repository` $\rightarrow$ `Data Source` $\rightarrow$ `DB/API` $\rightarrow$ (Reverse flow for Response)

## Key Technical Choices
- **State Management**: `flutter_bloc` for predictable state transitions and separation of logic.
- **Dependency Injection**: `get_it` (via `locator.dart`) for decoupling components and improving testability.
- **Local Persistence**: `hive` for high-performance NoSQL storage.
- **Localization**: `flutter_intl` for multi-language support.
- **Networking**: `http` and `supabase_flutter` for remote data interaction.

## Project Structure
- `lib/core/`: Shared logic, utilities, styles, and common domain/data components.
- `lib/features/`: Feature-specific modules, each containing its own presentation, domain, and data layers.
- `test/`: Unit and widget tests to ensure reliability.
