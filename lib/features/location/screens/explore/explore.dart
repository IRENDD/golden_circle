import 'package:flutter/material.dart';
import 'package:jazz/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:jazz/common/widgets/custom_shapes/shapes/drage_handle.dart';
import 'package:jazz/common/widgets/images/t_circular_image.dart';
import 'package:jazz/common/widgets/events/builder/event_card_builder.dart';
import 'package:jazz/map.dart';
import 'package:jazz/utils/constants/colors.dart';
import 'package:jazz/utils/constants/image_string.dart';
import 'package:jazz/utils/constants/sizes.dart';

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
            height: MediaQuery.of(context).size.height,
            child:  MapScreen(),
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
                                          image: TImages.user,
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
                              descTitle: [
                                'Temple Street Night',
                                'Discovery of Hong Kong',
                                'Bus Journey in Central',
                                'Street Life Market'
                              ],
                              descSubTitle: [
                                '1.1 km',
                                '10 km',
                                '2.5 km',
                                '200 m'
                              ],
                              imgList: [
                                TImages.hk_event_1,
                                TImages.hk_event_2,
                                TImages.hk_event_3,
                                TImages.hk_event_4,
                              ]),
                          EventCardBuilder(
                              title: 'Upcoming Events',
                              descTitle: [
                                'Temple Street Night',
                                'Discovery of Hong Kong',
                                'Bus Journey in Central',
                                'Street Life Market'
                              ],
                              descSubTitle: [
                                '1.1 km',
                                '10 km',
                                '2.5 km',
                                '200 m'
                              ],
                              imgList: [
                                TImages.hk_event_1,
                                TImages.hk_event_2,
                                TImages.hk_event_3,
                                TImages.hk_event_4,
                              ]),
                          EventCardBuilder(
                              title: 'Upcoming Events',
                              descTitle: [
                                'Temple Street Night',
                                'Discovery of Hong Kong',
                                'Bus Journey in Central',
                                'Street Life Market'
                              ],
                              descSubTitle: [
                                '1.1 km',
                                '10 km',
                                '2.5 km',
                                '200 m'
                              ],
                              imgList: [
                                TImages.hk_event_1,
                                TImages.hk_event_2,
                                TImages.hk_event_3,
                                TImages.hk_event_4,
                              ]),
                          EventCardBuilder(
                              title: 'Upcoming Events',
                              descTitle: [
                                'Temple Street Night',
                                'Discovery of Hong Kong',
                                'Bus Journey in Central',
                                'Street Life Market'
                              ],
                              descSubTitle: [
                                '1.1 km',
                                '10 km',
                                '2.5 km',
                                '200 m'
                              ],
                              imgList: [
                                TImages.hk_event_1,
                                TImages.hk_event_2,
                                TImages.hk_event_3,
                                TImages.hk_event_4,
                              ]),
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
