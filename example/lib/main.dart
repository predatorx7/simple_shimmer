import 'package:flutter/material.dart';
import 'package:simple_shimmer/simple_shimmer.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Example(),
    ),
  );
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Example'),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: SimpleShimmer(
                  height: 100,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: SimpleShimmer(
                  height: 100,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SimpleShimmer(
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const SimpleShimmer(
            height: 100,
            theme: ShimmerThemeData(
              decoration: ShimmerDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SimpleShimmerTheme.merge(
            data: ShimmerThemeData(
                baseColor: Colors.red,
                highlightColor: Colors.red.shade200,
                decoration: ShimmerDecoration(
                  borderRadius: BorderRadius.circular(20),
                )),
            child: const Row(
              children: [
                Expanded(
                  child: SimpleShimmer(
                    height: 100,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SimpleShimmer(
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
