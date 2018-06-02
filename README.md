# Stash Coach

Stash Coach is an iOS application that shows the investor's achievements progress.

## Authors

### iOS

- Bruno Agatte

## Project Specificities

The app is built to run on devices with iOS 10.0 or later.

### Project Structure

The project is broken down into four main directories: Features, Models, Utility and Resources. Most of the UI code including views and view controllers reside in Features directory.

### Architecture

The project uses the VIPER architecture.

#### Dependency Injection

View Controllers, Routers and Resources are injected through `AppEnvironment`, which holds references to all the dependency required in the app. On app launch, the app delegate creates `AppEnvironment` and initializes all the various dependencies.