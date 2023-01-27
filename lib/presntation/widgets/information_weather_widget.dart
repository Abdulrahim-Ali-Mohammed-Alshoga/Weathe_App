import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colorShadow.dart';

class InformationWeatherWidget extends StatelessWidget {
  InformationWeatherWidget(
      {Key? key,
      required this.humidity,
      required this.unit,
      required this.image,
      required this.colorShadow})
      : super(key: key);
  String humidity;
  String image, unit;
  Color colorShadow;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 105,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(bottom: 10.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:colorShadow.withOpacity(.7),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(image, height: 60, width: 60),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(humidity,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19.sp,color: Colors.black),
                ),
                Flexible(
                  child: FittedBox(
                      child: Text( unit,
                          style: TextStyle(fontSize: 13.sp,color: Colors.black),
                          maxLines: 1,
                           ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
