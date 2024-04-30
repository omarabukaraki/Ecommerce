import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'home_icon_btn.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key, this.onTapMenu});
  final VoidCallback? onTapMenu;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Home',
        style: TextStyle(color: AppColor.kBlack),
      ),
      automaticallyImplyLeading: false,
      leading: HomeIconBtn(
        onTap: onTapMenu,
        isImage: false,
        icon: Icons.menu_rounded,
        padding: const EdgeInsets.only(left: 16),
      ),
      actions: const [
        HomeIconBtn(
          isImage: false,
          icon: Icons.wallet,
          padding: EdgeInsets.only(right: 16),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
