import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Sunny extends StatelessWidget {
  const Sunny({
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
      ],
    );
  }
}
