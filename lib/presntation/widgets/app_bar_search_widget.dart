import 'package:flutter/material.dart';

import '../../data/repository/repository_hive/history_city_repository.dart';

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate({
    String hintText = "City or area",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle: const TextStyle(
              color: Colors.black, height: 1.50, fontWeight: FontWeight.bold),
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(

        // textSelectionTheme: const TextSelectionThemeData(
        //    selectionHandleColor: Colors.deepOrange, // Change bubble to red
        //   cursorColor: Colors.deepOrange,
        //     selectionColor: Color(0xffEE8D6F)
        // ),

        inputDecorationTheme: const InputDecorationTheme(

            hintStyle: TextStyle(color: Colors.grey), border: InputBorder.none),
        appBarTheme:  const AppBarTheme(
       backgroundColor: Colors.white,
           // color: Colors.white,
shadowColor: Colors.yellow,
            surfaceTintColor: Colors.yellow,
            foregroundColor: Colors.yellow,

            toolbarTextStyle: TextStyle(color: Colors.yellow),
            titleTextStyle: TextStyle(color: Colors.yellow),
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.deepOrange),
       ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isEmpty)
        IconButton(
            splashRadius: 1,
            onPressed: () {
              // widget.actionSearch(widget.controller.text);
              query = '';
            },
            icon: const Icon(
              Icons.clear,
            )),
      IconButton(
          splashRadius: 1,
          onPressed: () {
            // if (controller.text.isNotEmpty) {
            //   getMovie();
            //   focusNode.unfocus();
            //   setState(() {
            //     isSearch = false;
            //   });
            // }
          },
          icon: const Icon(
            Icons.search,
            // color: MyColors.white,
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, null);
        // Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
    return null;
  }

  // @override
  // String? get searchFieldLabel => "hintText";

  @override
  Widget buildResults(BuildContext context) {
    return const Text(
      "54",
      style: TextStyle(color: Colors.orange),
    );
  }
@override
  void showResults(BuildContext context) {
    // TODO: implement showResults
    super.showResults(context);
    HistoryCityRepository.setListCity(query);
    close(context, null);
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> listCity = HistoryCityRepository.getListCity().cast();
    final suggestionsList = query.isEmpty
        ? listCity
        : listCity
            .where((p) => p.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          close(context, suggestionsList[index]);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => DetailScreen(number
          //             .indexWhere((item) => item == suggestionsList[index]))));
        },
        title: Text(suggestionsList[index]),
      ),
      itemCount: suggestionsList.length,
    );
  }
}

// class AppBarSearchWidget extends StatefulWidget implements PreferredSizeWidget {
//   const AppBarSearchWidget({Key? key}) : super(key: key);
//
//   @override
//   State<AppBarSearchWidget> createState() => _AppBarSearchWidgetState();
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
// }
//
// class _AppBarSearchWidgetState extends State<AppBarSearchWidget> {
//   bool isClean = true;
//   FocusNode focusNode = FocusNode();
//   bool isSearch = true;
//   TextEditingController controller = TextEditingController();
//
//   getMovie() {}
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 1,
//       leading: const BackButton(color: Colors.deepOrange),
//       actions: [
//         if (!isClean)
//           IconButton(
//               splashRadius: 1,
//               onPressed: () {
//                 // widget.actionSearch(widget.controller.text);
//                 controller.clear();
//                 setState(() {
//                   isClean = true;
//                   isSearch = true;
//                   FocusScope.of(context).requestFocus(focusNode);
//                 });
//               },
//               icon: const Icon(
//                 Icons.clear,
//               )),
//         if (isSearch)
//           IconButton(
//               splashRadius: 1,
//               onPressed: () {
//                 if (controller.text.isNotEmpty) {
//                   getMovie();
//                   focusNode.unfocus();
//                   setState(() {
//                     isSearch = false;
//                   });
//                 }
//               },
//               icon: const Icon(
//                 Icons.search,
//                 // color: MyColors.white,
//               )),
//       ],
//       title: TextFormField(
//         onTap: () {
//           if (!isSearch) {
//             isSearch = true;
//           }
//         },
//         onChanged: (v) {
//           if (isClean && controller.text.isNotEmpty) {
//             setState(() {
//               isClean = false;
//             });
//           } else if (controller.text.isEmpty) {
//             setState(() {
//               isClean = true;
//             });
//           }
//         },
//         keyboardType: TextInputType.text,
//         cursorColor: Colors.deepOrange,
//         style: TextStyle(
//             height: 1.45,
//             // color: MyColors.white,
//             // fontFamily: MyFont.titleFont,
//             fontSize: 17.sp),
//         cursorWidth: 1,
//         // cursorRadius:const Radius.circular(1000),
//         controller: controller,
//         autofocus: isSearch ? true : false,
//         focusNode: focusNode,
//         maxLines: 1,
//         cursorHeight: 30,
//
//         textInputAction: TextInputAction.search,
//         onFieldSubmitted: (s) {
//           getMovie();
//           setState(() {
//             isSearch = false;
//           });
//         },
//         decoration: const InputDecoration(
//           contentPadding: EdgeInsets.only(left: 0),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//           ),
//           hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
//           hintText: "Search...",
//         ),
//       ),
//       centerTitle: true,
//     );
//   }
// }
