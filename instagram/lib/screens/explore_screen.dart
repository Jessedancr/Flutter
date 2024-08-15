// ignore_for_file: must_be_immutable

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

import '../util/my_grid_view.dart';

class ExploreScreen extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: AnimSearchBar(
          rtl: true,
          width: 400,
          textController: textController,
          onSuffixTap: () {},
          onSubmitted: (value) {},
          color: Theme.of(context).primaryColor,
          textFieldColor: Colors.grey[500],
          helpText: 'Search',
        ),
      ),
      body: MyGridView(),
    );
  }
}
