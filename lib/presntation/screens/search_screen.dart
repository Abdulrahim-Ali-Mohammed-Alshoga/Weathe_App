import 'package:flutter/material.dart';

import '../widgets/show/my_search_delegate.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(const Duration(milliseconds: 1),
      //  () => showSearch(context: context, delegate: MySearchDelegate()));
  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          // color: Colors.deepOrange,
          ),
    );
  }
}
