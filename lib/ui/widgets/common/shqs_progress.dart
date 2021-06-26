

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manga/config/theme_constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

const _defaultSize = 300.0;

class ShqsCircularProgress extends StatelessWidget {

  final double size;
  final bool isServiceMode;

  ShqsCircularProgress({
    this.size = _defaultSize,
    this.isServiceMode = false,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
            spinnerMode: true,
            size: size,
            customWidths: CustomSliderWidths(progressBarWidth: 5.0),
            customColors: CustomSliderColors(
                dotColor: Colors.transparent,
                trackColor: Colors.transparent,
                progressBarColors: isServiceMode
                    ?service_progress_bar_colors
                    :progress_bar_colors
            )
        ),
      ),
    );
  }
}