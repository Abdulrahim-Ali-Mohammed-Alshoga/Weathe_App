import 'package:flutter/material.dart';

import '../widgets/app_bar_search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearchWidget(),
      body: Container(
          // color: Colors.deepOrange,
          ),
    );
  }
}
