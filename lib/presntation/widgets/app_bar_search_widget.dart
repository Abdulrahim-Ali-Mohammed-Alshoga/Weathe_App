import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSearchWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSearchWidget({Key? key}) : super(key: key);

  @override
  State<AppBarSearchWidget> createState() => _AppBarSearchWidgetState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarSearchWidgetState extends State<AppBarSearchWidget> {
  bool isClean = true;
  FocusNode focusNode = FocusNode();
  bool isSearch = true;TextEditingController controller = TextEditingController();
  getMovie(){

  }
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 10,
      actions: [
        if (!isClean)
          IconButton(
              splashRadius: 1,
              onPressed: () {
                // widget.actionSearch(widget.controller.text);
                controller.clear();
                setState(() {
                  isClean = true;
                  isSearch = true;
                  FocusScope.of(context).requestFocus(focusNode);
                });
              },
              icon: Icon(
                Icons.clear,
              )),
        if (isSearch)
          IconButton(
              splashRadius: 1,
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  getMovie();
                  focusNode.unfocus();
                  setState(() {
                    isSearch = false;
                  });
                }
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
      ],
      title: TextFormField(
        onTap: () {
          if (!isSearch) {
            isSearch = true;
          }
        },
        onChanged: (v) {
          if (isClean && controller.text.isNotEmpty) {
            setState(() {
              print(666622);
              isClean = false;
            });
          } else if (controller.text.isEmpty) {
            setState(() {
              isClean = true;
            });
          }
        },
        keyboardType: TextInputType.text,
        cursorColor: Colors.white,
        style: TextStyle(
            color: Colors.white,
         //   fontFamily: MyFont.titleFont,
            fontSize: 16.sp),
        controller: controller,
        autofocus: isSearch ? true : false,
        focusNode: focusNode,
        maxLines: 1,
        cursorHeight: 24,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (s) {
          getMovie();
          setState(() {
            isSearch = false;
          });
          print("object");
        },
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          hintText: "Search",
        ),
      ),
    );
  }
}
