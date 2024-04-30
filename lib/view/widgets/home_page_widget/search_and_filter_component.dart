import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'home_icon_btn.dart';

class SearchAndFilterComponent extends StatelessWidget {
  const SearchAndFilterComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SearchBarComponent(),
        HomeIconBtn(
          iconColor: AppColor.kWhite,
          backgroundColor: AppColor.kPrimary,
          radius: (MediaQuery.of(context).size.height * 0.06) / 2,
          isImage: false,
          icon: Icons.filter_alt_outlined,
          padding: const EdgeInsets.only(right: 16, left: 8),
        )
      ],
    );
  }
}

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.kSecondary),
        height: MediaQuery.of(context).size.height * 0.06,
        child: TextFormField(
          decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
