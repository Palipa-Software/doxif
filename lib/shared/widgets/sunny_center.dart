import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SunnyCenter extends StatelessWidget {
  const SunnyCenter({
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
          bottom: 0,
          left: 0.8.w,
          child: Container(
            width: 6.7.w,
            height: 3.h,
            child: Image(image: AssetImage("assets/images/Group65966.png")),
          ),
        )
      ],
    );
  }
}
