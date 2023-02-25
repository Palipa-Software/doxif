import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SunnyRight extends StatelessWidget {
  const SunnyRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 8.5.w,
          height: 3.8.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Ellipse2933.png"))),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 6.w,
            height: 2.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Vector2.png"))),
          ),
        )
      ],
    );
  }
}
