import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class CustomWarningCard extends StatelessWidget {
  int index;
  CustomWarningCard({
    super.key,
    required this.index,
    required this.controller,
  });

  dynamic controller;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(controller.warningList[index]),
      trailingActions: <SwipeAction>[
        SwipeAction(
          backgroundRadius: 12.sp,
          performsFirstActionWithFullSwipe: true,
          title: AppStrings.swipeActionTitle,
          onTap: (CompletionHandler handler) async {
            controller.warningList.removeAt(index);
          },
          color: AppColors.red,
        ),
      ],
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            width: 1,
            color: AppColors.coldMorning,
          ),
          borderRadius: BorderRadius.circular(
            12.sp,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 10.5.w,
              height: 10.5.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 20,
                  image: AssetImage(
                    "assets/images/${controller.warningList[index]["ic_path"]}.png",
                  ),
                ),
                color: AppColors.appColor.withOpacity(
                  .3,
                ),
                borderRadius: BorderRadius.circular(
                  8.sp,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 1.5.h,
                  bottom: 4.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.warningList[index]["title"],
                      style: TextStyle(
                        fontFamily: "Rubik Bold",
                        color: AppColors.warningCardTitle,
                      ),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    Text(
                      controller.warningList[index]["subtitle"],
                      style: TextStyle(
                        fontFamily: "Rubik Regular",
                        color: AppColors.inActiveIcColor,
                        fontSize: 8.5.sp,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
