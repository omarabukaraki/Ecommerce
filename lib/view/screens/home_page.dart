import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/view/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/home_page_widget/ads_slider_component.dart';
import '../widgets/home_page_widget/category_list_widget.dart';
import '../widgets/home_page_widget/home_page_app_bar.dart';
import '../widgets/home_page_widget/product_list_widget.dart';
import '../widgets/home_page_widget/search_and_filter_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kSecondary,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: HomePageAppBar(
            onTapMenu: () {
              if (scaffoldKey.currentState?.isDrawerOpen == false) {
                scaffoldKey.currentState?.openDrawer();
              } else {
                scaffoldKey.currentState?.openEndDrawer();
              }
            },
          ),
          drawer: const CustomDrawer(),
          body: const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SearchAndFilterComponent(),
              ),
              SliverToBoxAdapter(
                child: AdsSliderComponent(),
              ),
              SliverToBoxAdapter(
                child: CategoryListWidget(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prodacts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'See All categoties',
                        style: TextStyle(color: AppColor.kPrimary),
                      ),
                    ],
                  ),
                ),
              ),
              ProductListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
