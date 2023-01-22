import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationWeatherWidget extends StatelessWidget {
  InformationWeatherWidget(
      {Key? key,
      required this.humidity,
      required this.unit,
      required this.image,
      required this.good})
      : super(key: key);
  String humidity;
  String image, good, unit;

  Map<String, Color> colorShadow = {
    "01": const Color(0xffff8510),
    "02": const Color(0xffc5edfe),
    "03": const Color(0xff70afea),
    "04": const Color(0xff6db1f2),
    "09": const Color(0xff91bee0),
    "10": const Color(0xfff1d16a),
    "11": const Color(0xff7197b7),
    "13": const Color(0xff0c5bc0),
    "50": const Color(0xffbdbcba)
  };

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
                color: colorShadow[good]?.withOpacity(.8),
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
                          style: TextStyle(fontSize: 12.sp,color: Colors.black),
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
