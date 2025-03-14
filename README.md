📌 Overview

This Flutter project follows a feature-based architecture with a strong emphasis on clean
architecture principles. We use BLoC for state management, Dio for API networking, and Freezed for
immutable data class generation.

🏗️ Project Architecture

The project is structured based on feature-based architecture, ensuring modularity, maintainability,
and scalability.

Key Architectural Decisions:

Clean Architecture: Separation of concerns into layers: Presentation, Domain, and Data.

Feature-Based Structure: Each feature has its own module, keeping the codebase organized.

BLoC (Business Logic Component): Used for managing application state predictably.

Dio: A powerful HTTP client for handling API requests efficiently.

Freezed: Used for data model generation, ensuring immutability and easy serialization.

📂 Folder Structure

lib/
├── core/ # Common utilities (constants, error handling, network, etc.)
├── feature_x/ # Example feature module (repeated per feature)
│ ├── data/ # Data layer (repositories, models, API)
│ ├── domain/ # Domain layer (entities, use cases)
│ ├── presentation/ # UI & BLoC (widgets, screens, BLoC controllers)
├── main.dart # Entry point of the application

Each feature has 3 layers:

Presentation: UI and BLoC

Domain: Entities & Use Cases

Data: API calls, models, repositories

🔄 State Management with BLoC

All business logic is handled by BLoC.

Features have separate BLoC instances for better scalability.

BlocBuilder, BlocListener, and BlocConsumer are used in the UI.