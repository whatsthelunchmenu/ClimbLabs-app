import 'package:climb_labs/app/controller/search/search_controller.dart';
import 'package:climb_labs/app/ui/android/search/components.dart'
    show LocationGridView, SearchAppbar;
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SearchController.to.focusNode.unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 5)),
              SearchAppbar(),
              SliverToBoxAdapter(child: SizedBox(height: 5)),
              LocationGridView(),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
            ]),
          ),
        ),
      ),
    );
  }
}
