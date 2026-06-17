# AI Chat — Client

Flutter mobile app that connects to the AI Chat Supabase backend.

## Structure

```
client/
├── lib/
│   ├── main.dart
│   └── src/
│       ├── bootstrap.dart
│       ├── data/        # Repositories & data sources
│       ├── domain/      # Models & business logic
│       └── ui/          # Screens, widgets & cubits
├── android/
├── ios/
└── .env                 # Local environment config
```

## Stack

- Flutter (Dart)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [supabase_flutter](https://pub.dev/packages/supabase_flutter) for backend & auth
- [sign_in_with_apple](https://pub.dev/packages/sign_in_with_apple) for Apple Sign-In
- [freezed](https://pub.dev/packages/freezed) for immutable models

## Setup

1. Create a `.env` file in the `client/` directory:
   ```
   SUPABASE_URL=your_supabase_url
   SUPABASE_PUBLISHABLE_KEY=your_supabase_publishable_key
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Code Generation

Some models use `freezed` and `json_serializable`. After modifying them, regenerate:
```bash
dart run build_runner build
```
