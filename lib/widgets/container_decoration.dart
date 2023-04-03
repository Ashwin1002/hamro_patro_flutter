import 'package:flutter/material.dart';

class CustomDecoration {

  static customBoxDecoration(
      {Color? backgroundColor,
      BorderRadiusGeometry? borderRadius,
      BoxShape? shape,
      Gradient? gradient,
      DecorationImage? decorationImage,
      List<BoxShadow>? shadow,
      BoxBorder? border}) {
    return BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: shape == BoxShape.circle
            ? null
            : borderRadius ?? BorderRadius.circular(12.0),
        border: border ?? Border.all(color: Colors.grey, width: 0.2),
        shape: shape ?? BoxShape.rectangle,
        image: decorationImage,
        gradient: gradient,
        boxShadow: shadow);
  }
}
