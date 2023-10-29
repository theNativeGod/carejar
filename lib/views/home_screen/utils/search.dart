import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/category_provider.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  initController() {
    controller.addListener(() {
      Provider.of<CategoryProvider>(context, listen: false).searchKeyword =
          controller.text;
    });
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            const BoxShadow(
              offset: Offset(-1, -1),
              color: Colors.white,
              blurRadius: .5,
              spreadRadius: 1,
            ),
            BoxShadow(
              offset: const Offset(1, 1),
              color: Colors.grey.shade400,
              blurRadius: 1,
              spreadRadius: 2,
            ),
          ]),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.search,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
