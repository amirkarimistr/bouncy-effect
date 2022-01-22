# flutter_bounce

[![pub_package](https://img.shields.io/pub/v/flutter_bounce)](https://pub.dev/packages/flutter_bounce)

- An efficient flutter package for an **auto bounce** animation on any flutter widgets 
- This package is an enhanced version of [bouncing_widget](https://pub.dev/packages/bouncing_widget).

## Usage

To use this plugin, add `bouncy_effect` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Demo

This is how the `BouncyEffect` Widget works when wrapped around the widget. The below shows `BouncyEffect` being used:
![](assets/bounce.gif, height="48" width="48")

## Example

- Import the library

```dart
import 'package:flutter_bounce/flutter_bounce.dart';
```

- In order to use this package, we just need to wrap the content with the widget `BouncyEffect`.
- **Please Note:** Always pass the duration in `milliseconds` for best result

```dart
BouncyEffect(
  repeat: true,
  duration: Duration(milliseconds: 110),
  child: YOUR_WIDGET
)
```




