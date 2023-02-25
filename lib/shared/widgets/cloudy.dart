import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Cloudy extends StatelessWidget {
  const Cloudy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 8.5.w,
          height: 3.8.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image(image: AssetImage("assets/images/Group65966.png")),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 6.4.w,
            height: 2.h,
            child: Image(image: AssetImage("assets/images/Vector2.png")),
          ),
        ),
      ],
    );
  }
}
