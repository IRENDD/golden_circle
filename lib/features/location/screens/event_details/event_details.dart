import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_application_1/common/widgets/images/t_circular_image.dart';
import 'package:flutter_application_1/features/location/screens/event_details/widgets/promo_slider.dart';
import 'package:flutter_application_1/features/location/screens/event_details/widgets/tags.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/icon_svg.dart';
import 'package:flutter_application_1/utils/constants/image_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/texts_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 90,
            backgroundColor: TColors.white,
            leading: IconButton(
                icon: const Iconify(TIcons.svgArrowLeft,
                    size: 24, color: TColors.secondary),
                onPressed: () => Get.back()),
            title: Text('Temple Street Night', style: TTextStyle.headlineSmall),
            actions: [
              IconButton(
                  icon: const Iconify(TIcons.svgHeart,
                      size: 24, color: TColors.secondary),
                  onPressed: () {}),
              IconButton(
                  icon: const Iconify(TIcons.svgShare,
                      size: 22, color: TColors.secondary),
                  onPressed: () {}),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // bool isExpanded = constraints.biggest.height > kToolbarHeight;
                return FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          margin: const EdgeInsets.only(
                              bottom: TSizes.defaultSpace),
                          decoration: BoxDecoration(
                            color: TColors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(TSizes.borderRadiusLg),
                              bottomRight:
                                  Radius.circular(TSizes.borderRadiusLg),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10, color: TColors.darkShadow)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                /// -- Image
                const TPromoSlider(banners: [
                  TImages.hk_event_1,
                  TImages.hk_event_1,
                  TImages.hk_event_1,
                ]),
                const SizedBox(height: TSizes.spaceBtwItems / 1.25),

                /// -- Tags
                const TTags(tagNames: [
                  'Sport',
                  'Hiking',
                  'Landscape',
                ]),

                /// -- Main Text
                Padding(
                  padding: const EdgeInsets.only(
                      top: TSizes.defaultSpace * 1.5,
                      left: TSizes.defaultSpace * 1.5,
                      right: TSizes.defaultSpace * 1.5,
                      bottom: TSizes.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Temple Street Night',
                              style: TTextStyle.mainTitle),
                          const SizedBox(height: TSizes.xs),
                          Text('February 13-14',
                              style: TTextStyle.mainSubtitle),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('18:30', style: TTextStyle.mainTitle),
                          Text('2 hours', style: TTextStyle.mainSubtitle),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                    indent: TSizes.defaultSpaceLg,
                    endIndent: TSizes.defaultSpaceLg),
                const SizedBox(height: TSizes.spaceBtwItems / 1.25),

                /// -- Organization Name
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpaceLg),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      TRoundedContainer(
                        width: 350,
                        height: 65,
                        radius: 10,
                        backgroundColor: TColors.buttonSecondary,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: TSizes.md),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const TCircularImage(
                                  image: TImages.user,
                                  width: 40,
                                  height: 40,
                                  padding: 0,
                                ),
                                const SizedBox(width: 10),
                                LimitedBox(
                                  maxWidth: 160, // Limit the text width
                                  child: Text(
                                    'Hong Kong Society for the Aged',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color:
                                            TColors.secondary.withOpacity(0.9),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -0.2),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: TColors.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        TSizes.borderRadiusSm),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: TSizes.m)),
                              child: const Text('Follow',
                                  style:
                                      TTextStyle.secondaryButton), // Text color
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems * 1.5),

                /// -- Event Information Details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          TRoundedContainer(
                            width: 45,
                            height: 45,
                            radius: 10,
                            backgroundColor: TColors.buttonSecondary,
                          ),
                          const Iconify(TIcons.svgExplore,
                              color: TColors.secondary, size: 28),
                        ],
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location', style: TTextStyle.bodyTitle),
                          Text('1 Hung Lai Road, Hong Kong',
                              style: TTextStyle.bodySubtitle),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems * 1.5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          TRoundedContainer(
                            width: 45,
                            height: 45,
                            radius: 10,
                            backgroundColor: TColors.buttonSecondary,
                          ),
                          const Iconify(TIcons.svgExplore,
                              color: TColors.secondary, size: 28),
                        ],
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location', style: TTextStyle.bodyTitle),
                          Text('1 Hung Lai Road, Hong Kong',
                              style: TTextStyle.bodySubtitle),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems * 1.5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          TRoundedContainer(
                            width: 45,
                            height: 45,
                            radius: 10,
                            backgroundColor: TColors.buttonSecondary,
                          ),
                          const Iconify(TIcons.svgExplore,
                              color: TColors.secondary, size: 28),
                        ],
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location', style: TTextStyle.bodyTitle),
                          Text('1 Hung Lai Road, Hong Kong',
                              style: TTextStyle.bodySubtitle),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
