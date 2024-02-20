import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_application_1/features/location/screens/event_details/event_details.dart';
import 'package:flutter_application_1/features/location/screens/explore/widgets/event_card_builder.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/icon_svg.dart';
import 'package:flutter_application_1/utils/constants/image_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/texts_style.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 170,
            backgroundColor: TColors.white,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // bool isExpanded = constraints.biggest.height > kToolbarHeight;
                return FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        height: 200,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(TSizes.borderRadiusLg),
                            bottomRight: Radius.circular(TSizes.borderRadiusLg),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: TColors.black.withOpacity(0.45))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              /// -- Search Bar
                              _buildSearchBar(context),
                              const SizedBox(
                                  height: TSizes.spaceBtwItems * 1.5),

                              /// -- Filter
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    TRoundedContainer(
                                      height: 40,
                                      radius: 9,
                                      backgroundColor: TColors.buttonPrimary,
                                      text: "Filters",
                                      textStyle: TTextStyle.bodySubtitle,
                                      icon: const Iconify(TIcons.svgFilter,
                                          size: 26, color: TColors.secondary),
                                    ),
                                    const SizedBox(width: TSizes.spaceBtwItems),
                                    const TRoundedContainer(
                                      height: 40,
                                      radius: 9,
                                      backgroundColor: TColors.secondary,
                                      text: "Date",
                                      textStyle: TTextStyle.bodySecondaryTitle,
                                      icon: Iconify(TIcons.svgEvents,
                                          size: 24, color: TColors.white),
                                      icon1: Iconify(TIcons.svgArrowBottom,
                                          size: 18, color: TColors.white),
                                    ),
                                    const SizedBox(width: TSizes.spaceBtwItems),
                                    const TRoundedContainer(
                                      height: 40,
                                      radius: 9,
                                      backgroundColor: TColors.secondary,
                                      text: "Category",
                                      textStyle: TTextStyle.bodySecondaryTitle,
                                      icon: Iconify(TIcons.svgEvents,
                                          size: 24, color: TColors.white),
                                      icon1: Iconify(TIcons.svgArrowBottom,
                                          size: 18, color: TColors.white),
                                    ),
                                  ],
                                ),
                              ),
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
                /// Main
                EventCardBuilder(
                    onTap: () => Get.to(() => const EventDetailsScreen()),
                    title: 'Popular Events in Hong Kong',
                    height: 250,
                    imgHeight: 150,
                    imgWidth: 380,
                    showDate: false,
                    descTitleStyle: TTextStyle.headlineSmall,
                    descSubTitleStyle: TTextStyle.bodyTitle,
                    descSubTitleDate: const [
                      'February 14th',
                      'February 21st',
                      'March 1st',
                      'March 3rd'
                    ],
                    descSubTitleFee: const [
                      'Free',
                      'Free',
                      'From \$15',
                      '\$5'
                    ],
                    descTitle: const [
                      'Temple Street Night',
                      'Discovery of Hong Kong',
                      'Bus Journey in Central',
                      'Street Life Market'
                    ],
                    descSubTitle: const [
                      '1.1 km',
                      '10 km',
                      '2.5 km',
                      '200 m'
                    ],
                    imgList: const [
                      TImages.hk_event_1,
                      TImages.hk_event_2,
                      TImages.hk_event_3,
                      TImages.hk_event_4,
                    ]),
                const EventCardBuilder(title: 'Upcoming Events', descTitle: [
                  'Temple Street Night',
                  'Discovery of Hong Kong',
                  'Bus Journey in Central',
                  'Street Life Market'
                ], descSubTitle: [
                  '1.1 km',
                  '10 km',
                  '2.5 km',
                  '200 m'
                ], imgList: [
                  TImages.hk_event_1,
                  TImages.hk_event_2,
                  TImages.hk_event_3,
                  TImages.hk_event_4,
                ]),
                const EventCardBuilder(title: 'Upcoming Events', descTitle: [
                  'Temple Street Night',
                  'Discovery of Hong Kong',
                  'Bus Journey in Central',
                  'Street Life Market'
                ], descSubTitle: [
                  '1.1 km',
                  '10 km',
                  '2.5 km',
                  '200 m'
                ], imgList: [
                  TImages.hk_event_1,
                  TImages.hk_event_2,
                  TImages.hk_event_3,
                  TImages.hk_event_4,
                ]),
                const EventCardBuilder(title: 'Upcoming Events', descTitle: [
                  'Temple Street Night',
                  'Discovery of Hong Kong',
                  'Bus Journey in Central',
                  'Street Life Market'
                ], descSubTitle: [
                  '1.1 km',
                  '10 km',
                  '2.5 km',
                  '200 m'
                ], imgList: [
                  TImages.hk_event_1,
                  TImages.hk_event_2,
                  TImages.hk_event_3,
                  TImages.hk_event_4,
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      style: TTextStyle.mainTitle,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 3, color: TColors.borderPrimary2)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 3, color: TColors.secondary)),
          prefixIcon: IconButton(
            icon: const Iconify(TIcons.svgSearch,
                size: 24, color: TColors.textGrey),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
              icon: const Iconify(TIcons.svgMicrophone,
                  size: 26, color: TColors.textGrey),
              onPressed: () {}),
          hintText: 'Search...',
          hintStyle: TTextStyle.mainTitle,
          border: InputBorder.none),
    );
  }
}
