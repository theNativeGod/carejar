import 'package:carejar/apis/apis.dart';

import '/models/category.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String _searchKeyword = '';
  List<Category> _categories = [...dummyCategories];

  get categories => _categories;

  set searchKeyword(value) {
    _searchKeyword = value;
    filter();
    notifyListeners();
  }

  fetchAndSetCategories() async {
    var response = await APIs().fetchDoctors();

    List<Category> cat = [];
    int i = 0;

    response['doctors'].forEach((e) {
      cat.add(
        Category(
            id: i + 100,
            name: e['specializations'][0]['subspecialization']
                ['subspecialization'],
            description:
                'This is an API generated response. Rest of all the categories are dummy data'),
      );
      i++;
    });
    cat.addAll(dummyCategories);
    _categories = cat;
    notifyListeners();
  }

  filter() {
    if (_searchKeyword.isEmpty) {
      fetchAndSetCategories();
    } else {
      List<Category> filteredCategories = _categories.where((element) {
        return element.name
            .toLowerCase()
            .contains(_searchKeyword.toLowerCase());
      }).toList();
      _categories = filteredCategories;
      notifyListeners();
    }
  }
}
