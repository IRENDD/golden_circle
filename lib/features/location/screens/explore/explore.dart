import 'package:flutter/material.dart';
import 'package:golden_circle/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:golden_circle/common/widgets/custom_shapes/shapes/drage_handle.dart';
import 'package:golden_circle/common/widgets/images/t_circular_image.dart';
import 'package:golden_circle/common/widgets/events/builder/event_card_builder.dart';
import 'package:golden_circle/map.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/image_string.dart';
import 'package:golden_circle/utils/constants/sizes.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Map
          SizedBox(
            width: double.infinity,
            //height: MediaQuery.of(context).size.height,
            height: 730,
            child: MapScreen(),
          ),

          /// Draggable Scrollable Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.05,
            minChildSize: 0.05,
            maxChildSize: 0.95,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 10, color: TColors.darkShadow)
                  ],
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: TColors
                          .white, // Ensures the app bar background color.
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42),
                        ),
                      ),
                      flexibleSpace: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          // This is used to apply effects or changes when the app bar is expanded or collapsed
                          return FlexibleSpaceBar(
                            background: Container(
                              decoration: BoxDecoration(
                                color: TColors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10, color: TColors.darkShadow)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: TSizes.md,
                                    vertical: TSizes.smm),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TDragHandle(
                                        color:
                                            TColors.textGrey.withOpacity(0.65)),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TSeachContainer(
                                              text: 'Search in Map'),
                                        ),
                                        SizedBox(width: TSizes.spaceBtwItems),
                                        TCircularImage(
                                          image: TImages.profile_pic,
                                          width: 40,
                                          height: 40,
                                          padding: 0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Column(
                        children: [
                          EventCardBuilder(
                              title: 'Upcoming Events',
                              showDate: true,
                              descSubTitleDate: [
                                '25th Feb',
                                '29th Feb',
                                '1st Mar',
                                '3rd Mar'
                              ],
                              descTitle: [
                                'Temple Street Night',
                                'Vintage Vibes Music Night',
                                'Bus Journey in Central',
                                'Timeless Treasures Bazaar'
                              ],
                              descSubTitle: [
                                '1.1 km',
                                '10 km',
                                '2.5 km',
                                '200 m'
                              ],
                              imgList: [
                                TImages.hk_event_1,
                                TImages.jazz_event,
                                TImages.hk_event_3,
                                TImages.hk_event_4,
                              ]),
                          EventCardBuilder(
                              title: 'Picks for You',
                              descTitle: [
                                'Golden Memories Book Club',
                                'Reflections Art Exhibit',
                                'Tranquil Tea Tasting',
                                'Classic Cinema Nights'
                              ],
                              showDate: true,
                              descSubTitleDate: [
                                '26th Feb',
                                '1st Mar',
                                '5th Mar',
                                '9th Mar'
                              ],
                              descSubTitle: [
                                '5.6 km',
                                '1.7 km',
                                '500 m',
                                '7.5 km'
                              ],
                              imgList: [
                                TImages.book_event,
                                TImages.exhibit_event,
                                TImages.tea_event,
                                TImages.movie_event,
                              ]),
                          EventCardBuilder(
                              title: 'Sport Events',
                              showDate: true,
                              descSubTitleDate: [
                                '4th Mar',
                                '10th Mar',
                                '15th Mar',
                                '27th Mar'
                              ],
                              descTitle: [
                                'Classic Golf Gala',
                                'Graceful Dancing Derby',
                                'Masters Table Tennis Challenge',
                                'Aquatic Aerobics Adventure'
                              ],
                              descSubTitle: [
                                '900 m',
                                '5 km',
                                '2.5 km',
                                '2.1 m'
                              ],
                              imgList: [
                                TImages.golf_event,
                                TImages.dance_event,
                                TImages.tennis_event,
                                TImages.aerobic_event,
                              ]),
                          SizedBox(height: TSizes.spaceBtwItems),
                          Text('Show More',
                              style: TTextStyle.bodySecondaryTitle),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
