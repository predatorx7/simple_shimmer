import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_shimmer/simple_shimmer.dart';

void main() {
  test('ShimmerThemeData copyWith, ==, hashCode basics', () {
    expect(
      const ShimmerThemeData(
        highlightColor: Colors.red,
        baseColor: Colors.black,
      ),
      const ShimmerThemeData(
        highlightColor: Colors.red,
        baseColor: Colors.black,
      ).copyWith(),
    );
    expect(
      const ShimmerThemeData(
        highlightColor: Colors.red,
        baseColor: Colors.black,
      ).hashCode,
      const ShimmerThemeData(
        highlightColor: Colors.red,
        baseColor: Colors.black,
      ).copyWith().hashCode,
    );
  });

  testWidgets('ShimmerThemeData copyWith overrides all properties',
      (WidgetTester tester) async {
    const originalHighlightColor = Colors.red;
    const originalBaseColor = Colors.black;
    const originalDecoration = ShimmerDecoration();

    // Create a ShimmerThemeData with all properties set.
    const ShimmerThemeData original = ShimmerThemeData(
      highlightColor: originalHighlightColor,
      baseColor: originalBaseColor,
      decoration: originalDecoration,
    );
    // Check if the all properties are copied.
    final ShimmerThemeData copy = original.copyWith();
    expect(copy.highlightColor, originalHighlightColor);
    expect(copy.baseColor, originalBaseColor);
    expect(copy.decoration, originalDecoration);

    const newHighlightColor = Colors.blue;
    const newBaseColor = Colors.white;
    const newDecoration = ShimmerDecoration(curve: Curves.slowMiddle);

    // Check if the properties are overriden.
    final ShimmerThemeData overridden = original.copyWith(
      highlightColor: newHighlightColor,
      baseColor: newBaseColor,
      decoration: newDecoration,
    );
    expect(overridden.highlightColor, newHighlightColor);
    expect(overridden.baseColor, newBaseColor);
    expect(overridden.decoration, newDecoration);
  });

  test('ShimmerThemeData defaults', () {
    const ShimmerThemeData themeData = ShimmerThemeData(
      highlightColor: Colors.red,
      baseColor: Colors.black,
    );
    expect(themeData.decoration, const ShimmerDecoration());
  });

  testWidgets('ShimmerThemeData implements debugFillProperties',
      (WidgetTester tester) async {
    final DiagnosticPropertiesBuilder builder = DiagnosticPropertiesBuilder();
    const ShimmerThemeData(
      highlightColor: Color(0xfff44336),
      baseColor: Color(0xff000000),
    ).debugFillProperties(builder);

    final List<String> description = builder.properties
        .where((DiagnosticsNode node) => !node.isFiltered(DiagnosticLevel.info))
        .map((DiagnosticsNode node) => node.toString())
        .toList();

    expect(description, <dynamic>[
      allOf(startsWith('highlightColor:'), contains('Color(0xfff44336)')),
      allOf(startsWith('baseColor:'), contains('Color(0xff000000)')),
    ]);
  });
}
