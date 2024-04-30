import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constant/app_colors.dart';

class AdsSliderComponent extends StatefulWidget {
  const AdsSliderComponent({
    super.key,
  });

  @override
  State<AdsSliderComponent> createState() => _AdsSliderComponentState();
}

class _AdsSliderComponentState extends State<AdsSliderComponent> {
  int inIndex = 0;
  List<int> list = [0, 1, 2];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: CarouselSlider.builder(
              itemCount: list.length,
              itemBuilder: (context, index, realIndex) {
                return const AdComponent();
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    inIndex = index;
                  });
                },
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
              )),
        ),
        AnimatedSmoothIndicator(
            effect: const ExpandingDotsEffect(
              dotWidth: 5,
              dotHeight: 5,
              activeDotColor: AppColor.kPrimary,
              dotColor: AppColor.kSecondary,
            ),
            activeIndex: inIndex,
            count: list.length),
      ],
    );
  }
}

class AdComponent extends StatelessWidget {
  const AdComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/real_ad.jpg',
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16),
          color: AppColor.kSecondary),
    );
  }
}
