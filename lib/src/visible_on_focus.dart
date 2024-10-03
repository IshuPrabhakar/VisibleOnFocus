/*
Name: Ishu Prabhakar
Date: 03/10/2024
Purpose: Defines the package: visible_on_focus
Copyright: © 2024, Ishu Prabhakar. All rights reserved.
Licensing: More information can be found here: https://github.com/IshuPrabhakar/visible_on_focus/blob/master/LICENSE

*/

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class VisibleOnFocus extends StatefulWidget {
  /// A widget that ensures the focused child remains visible and scrolled into view
  /// when the keyboard appears.
  ///
  /// The [VisibleOnFocus] widget listens to changes in the platform's window
  /// insets, particularly when the keyboard appears on screen. When a widget,
  /// such as a [TextField], inside [VisibleOnFocus] gains focus, it automatically
  /// scrolls to make sure the widget is visible and centered in the scrollable
  /// parent.
  ///
  /// This is useful for forms or text fields in a scrollable layout, where the
  /// keyboard might obstruct part of the screen.
  ///
  /// The widget should be used in scrollable contexts, such as with [ListView]
  /// or [SingleChildScrollView].
  ///
  /// ### Example usage:
  ///
  /// ```dart
  /// VisibleOnFocus(
  ///   child: TextField(
  ///     decoration: InputDecoration(
  ///       labelText: 'Enter your text',
  ///     ),
  ///   ),
  /// )
  /// ```
  ///
  /// ### Parameters:
  /// - `child`: The widget (e.g., [TextField] or [TextFormField]) that should
  ///   become visible when it receives focus.
  /// - `alignment`: Scrolls the scrollables that enclose the given context so as to make the given context visible.
  ///    If the [Scrollable] of the provided [BuildContext] is a [TwoDimensionalScrollable], 
  ///    both vertical and horizontal axes will ensure the target is made visible..
  /// - `animationDuration`: Animation duration defaults to 200 milliseconds.
  /// - `curve`: Animation curve (e.g., [Curves.linear], [Curves.fastLinearToSlowEaseIn]) defaults to [Curves.easeInOut]
  ///
  /// ### How it works:
  /// - When the child widget gains focus (e.g., a text field being tapped), the
  ///   keyboard may obscure part of the screen. [VisibleOnFocus] listens to
  ///   platform metrics and ensures the focused widget is scrolled into view,
  ///   keeping it visible and centered within the scrollable area.
  ///
  /// ### Limitations:
  /// - Make sure the [VisibleOnFocus] widget is wrapped within a scrollable
  ///   parent (like [ListView] or [SingleChildScrollView]) for it to function
  ///   correctly.
  const VisibleOnFocus({
    super.key,
    required this.child,
    this.alignment,
    this.animationDuration,
    this.curve,
  });

  final Widget child;
  final double? alignment;
  final Duration? animationDuration;
  final Curve? curve;

  @override
  State<VisibleOnFocus> createState() => _VisibleOnFocusState();
}

class _VisibleOnFocusState extends State<VisibleOnFocus>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final viewInsetsBottom = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    if (viewInsetsBottom > 0) {
      // Keyboard is visible
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        await _ensureVisibleOnTextArea();
      });
    }
  }

  Future<void> _ensureVisibleOnTextArea() async {
    var context = FocusManager.instance.primaryFocus?.context;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: widget.animationDuration ?? const Duration(milliseconds: 200),
        curve: widget.curve ?? Curves.easeInOut,
        alignment: widget.alignment ?? 0.5, // Keeps the widget in the center
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
