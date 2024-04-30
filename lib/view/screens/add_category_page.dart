import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/providers/category_provider.dart';
import 'package:ecommerce/view/screens/sub_category_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/category_model.dart';
import '../widgets/custom_drawer.dart';

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.fetchCategories();
    return Scaffold(
      appBar: AppBar(
        title: const Text('category'),
      ),
      body: categoryProvider.categories.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) {
                final category = categoryProvider.categories[index];
                return category.id == ''
                    ? const AddCategoryFrom()
                    : DrawerComponent(
                        title: category.name,
                        onTap: () {
                          Navigator.pushNamed(context, SubCategoryPage.id,
                              arguments: {
                                'categoryId': category.id,
                                'categoryName': category.name
                              });
                        },
                      );
              },
            ),
    );
  }
}

class AddCategoryFrom extends StatefulWidget {
  const AddCategoryFrom({super.key});

  @override
  State<AddCategoryFrom> createState() => _AddCategoryFromState();
}

class _AddCategoryFromState extends State<AddCategoryFrom> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController categoryName = TextEditingController();

  void clearTextField() {
    categoryName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          CategoryTextField(
            controller: categoryName,
            onChanged: (value) {
              categoryName.text = value;
            },
          ),
          CategoryButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                final categoryProvider =
                    Provider.of<CategoryProvider>(context, listen: false);
                final category = Category(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: categoryName.text,
                  image: 'assets/images/menu.png',
                );
                categoryProvider.addCategory(category);
                clearTextField();
              }
            },
          )
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: (MediaQuery.of(context).size.height * 0.06) / 2,
          backgroundColor: AppColor.kSecondary,
          child: const Icon(
            Icons.add,
            color: AppColor.kBlack,
          ),
        ),
      ),
    );
  }
}

class CategoryTextField extends StatelessWidget {
  const CategoryTextField(
      {super.key, this.onChanged, this.controller, this.hintText});
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.kSecondary),
        height: MediaQuery.of(context).size.height * 0.06,
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 0, color: AppColor.kPrimary),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: AppColor.kPrimary)),
            hintText: hintText ?? 'Category name',
            prefixIcon: const Icon(Icons.category),
            contentPadding: const EdgeInsets.all(0),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
