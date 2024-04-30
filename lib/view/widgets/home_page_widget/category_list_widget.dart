import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_icon_btn.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.fetchCategories();
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categoties',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'See All categoties',
                style: TextStyle(color: AppColor.kPrimary),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 42,
          child: categoryProvider.categories.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: categoryProvider.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = categoryProvider.categories[index];
                    return category.id != ''
                        ? CategoryComponent(
                            image: category.image,
                            text: category.name,
                          )
                        : const SizedBox();
                  },
                ),
        ),
      ],
    );
  }
}

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key, this.text, this.image});
  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: AppColor.kSecondary),
      child: Row(
        children: [
          HomeIconBtn(
              image: image ?? 'assets/images/soap.png',
              backgroundColor: AppColor.kWhite,
              padding: const EdgeInsets.all(5),
              isImage: true),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(text ?? 'Oli '),
          )
        ],
      ),
    );
  }
}
