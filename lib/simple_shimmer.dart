/// * author: predatorx7
/// * email: smushaheed@gmail.com

/// A simple library that provides a component for displaying and overriding
/// shimmer animation in flutter
library simple_shimmer;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

// Examples can assume:
// late BuildContext context;

/// An immutable description of styles for [SimpleShimmer].
///
/// The [ShimmerDecoration] class customizes how
/// a [SimpleShimmer] looks, and animates.
///
/// [SimpleShimmer] delegates [ShimmerDecoration]'s values to the
/// constructor of [AnimatedContainer], and [AnimatedContainer.decoration].
@immutable
class ShimmerDecoration with Diagnosticable {
  final Curve curve;
  final BoxShape shape;
  final Duration duration;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;

  /// Creates a [ShimmerDecoration].
  const ShimmerDecoration({
    this.curve = Curves.easeInOut,
    this.shape = BoxShape.rectangle,
    this.duration = const Duration(milliseconds: 1200),
    this.margin,
    this.borderRadius,
    this.alignment,
    this.padding,
    this.constraints,
    this.transform,
    this.transformAlignment,
  });

  @useResult
  ShimmerDecoration copyWith({
    Curve? curve,
    BoxShape? shape,
    Duration? duration,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    BoxConstraints? constraints,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
  }) {
    return ShimmerDecoration(
      curve: curve ?? this.curve,
      shape: shape ?? this.shape,
      duration: duration ?? this.duration,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      constraints: constraints ?? this.constraints,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShimmerDecoration &&
        curve == other.curve &&
        shape == other.shape &&
        duration == other.duration &&
        margin == other.margin &&
        borderRadius == other.borderRadius &&
        alignment == other.alignment &&
        padding == other.padding &&
        constraints == other.constraints &&
        transform == other.transform &&
        transformAlignment == other.transformAlignment;
  }

  @override
  int get hashCode {
    return Object.hash(
      curve,
      shape,
      duration,
      margin,
      borderRadius,
      alignment,
      padding,
      constraints,
      transform,
      transformAlignment,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Curve>(
        'curve',
        curve,
        defaultValue: Curves.easeInOut,
      ),
    );
    properties.add(
      DiagnosticsProperty<BoxShape>(
        'shape',
        shape,
        defaultValue: BoxShape.rectangle,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'duration',
        duration,
        defaultValue: const Duration(milliseconds: 1200),
      ),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>(
        'margin',
        margin,
        defaultValue: const Duration(milliseconds: 1200),
      ),
    );
    properties.add(
      DiagnosticsProperty<BorderRadiusGeometry>(
        'borderRadius',
        borderRadius,
        defaultValue: const ShimmerDecoration(),
      ),
    );
    properties.add(
      DiagnosticsProperty<AlignmentGeometry>(
        'alignment',
        alignment,
        defaultValue: const ShimmerDecoration(),
      ),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>(
        'padding',
        padding,
        defaultValue: const ShimmerDecoration(),
      ),
    );
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'constraints',
        constraints,
        defaultValue: const ShimmerDecoration(),
      ),
    );
    properties.add(
      DiagnosticsProperty<Matrix4>(
        'transform',
        transform,
        defaultValue: const ShimmerDecoration(),
      ),
    );
    properties.add(
      DiagnosticsProperty<AlignmentGeometry>(
        'transformAlignment',
        transformAlignment,
        defaultValue: const ShimmerDecoration(),
      ),
    );
  }
}

/// A [ShimmerThemeData] that overrides the default theme styles of
/// [SimpleShimmer] with [SimpleShimmerTheme.of].
@immutable
class ShimmerThemeData with Diagnosticable {
  /// The animated highlight color over the [SimpleShimmer]
  final Color? highlightColor;

  /// The base background color of the [SimpleShimmer]
  final Color? baseColor;
  final ShimmerDecoration decoration;

  /// Creates an [ShimmerThemeData].
  const ShimmerThemeData({
    this.highlightColor,
    this.baseColor,
    this.decoration = const ShimmerDecoration(),
  });

  static const light = ShimmerThemeData(
    highlightColor: Color(0xffF9F9FB),
    baseColor: Color(0xffE6E8EB),
  );

  static const lightAlternate = ShimmerThemeData(
    highlightColor: Color.fromARGB(255, 240, 240, 240),
    baseColor: Color(0xffD4D7DB),
  );

  static const dark = ShimmerThemeData(
    highlightColor: Color(0xff3A3E3F),
    baseColor: Color(0xff2A2C2E),
  );

  @useResult
  ShimmerThemeData copyWith({
    Color? highlightColor,
    Color? baseColor,
    ShimmerDecoration? decoration,
  }) {
    return ShimmerThemeData(
      highlightColor: highlightColor ?? this.highlightColor,
      baseColor: baseColor ?? this.baseColor,
      decoration: decoration ?? this.decoration,
    );
  }

