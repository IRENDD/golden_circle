import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_application_1/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_application_1/features/location/controller/event_controller.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventController());
    const imageWidth = 350.0;
    const imageHeight = 180.0;
    return Stack(
      children: [
        /// -- Carousel
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners
              .map((url) => TRoundedImage(
                  imageUrl: url,
                  width: imageWidth,
                  height: imageHeight,
                  borderRadius: 20,
                  innerShadow: true,
                  border: Border.all(
                      width: 2, color: TColors.borderPrimary.withOpacity(0.5))))
              .toList(),
        ),

        /// -- Carousel Slider
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                      width: (imageWidth / banners.length) * 0.66,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      borderColor: Colors.transparent,
                      backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              ? TColors.white
                              : TColors.white.withOpacity(0.4)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
