import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'home_icon_btn.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverGrid.builder(
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return const ProductComponent();
        },
      ),
    );
  }
}

class ProductComponent extends StatelessWidget {
  const ProductComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.kSecondary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/car_ad.png',
                    fit: BoxFit.cover,
                  ),
                )),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 8, left: 4, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Peugeot Car',
                      ),
                      HomeIconBtn(
                          radius: 12,
                          icon: Icons.add,
                          iconColor: AppColor.kWhite,
                          backgroundColor: AppColor.kPrimary,
                          padding: EdgeInsets.all(0),
                          isImage: false),
                    ],
                  ),
                  Text(
                    '\$20,000',
                    style: TextStyle(
                        color: AppColor.kBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
