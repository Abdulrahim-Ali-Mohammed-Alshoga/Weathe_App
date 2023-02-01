import 'package:flutter/material.dart';
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
      elevation: 1,
      leading: const BackButton(color: Colors.deepOrange),
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
              icon: const Icon(
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
              icon: const Icon(
                Icons.search,
                // color: MyColors.white,
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

              isClean = false;
            });
          } else if (controller.text.isEmpty) {
            setState(() {
              isClean = true;
            });
          }
        },
        keyboardType: TextInputType.text,
        cursorColor: Colors.deepOrange,
        style: TextStyle(
         height: 1.45,
            // color: MyColors.white,
            // fontFamily: MyFont.titleFont,
            fontSize:17.sp),
        cursorWidth: 1,
        // cursorRadius:const Radius.circular(1000),
        controller: controller,
        autofocus: isSearch ? true : false,
        focusNode: focusNode,
        maxLines: 1,
        cursorHeight:30,

        textInputAction: TextInputAction.search,
        onFieldSubmitted: (s) {
          getMovie();
          setState(() {
            isSearch = false;
          });
        },
        decoration: const InputDecoration(

          contentPadding: EdgeInsets.only(left: 0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(fontSize: 17,color:Colors.grey),
          hintText: "Search...",
        ),
      ),
      centerTitle: true,
    );
  }
}
