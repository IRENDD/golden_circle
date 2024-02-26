import 'package:flutter/material.dart';
import 'package:golden_circle/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:golden_circle/common/widgets/images/t_circular_image.dart';
import 'package:golden_circle/features/location/screens/event_details/widgets/promo_slider.dart';
import 'package:golden_circle/features/location/screens/event_details/widgets/tags.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/icon_svg.dart';
import 'package:golden_circle/utils/constants/image_string.dart';
import 'package:golden_circle/utils/constants/sizes.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 90,
                backgroundColor: TColors.white,
                leading: IconButton(
                    icon: const Iconify(TIcons.svgArrowLeft,
                        size: 24, color: TColors.secondary),
                    onPressed: () => Get.back()),
                title: Text('Temple Street Night',
                    style: TTextStyle.headlineSmall),
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
                      TImages.hk_event_5,
                      TImages.hk_event_6,
                    ]),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.25),

                    /// -- Tags
                    const TTags(tagNames: [
                      'Interaction',
                      'Action',
                      'Culture',
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
                        endIndent: TSizes.defaultSpaceLg,
                        thickness: 2),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: TSizes.md),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const TCircularImage(
                                      image: TImages.org_pic,
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
                                            color: TColors.secondary
                                                .withOpacity(0.9),
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
                                      style: TTextStyle
                                          .secondaryButton), // Text color
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
                              Text('Time', style: TTextStyle.bodyTitle),
                              Text('18:00-22:00',
                                  style: TTextStyle.bodySubtitle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems * 1.5),
                    const Divider(
                        indent: TSizes.defaultSpaceLg,
                        endIndent: TSizes.defaultSpaceLg,
                        thickness: 2),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text('About this event', style: TTextStyle.mainTitle),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Text(
                            'Temple Street Night Market, located in the heart of Kowloon, Hong Kong, is a quintessential feature of local nightlife and a must-visit destination for those keen to experience the city\'s vibrant street culture. As the sun sets, the area transforms into a bustling marketplace, alive with the sights, sounds, and smells of traditional Chinese life. Vendors line the street, offering everything from trinkets, tea ware, electronics, watches, and menswear to antiques and jade items, creating a treasure trove for bargain hunters and souvenir seekers.',
                            style: TTextStyle.mainSubtitle,
                            maxLines: isExpanded
                                ? null
                                : 3, // Show all lines if expanded, else limit to 3
                            overflow: isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isExpanded =
                                    !isExpanded; // Toggle the expanded state
                              });
                            },
                            child: Text(
                              isExpanded ? "Read Less" : "Read More",
                              style: TextStyle(
                                color: TColors
                                    .primary, // Style for the "Read More/Less" text, assuming it's clickable
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections * 3.5),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
              decoration: BoxDecoration(
                color: Colors
                    .white, // Set the background color inside the BoxDecoration
                border: Border(
                  top: BorderSide(
                    color: TColors.borderPrimary2, // Color of the border
                    width: 2.5, // Width of the border
                  ),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement join action
                },
                style: ElevatedButton.styleFrom(
                  primary: TColors.secondary, // Button color
                  onPrimary:
                      Colors.white, // Text color (if the button is enabled)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Join Now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
