import 'package:carejar/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../models/category.dart';
import '../../../view_models/category_provider.dart';
import 'export.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final apis = APIs();
  bool isLoading = false;

  //reference our box
  final _myBox = Hive.box('myBox');

  //write data
  void writeData(key, value) {
    _myBox.put(key, value);
  }

  //read data
  void readData(key) {
    _myBox.get(key);
  }

  @override
  void initState() {
    fetchAndSetCategories();
    super.initState();
  }

  fetchAndSetCategories() async {
    isLoading = true;
    setState(() {});
    await Provider.of<CategoryProvider>(context, listen: false)
        .fetchAndSetCategories();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var categoriesProvider = Provider.of<CategoryProvider>(context);
    List<Category> categories = categoriesProvider.categories;

    return isLoading
        ? SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: const Center(child: CircularProgressIndicator()),
          )
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (ctx, i) => const SizedBox(
                  height: 8,
                ),
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (ctx, i) {
              writeData(i, categories[i].toJson());
              APIs().setDataInCloud(categories[i].id, categories[i].toJson());
              return CategoryCard(categories[i]);
            });
  }
}
