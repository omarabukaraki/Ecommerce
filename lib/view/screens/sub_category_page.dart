import 'package:ecommerce/model/sub_category_model.dart';
import 'package:ecommerce/providers/sub_category_provider.dart';
import 'package:ecommerce/view/screens/add_category_page.dart';
import 'package:ecommerce/view/screens/double_sub_category_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_drawer.dart';

class SubCategoryPage extends StatelessWidget {
  const SubCategoryPage({super.key});

  static String id = 'SubCategoryPage';

  @override
  Widget build(BuildContext context) {
    Map categoryInfo = ModalRoute.of(context)!.settings.arguments as Map;
    final subCategoryProvider = Provider.of<SubCategoryProvider>(context);
    subCategoryProvider.fetchSubCategories(categoryInfo['categoryId']);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryInfo['categoryName']),
      ),
      body: subCategoryProvider.subCategories.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: subCategoryProvider.subCategories.length,
              itemBuilder: (context, index) {
                final subCategory = subCategoryProvider.subCategories[index];
                return subCategory.id == ''
                    ? SubCategoryForm(
                        categoryInfo: categoryInfo,
                      )
                    : DrawerComponent(
                        title: subCategory.name,
                        onTap: () {
                          Navigator.pushNamed(context, DoubleSubCategory.id,
                              arguments: {
                                'categoryId': categoryInfo['categoryId'],
                                'categoryName': categoryInfo['categoryName'],
                                'subCategoryId': subCategory.id,
                                'subCategoryName': subCategory.name,
                              });
                        },
                      );
              },
            ),
    );
  }
}

class SubCategoryForm extends StatefulWidget {
  const SubCategoryForm({super.key, required this.categoryInfo});
  final Map categoryInfo;
  @override
  State<SubCategoryForm> createState() => _SubCategoryFormState();
}

class _SubCategoryFormState extends State<SubCategoryForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController subCategoryName = TextEditingController();

  void clearTextField() {
    subCategoryName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          CategoryTextField(
            hintText: 'Sub category name',
            controller: subCategoryName,
            onChanged: (value) {
              subCategoryName.text = value;
            },
          ),
          CategoryButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                final subCategoryProvider =
                    Provider.of<SubCategoryProvider>(context, listen: false);
                final subCategory = SubCategory(
                  categoryName: widget.categoryInfo['categoryName'],
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: subCategoryName.text,
                  image: 'assets/images/menu.png',
                );
                subCategoryProvider.addSubCategory(
                  subCategory,
                  widget.categoryInfo['categoryId'],
                  widget.categoryInfo['categoryName'],
                );
                clearTextField();
              }
            },
          )
        ],
      ),
    );
  }
}
