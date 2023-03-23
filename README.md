
# Flutter Boilerplate

[![tr](https://img.shields.io/badge/lang-tr-red.svg)](https://github.com/yunusemrealpak/flutter_boilerplate/blob/master/README-tr.md)

This project can be used as a template for Flutter projects. This template is designed to speed up the application development process and create a reusable code base. This project helps developers to quickly start their applications by using popular tools and packages such as Firebase.

## Installation

Clone this project and set up your development environment.

```bash
  git clone https://github.com/yunusemrealpak/flutter_boilerplate.git
  cd flutter-boilerplate
```

## Usage

After cloning this project, don't forget to change api urls in `.env` file. Otherwise, your application will not work.

```bash
  API_URL=<your-api-url>
  DEV_API_URL=<your-dev-api-url>
```

## Packages

- auto_route
- dartz
- easy_localization
- dio
- flutter_bloc
- flutter_dotenv
- freezed
- get_it, injectable
- hive_flutter, shared_preferences
- firebase_dynamic_links

## Features

- Authentication
- Localization
- Dynamic Links
- Navigation
- State Management
- Dependency Injection
- Environment Variables
- Responsive UI
- Flavors (dev, prod)

### Flavor

This project has two flavors: dev and prod. You can change the flavor in `android/app/build.gradle` file.

launch.json file is also configured for each flavor. You can run your application with the following commands.

```json
  {
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch development",
            "request": "launch",
            "type": "dart",
            "flutterMode": "debug",
            "program": "lib/main_dev.dart",
            "args": [
                "--flavor",
                "dev",
            ]
        },
        {
            "name": "Launch production",
            "request": "launch",
            "type": "dart",
            "flutterMode": "debug",
            "program": "lib/main_prod.dart",
            "args": [
                "--flavor",
                "prod",
            ]
        },
    ]
  }
```

```bash
  flutter run -t lib/main_dev.dart --flavor dev
  flutter run -t lib/main_prod.dart --flavor prod
```

or

```bash
  sh scripts/build.sh -apk <flavor_name>
  sh scripts/build.sh -bundle <flavor_name>
```

## Support

If you liked this project, please give it a star ⭐

## Authors

- [@yunusemrealpak](https://github.com/yunusemrealpak)

## License

[MIT](https://github.com/yunusemrealpak/flutter_boilerplate/blob/master/LICENSE)
