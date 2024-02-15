import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/shapes/drage_handle.dart';
import 'package:flutter_application_1/common/widgets/images/t_circular_image.dart';
import 'package:flutter_application_1/features/location/screens/explore/widgets/event_section.dart';
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
          /// Map
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: const MapScreen(),
          ),

          /// Draggable Scrollable Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.3,
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
                                    horizontal: TSizes.md, vertical: TSizes.sm),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TDragHandle(
                                        color:
                                            TColors.textGrey.withOpacity(0.65)),
                                    Row(
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
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          EventSection(),
                          EventSection(),
                          EventSection(),
                          EventSection(),
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
