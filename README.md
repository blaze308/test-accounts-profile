```markdown
# Account Profile Project

## Getting Started

### 1. Prerequisites
Ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Android Studio or VS Code (for development)
- Xcode (if developing for iOS)
- A real or virtual device (Emulator/Simulator)
- An API key stored in a `.env` file

### 2. Clone the Repository
Clone the project from the repository:
sh
git clone <your-repo-url>
cd <your-project-folder>
```

### 3. Install Dependencies
Navigate to the project directory and install the required dependencies:
```sh
flutter pub get
```

### 4. Configure Environment Variables
The app uses environment variables stored in a `.env` file.  
Create a `.env` file in the root directory and add your API key:
```sh
API_TOKEN=your_api_token_here
```

### 5. Running the App
Run the following command:
```sh
flutter run
```
To specify a platform:
- **Android:** `flutter run -d android`
- **iOS:** `flutter run -d ios`
- **Web:** `flutter run -d chrome`

---

## 6. Project Structure
Below is the structure of the project:

```plaintext
lib/
│-- main.dart               # Entry point of the app
│-- api/
│   ├── api_service.dart     # Handles API requests
│-- screens/
│   ├── account_profile.dart # User account screen
│   ├── update_profile.dart  # Profile update screen
assets/
│-- svg/                     # SVG icons

.env                         # Stores environment variables
pubspec.yaml                 # Dependencies & project metadata
```

---

## 7. Understanding the Code

### Entry Point (`main.dart`)
- Loads environment variables using `flutter_dotenv`.
- Initializes and runs the `AccountProfile` screen.

### API Service (`api_service.dart`)
- Handles API calls using the `http` package.
- Updates user profile via `PATCH` request.

### Account Profile (`account_profile.dart`)
- Displays user account details.
- Navigates to `update_profile.dart`.

### Update Profile (`update_profile.dart`)
- Allows users to update their name, phone number, and email.
- Uses `image_picker` for profile picture upload.

---

## 8. Running the App & Usage Flow

### Step 1: Launch the App
Use the following command to run the app:
```sh
flutter run
```
If running on a specific platform:
- **Android:** `flutter run -d android`
- **iOS:** `flutter run -d ios`
- **Web:** `flutter run -d chrome`

### Usage Flow
1. **Launch the app** - The app starts on the account profile screen.
2. **View Profile** - Users see account details such as name and phone number.
3. **Update Profile** - Users can navigate to the update profile screen to modify their details.
4. **Save Changes** - Users submit updates, and a success message appears if the update is successful.
5. **Navigate through the app** - Users can access different sections such as service preferences and support.

---

## 9. Debugging Issues

If you encounter issues, try the following steps:

- **Check if dependencies are installed properly:**
  ```sh
  flutter doctor
  ```
- **Ensure `.env` is correctly set up:**  
  Ensure the `.env` file is created and configured as shown in Step 4.
- **Verify assets:**  
  Ensure that the `assets/svg/` directory exists and contains the required icons.
```
