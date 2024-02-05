# Simple Shimmer

A simple widget with customizable shimmer-like fade animation between 2 colors for skeleton screens

## Features

- Very light-weigth widget
- Easily customizable
- Defaults to light or dark shimmer default animation based on `Theme.of(context).brightness`

## Usage

Just add a `SimpleShimmer()` widget anywhere in your UI.

![Recording of simple shimmer](https://raw.githubusercontent.com/predatorx7/simple_shimmer/main/media/recording.gif)

## Customization

`SimpleShimmerTheme` can provide theme customizations to any child `SimpleShimmer` widgets.

```dart
SimpleShimmerTheme.merge(
    data: ShimmerThemeData(
        baseColor: Colors.red,
        highlightColor: Colors.red.shade200,
        decoration: ShimmerDecoration(
        borderRadius: BorderRadius.circular(20),
        )
    ),
    // ... somewhere there is a `SimpleShimmer` widget 
)
```