  @useResult
  ShimmerThemeData merge(ShimmerThemeData? o) {
    return copyWith(
      highlightColor: o?.highlightColor,
      baseColor: o?.baseColor,
      decoration: o?.decoration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShimmerThemeData &&
        highlightColor == other.highlightColor &&
        baseColor == other.baseColor &&
        decoration == other.decoration;
  }

  @override
  int get hashCode {
    return Object.hash(
      highlightColor,
      baseColor,
      decoration,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Color>(
        'highlightColor',
        highlightColor,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Color>(
        'baseColor',
        baseColor,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ShimmerDecoration>(
        'decoration',
        decoration,
        defaultValue: const ShimmerDecoration(),
      ),
    );
  }
}

/// An inherited widget that overrides the default styles of [SimpleShimmer]
/// in this widget's subtree.
class SimpleShimmerTheme extends InheritedWidget {
  /// Specifies the default theme overrides for descendant [SimpleShimmer] widgets.
  final ShimmerThemeData data;

  /// Creates a theme that overrides the default styles of [SimpleShimmer]
  /// in this widget's subtree.
  const SimpleShimmerTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static Widget merge({
    Key? key,
    ShimmerThemeData? data,
    required Widget child,
  }) {
    return Builder(builder: (context) {
      return SimpleShimmerTheme(
        key: key,
        data: SimpleShimmerTheme.of(context).merge(data),
        child: child,
      );
    });
  }

  /// A transition builder that provides a default [ShimmerDecoration].
  /// Can be used as [MaterialApp.builder], where this gets [Theme] from [MaterialApp],
  /// for providing an app-level default theme in [SimpleShimmer].
  ///
  /// ```dart
  /// MaterialApp(
  ///   // other properties...
  ///   builder: SimpleShimmerTheme.defaultTransitionBuilder,
  /// );
  /// ```
  static Widget defaultTransitionBuilder(
    BuildContext context,
    Widget? child,
  ) {
    if (child == null) return const SizedBox();
    return SimpleShimmerTheme.wrapDecoration(
      context: context,
      decoration: const ShimmerDecoration(
        margin: EdgeInsets.all(16),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: child,
    );
  }

  static Widget wrapDecoration({
    required BuildContext context,
    required ShimmerDecoration decoration,
    required Widget child,
  }) {
    return SimpleShimmerTheme(
      data: SimpleShimmerTheme.of(context).copyWith(
        decoration: decoration,
      ),
      child: child,
    );
  }

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [SimpleShimmerTheme] widget, then
  /// a default [ShimmerThemeData] based on [Brightness] is used.
  ///
  /// A Brightness for the theme is inherited with [Theme.of]'s [ThemeData.brightness]. The
  /// property [brightness] can be used to override the default theme returned by
  /// [of].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ShimmerThemeData? theme = SimpleShimmerTheme.of(context);
  /// ```
  static ShimmerThemeData of(
    BuildContext context, {
    Brightness? brightness,
  }) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<SimpleShimmerTheme>();
    if (widget != null) {
      return widget.data;
    }

    final effectiveBrightness = brightness ?? Theme.of(context).brightness;

    return effectiveBrightness == Brightness.light
        ? ShimmerThemeData.lightAlternate
        : ShimmerThemeData.dark;
  }

  @override
  bool updateShouldNotify(covariant SimpleShimmerTheme oldWidget) {
    return oldWidget.data != data;
  }
}

/// A widget with an animated foreground like https://github.com/facebookarchive/shimmer-android.
///
/// The properties [height], [width], and [child] can be used to change how [SimpleShimmer]
/// is sized.
///
/// The shimmer animation is synced, and thus looks the same for all [SimpleShimmer].
class SimpleShimmer extends StatefulWidget with Diagnosticable {
  final ShimmerThemeData? theme;
  final double? height;
  final double? width;
  final Widget? child;

  const SimpleShimmer({
    Key? key,
    this.theme,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<SimpleShimmer> createState() => _SimpleShimmerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ShimmerThemeData>(
        'theme',
        theme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<double>(
        'height',
        height,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<double>(
        'width',
        width,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Widget>(
        'child',
        child,
        defaultValue: null,
      ),
    );
  }
}

class _SimpleShimmerState extends State<SimpleShimmer> {
  static final isHighLightStream = Stream<bool>.periodic(
    const Duration(milliseconds: 750),
    (x) => x % 2 == 0,
  ).asBroadcastStream();

  bool isHighlighted = true;
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    sub = isHighLightStream.listen((value) {
      if (mounted) {
        setState(() {
          isHighlighted = value;
        });
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inheritedTheme = SimpleShimmerTheme.of(context);
    final theme = widget.theme != null
        ? inheritedTheme.merge(widget.theme)
        : inheritedTheme;
    final decoration = theme.decoration;

    return AnimatedContainer(
      curve: decoration.curve,
      duration: decoration.duration,
      alignment: decoration.alignment,
      padding: decoration.padding,
      width: widget.width,
      height: widget.height,
      constraints: decoration.constraints,
      margin: decoration.margin,
      transform: decoration.transform,
      transformAlignment: decoration.transformAlignment,
      decoration: BoxDecoration(
        shape: decoration.shape,
        color: isHighlighted ? theme.highlightColor : theme.baseColor,
        borderRadius: decoration.borderRadius,
      ),
      child: widget.child,
    );
  }
}
