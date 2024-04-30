import 'package:ecommerce/view/screens/double_sub_category_page.dart';
import 'package:ecommerce/view/screens/sub_category_page.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> route =
      <String, WidgetBuilder>{
    SubCategoryPage.id: (context) => const SubCategoryPage(),
    DoubleSubCategory.id: (context) => const DoubleSubCategory(),
  };
}
