import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constants/name_pages.dart';

class ListSavedAreasScreen extends StatefulWidget {
  Color colorImage;
   ListSavedAreasScreen({Key? key,required this.colorImage}) : super(key: key);

  @override
  State<ListSavedAreasScreen> createState() => _ListSavedAreasScreenState();
}

class _ListSavedAreasScreenState extends State<ListSavedAreasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favorites",

          ),

          leading: const BackButton(color: Colors.deepOrange),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, NamePage.searchScreen);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.deepOrange,
                ))
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                color: widget.colorImage,
                child: Stack(
                  fit: StackFit.expand,
                  children: const [
                    Positioned(
                        top: 15,
                        left: 15,
                        child: Text(
                          "Current location",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 18.w),
                child: Text(
                  "Favorites",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 18.w),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Add a city, area or specific address to your ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ),
                  ),
                  TextSpan(
                      text: "Favorites ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      )),
                  TextSpan(
                      text:
                          "to quickly see what the that the weather is like there.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                      )),
                ])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 18.w),
                child: FittedBox(
                  child: Text(
                    "To add Favorites. first search for them, view their forecast",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "and then tap",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
