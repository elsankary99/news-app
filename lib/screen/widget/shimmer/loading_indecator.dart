import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,

          /// Required, The loading type of the widget
          colors: [Theme.of(context).primaryColor],

          /// Optional, The color collections
          strokeWidth: 2,

          /// Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
