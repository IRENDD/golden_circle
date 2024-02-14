import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/shapes/drage_handle.dart';
import 'package:flutter_application_1/common/widgets/events/event_cards/event_card_horizontal.dart';
import 'package:flutter_application_1/common/widgets/images/t_circular_image.dart';
import 'package:flutter_application_1/common/widgets/texts/section_heading.dart';
import 'package:flutter_application_1/map.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/image_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// -- Map
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: const MapScreen(),
          ),

          /// -- Draggable Scrollable Sheet
          DraggableScrollableSheet(
            // The initial size of the sheet when the app starts
            initialChildSize: 0.4,
            // The minimum height your sheet can shrink to
            minChildSize: 0.3,
            // The maximum size the bottom sheet can expand to.
            maxChildSize: 1.0,

            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: TColors.darkShadow,
                    ),
                  ],
                ),

                /// -- Main Page
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      /// -- Drage Handle Icon
                      TDragHandle(color: TColors.textGrey.withOpacity(0.65)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.md, vertical: TSizes.sm),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child:
                                        TSeachContainer(text: 'Search in Map')),
                                SizedBox(width: TSizes.spaceBtwItems),
                                TCircularImage(
                                  image: TImages.user,
                                  width: 40,
                                  height: 40,
                                  padding: 0,
                                ),
                              ],
                            ),
                            const SizedBox(height: TSizes.spaceBtwSections),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: TSizes.md),
                              child: Column(
                                children: [
                                  const TSectionHeading(
                                    title: 'Upcoming Events',
                                    showActionButton: false,
                                    textColor: TColors.secondary,
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  SizedBox(
                                    height: 180,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                              width:
                                                  TSizes.spaceBtwItems * 1.5),
                                      itemCount: 4,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          (const TEventCardHorizontal()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // You can add more widgets here as needed
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
