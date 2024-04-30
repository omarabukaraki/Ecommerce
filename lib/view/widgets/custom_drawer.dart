import 'package:ecommerce/controller/firebase_auth_methods.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/view/screens/add_category_page.dart';
import 'package:ecommerce/view/widgets/home_page_widget/home_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.fetchUser();

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CircleAvatar(
                  radius: 50,
                  child: Image.asset('assets/images/user.png'),
                ),
              ),
              Text(
                '${userProvider.user.firstName ?? ''} ${userProvider.user.lastName ?? ''}',
                style: const TextStyle(color: AppColor.kPrimary, fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              DrawerComponent(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const AddCategoryPage();
                    },
                  ));
                },
              ),
            ],
          ),
          DrawerComponent(
            title: 'logout',
            onTap: () async {
              await context
                  .read<FirebaseAuthMethods>()
                  .logoutMethod(context: context);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key, this.onTap, this.title});
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    image: 'assets/images/add.png',
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    isImage: true),
                Text(
                  title ?? 'Add Category',
                  style: const TextStyle(fontSize: 16, color: AppColor.kBlack),
                )
              ],
            ),
            const HomeIconBtn(
                icon: Icons.arrow_forward_ios_rounded,
                iconColor: AppColor.kBlack,
                padding: EdgeInsets.symmetric(horizontal: 8),
                isImage: false)
          ],
        ),
      ),
    );
  }
}
