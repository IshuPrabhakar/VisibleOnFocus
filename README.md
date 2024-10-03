# VisibleOnFocus

`VisibleOnFocus` is a Flutter widget that automatically scrolls a focused text field (or any other focusable widget) into view when the keyboard appears. This helps ensure that the focused widget remains visible and centered on the screen, making user interaction smoother, especially on mobile devices where the keyboard may obscure the view.

## Features

- Automatically scrolls the widget into view when it receives focus.
- Keeps the widget centered in its scrollable parent when the keyboard is displayed.
- Lightweight and easy to integrate with existing `TextField` or `TextFormField` widgets.
  
## Installation

Add the following line to your `pubspec.yaml` file under dependencies:

```yaml
dependencies:
  visible_on_focus: ^0.0.1
```

Then run the following command:

```bash
flutter pub get
```

## Usage

Wrap any focusable widget (like `TextField`, `TextFormField`, or custom input fields) inside the `VisibleOnFocus` widget to ensure it remains visible when it gets focused.

### Example

```dart
import 'package:flutter/material.dart';
import 'package:visible_on_focus/visible_on_focus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visible On Focus Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Visible On Focus Example'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 700), // Spacer to demonstrate scrolling
        VisibleOnFocus(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter Text',
              hintText: 'Focus here to scroll',
            ),
          ),
        ),
        SizedBox(height: 300), // More content to demonstrate scrolling
      ],
    );
  }
}
```

### Parameters

- **child**: The widget (typically a `TextField` or other focusable widget) that should become visible when it gains focus.

### Example Explanation
In the example, the `TextField` is wrapped inside the `VisibleOnFocus` widget. When the `TextField` is focused and the keyboard appears, the widget automatically scrolls into view, keeping the text field visible and centered in the viewport.

## Documentation

For more detailed documentation, please visit the [API reference](https://pub.dev/documentation/visible_on_focus/latest/).

## Changelog

See the [CHANGELOG.md](https://pub.dev/packages/visible_on_focus/changelog) for version history and updates.

## License

This package is available under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

This `README.md` file provides an overview, installation instructions, usage example, and links to additional resources.