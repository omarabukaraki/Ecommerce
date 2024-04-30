import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/model/double_sub_category.dart';
import 'package:ecommerce/providers/double_sub_category_provider.dart';
import 'package:ecommerce/view/screens/add_category_page.dart';
import 'package:ecommerce/view/widgets/home_page_widget/home_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoubleSubCategory extends StatelessWidget {
  const DoubleSubCategory({super.key});
  static String id = 'DoubleSubCategory';

  @override
  Widget build(BuildContext context) {
    Map subCategoryInfo = ModalRoute.of(context)!.settings.arguments as Map;
    final doubleSubCategoryProvider =
        Provider.of<DoubleSubCategoryProvider>(context);
    doubleSubCategoryProvider.fetchDoubleSubCategories(
        subCategoryInfo['categoryId'], subCategoryInfo['subCategoryId']);

    return Scaffold(
      appBar: AppBar(
        title: Text(subCategoryInfo['subCategoryName']),
      ),
      body: doubleSubCategoryProvider.doubleSubCategories.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: doubleSubCategoryProvider.doubleSubCategories.length,
              itemBuilder: (context, index) {
                final doubleSubCategory =
                    doubleSubCategoryProvider.doubleSubCategories[index];
                return doubleSubCategory.id == ''
                    ? DoubleSubCategoryForm(
                        subCategoryInfo: subCategoryInfo,
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 218, 233, 228),
                        ),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const HomeIconBtn(
                                    icon: Icons.layers_outlined,
                                    image: 'assets/images/add.png',
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    isImage: false),
                                Text(
                                  doubleSubCategory.name,
                                  style: const TextStyle(
                                      fontSize: 16, color: AppColor.kBlack),
                                )
                              ],
                            ),
                            const HomeIconBtn(
                                icon: Icons.check,
                                iconColor: AppColor.kBlack,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                isImage: false)
                          ],
                        ),
                      );
              },
            ),
    );
  }
}

class DoubleSubCategoryForm extends StatefulWidget {
  const DoubleSubCategoryForm({super.key, required this.subCategoryInfo});
  final Map subCategoryInfo;

  @override
  State<DoubleSubCategoryForm> createState() => _DoubleSubCategoryFormState();
}

class _DoubleSubCategoryFormState extends State<DoubleSubCategoryForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController doubleSubCategoryName = TextEditingController();
  void clearTextField() {
    doubleSubCategoryName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          CategoryTextField(
            hintText: 'Sub category name',
            controller: doubleSubCategoryName,
            onChanged: (value) {
              doubleSubCategoryName.text = value;
            },
          ),
          CategoryButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                final subCategoryProvider =
                    Provider.of<DoubleSubCategoryProvider>(context,
                        listen: false);
                final subCategory = DoubleSubCategoryModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: doubleSubCategoryName.text,
                  image: 'assets/images/menu.png',
                  subCategoryName: widget.subCategoryInfo['subCategoryName'],
                  categoryName: widget.subCategoryInfo['categoryName'],
                );
                subCategoryProvider.addDoubleSubCategory(
                  subCategory,
                  widget.subCategoryInfo['categoryId'],
                  widget.subCategoryInfo['categoryName'],
                  widget.subCategoryInfo['subCategoryId'],
                  widget.subCategoryInfo['subCategoryName'],
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
