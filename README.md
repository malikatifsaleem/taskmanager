# Task Manager

## Overview
The Task Manager App is a mobile application built using Flutter to help users manage their tasks effectively. It provides features for user authentication, task management, pagination, state management, local storage, and unit tests.

## Key Features

1. **User Authentication:** Users can securely log in using their Username and Password credentials. Authentication is implemented using the authentication endpoint provided by [Dummy JSON](https://dummyjson.com/docs/auth).

2. **Task Management:** Users can perform CRUD operations on tasks, including viewing, adding, editing, and deleting tasks. Task data is managed using the [Dummy JSON Todos API](https://dummyjson.com/docs/todos).

3. **Pagination:** Efficient pagination is implemented for fetching a large number of tasks. The app utilizes the pagination endpoint provided by [Dummy JSON](https://dummyjson.com/docs/todos).

4. **State Management:** State management is implemented using the Provider pattern to ensure efficient state updates across the app. Changes in task data and authentication status are reflected seamlessly throughout the application.

5. **Local Storage:** Tasks are persisted locally using Flutter's shared preferences or SQLite database. This ensures that tasks remain accessible even when the app is closed and reopened, providing a seamless user experience.

6. **Unit Tests:** Comprehensive unit tests are written to cover critical functionalities such as task CRUD operations, input validation, state management, and network requests. Mock responses are used for testing against [reqres.in](https://reqres.in) endpoints.

## Implementation Details

### Authentication
- Users can log in securely using their Username and Password.
- Authentication requests are sent to the Dummy JSON authentication endpoint.

### Task Management
- Users can perform CRUD operations on tasks.
- Task data is fetched and updated using the Dummy JSON Todos API.

### Pagination
- Pagination is implemented for efficient fetching of tasks.
- The pagination endpoint provided by Dummy JSON is used to fetch tasks in batches.

### State Management
- State management is implemented using the Provider pattern.
- The Provider package is used to manage and update task data and authentication status across the app.

### Local Storage
- Tasks are persisted locally using Flutter's shared preferences.
- LocalStorageService is used to save and load tasks from local storage.

### Unit Tests
- Comprehensive unit tests are written using the test package.
- Tests cover critical functionalities such as task CRUD operations, input validation, state management, and network requests.

## Challenges Faced
- Type casting issues when decoding JSON data retrieved from local storage.
- Efficient implementation of pagination for fetching tasks in batches.

## Additional Features
- Logging statements added throughout the codebase to track data flow and identify issues.
- Enhanced error messages for better troubleshooting and debugging.

## Installation
1. Clone the repository: `git clone https://github.com/your/repository.git`
2. Navigate to the project directory: `cd taskmanager`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Usage
1. Log in with your Username and Password credentials.
2. View, add, edit, and delete tasks as needed.
3. Tasks are automatically saved locally and remain accessible even when the app is closed and reopened.
4. Perform unit tests to ensure app functionality and reliability.

## License
This project is open source.