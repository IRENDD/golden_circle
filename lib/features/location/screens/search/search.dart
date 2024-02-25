import 'package:flutter/material.dart';
import 'package:golden_circle/backend/schema/index.dart';
import 'package:golden_circle/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:golden_circle/features/location/screens/event_details/event_details.dart';
import 'package:golden_circle/common/widgets/events/builder/event_card_builder.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/icon_svg.dart';
import 'package:golden_circle/utils/constants/image_string.dart';
import 'package:golden_circle/utils/constants/sizes.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:golden_circle/backend/schema/events_collection_record.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Widget> eventCardsList = [];

  @override
  void initState() {
    super.initState();
    retrieveDocuments();
  }

Future<void> retrieveDocuments() async {
  try {
    // Get the Firestore collection reference
    CollectionReference collection = EventsCollectionRecord.collection;

    // Get a list of documents in the collection
    QuerySnapshot querySnapshot_Social = await collection.where('eventID',isEqualTo: 'social').get();

    // Create a List<String> to store event details
    List<String> socialEventNameList = [];
    List<String> socialEventDetailList = [];
    List<LatLng?> socialEventLocationList = [];
    List<int> socialEventParticipationListi = [];

    // Loop through the documents and populate the eventDetailsList
    querySnapshot_Social.docs.forEach((doc) {
      EventsCollectionRecord record = EventsCollectionRecord.fromSnapshot(doc);

      // Add event details to the list
      socialEventNameList.add(record.eventName);
      socialEventDetailList.add(record.eventDetails);
      socialEventLocationList.add(record.location);
      socialEventParticipationListi.add(record.participants);
    });

    List<String> socialEventParticipationList = socialEventParticipationListi.map((int number) => number.toString()).toList();

    // Create EventCardBuilder using the eventDetailsList
    EventCardBuilder eventSocialCardBuilder = EventCardBuilder(
      descTitle: socialEventNameList,
      descSubTitle: socialEventParticipationList,
      title:"Social Events: Meet new people",
      imgList: const [
          TImages.hk_event_1,
          TImages.hk_event_2,
          TImages.hk_event_3,
          TImages.hk_event_4,
        ],
      // Other properties based on your record fields
    );

    QuerySnapshot querySnapshot_Active = await collection.where('eventID',isEqualTo: 'active').get();

    // Create a List<String> to store event details
    List<String> activeEventNameList = [];
    List<String> activeEventDetailList = [];
    List<LatLng?> activeEventLocationList = [];
    List<int> activeEventParticipationListi = [];

    // Loop through the documents and populate the eventDetailsList
    querySnapshot_Active.docs.forEach((doc) {
      EventsCollectionRecord record = EventsCollectionRecord.fromSnapshot(doc);

      // Add event details to the list
      activeEventNameList.add(record.eventName);
      activeEventDetailList.add(record.eventDetails);
      activeEventLocationList.add(record.location);
      activeEventParticipationListi.add(record.participants);
    });

    List<String> activeEventParticipationList = activeEventParticipationListi.map((int number) => number.toString()).toList();

    // Create EventCardBuilder using the eventDetailsList
    EventCardBuilder eventActiveCardBuilder = EventCardBuilder(
      descTitle: activeEventNameList,
      descSubTitle: activeEventParticipationList,
      descSubTitleDate: activeEventParticipationList,
      title:"Social Events: Meet new people",
      imgList: const [
          TImages.hk_event_1,
          TImages.hk_event_2,
          TImages.hk_event_3,
          TImages.hk_event_4,
        ],
      // Other properties based on your record fields
    );

    // Display the retrieved event cards
    setState(() {
      eventCardsList = [eventSocialCardBuilder, eventActiveCardBuilder];
    });
  } catch (e) {
    print('Error retrieving documents: $e');
  }
}

Future<void> retrieveActiveDocuments() async {
  try {
    // Get the Firestore collection reference
    CollectionReference collection = EventsCollectionRecord.collection;

    // Get a list of documents in the collection
    QuerySnapshot querySnapshot = await collection.where('eventID',isEqualTo:'active').get();

    // Create a List<String> to store event details
    List<String> eventDetailsList = [];

    // Loop through the documents and populate the eventDetailsList
    querySnapshot.docs.forEach((doc) {
      EventsCollectionRecord record = EventsCollectionRecord.fromSnapshot(doc);

      // Add event details to the list
      eventDetailsList.add(record.eventDetails);
      // ... (you can add other fields to other lists if needed)
    });

    // Create EventCardBuilder using the eventDetailsList
    EventCardBuilder eventCardBuilder = EventCardBuilder(
      descTitle: eventDetailsList,
      descSubTitle: eventDetailsList,
      title:"Social Events: Meet and conversate with new people",
      imgList: const [
          TImages.hk_event_1,
          TImages.hk_event_2,
          TImages.hk_event_3,
          TImages.hk_event_4,
        ],
      // Other properties based on your record fields
    );

    // Display the retrieved event cards
    setState(() {
      eventCardsList = [eventCardBuilder];
    });
  } catch (e) {
    print('Error retrieving documents: $e');
  }
}

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
                              SearchBar(context: context),
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
              children: eventCardsList.isNotEmpty
                  ? eventCardsList
                  : [Text('Loading events...')],
            ),
          )
        ],
      ),
    );
  }
}



// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: 170,
//             backgroundColor: TColors.white,
//             flexibleSpace: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 // bool isExpanded = constraints.biggest.height > kToolbarHeight;
//                 return FlexibleSpaceBar(
//                   background: Stack(
//                     children: [
//                       Container(
//                         height: 200,
//                         margin: const EdgeInsets.only(bottom: 15),
//                         decoration: BoxDecoration(
//                           color: TColors.white,
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(TSizes.borderRadiusLg),
//                             bottomRight: Radius.circular(TSizes.borderRadiusLg),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                                 blurRadius: 10,
//                                 color: TColors.black.withOpacity(0.45))
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 20),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: <Widget>[
//                               /// -- Search Bar
//                               SearchBar(context: context),
//                               const SizedBox(
//                                   height: TSizes.spaceBtwItems * 1.5),

//                               /// -- Filter
//                               SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: [
//                                     TRoundedContainer(
//                                       height: 40,
//                                       radius: 9,
//                                       backgroundColor: TColors.buttonPrimary,
//                                       text: "Filters",
//                                       textStyle: TTextStyle.bodySubtitle,
//                                       icon: const Iconify(TIcons.svgFilter,
//                                           size: 26, color: TColors.secondary),
//                                     ),
//                                     const SizedBox(width: TSizes.spaceBtwItems),
//                                     const TRoundedContainer(
//                                       height: 40,
//                                       radius: 9,
//                                       backgroundColor: TColors.secondary,
//                                       text: "Date",
//                                       textStyle: TTextStyle.bodySecondaryTitle,
//                                       icon: Iconify(TIcons.svgEvents,
//                                           size: 24, color: TColors.white),
//                                       icon1: Iconify(TIcons.svgArrowBottom,
//                                           size: 18, color: TColors.white),
//                                     ),
//                                     const SizedBox(width: TSizes.spaceBtwItems),
//                                     const TRoundedContainer(
//                                       height: 40,
//                                       radius: 9,
//                                       backgroundColor: TColors.secondary,
//                                       text: "Category",
//                                       textStyle: TTextStyle.bodySecondaryTitle,
//                                       icon: Iconify(TIcons.svgEvents,
//                                           size: 24, color: TColors.white),
//                                       icon1: Iconify(TIcons.svgArrowBottom,
//                                           size: 18, color: TColors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 /// Main
//                 EventCardBuilder(
//                     onTap: () => Get.to(() => const EventDetailsScreen()),
//                     title: 'Popular Events in Hong Kong',
//                     height: 250,
//                     imgHeight: 150,
//                     imgWidth: 380,
//                     showDate: false,
//                     descTitleStyle: TTextStyle.headlineSmall,
//                     descSubTitleStyle: TTextStyle.bodyTitle,
//                     descSubTitleDate: const [
//                       'February 14th',
//                       'February 21st',
//                       'March 1st',
//                       'March 3rd'
//                     ],
//                     descSubTitleFee: const [
//                       'Free',
//                       'Free',
//                       'From \$15',
//                       '\$5'
//                     ],
//                     descTitle: const [
//                       'Temple Street Night',
//                       'Discovery of Hong Kong',
//                       'Bus Journey in Central',
//                       'Street Life Market'
//                     ],
//                     descSubTitle: const [
//                       '1.1 km',
//                       '10 km',
//                       '2.5 km',
//                       '200 m'
//                     ],
//                     imgList: const [
//                       TImages.hk_event_1,
//                       TImages.hk_event_2,
//                       TImages.hk_event_3,
//                       TImages.hk_event_4,
//                     ]),
//                 const EventCardBuilder(title: 'Upcoming Events', descTitle: [
//                   'Temple Street Night',
//                   'Discovery of Hong Kong',
//                   'Bus Journey in Central',
//                   'Street Life Market'
//                 ], descSubTitle: [
//                   '1.1 km',
//                   '10 km',
//                   '2.5 km',
//                   '200 m'
//                 ], imgList: [
//                   TImages.hk_event_1,
//                   TImages.hk_event_2,
//                   TImages.hk_event_3,
//                   TImages.hk_event_4,
//                 ]),
//                 const EventCardBuilder(title: 'Upcoming Events', descTitle: [
//                   'Temple Street Night',
//                   'Discovery of Hong Kong',
//                   'Bus Journey in Central',
//                   'Street Life Market'
//                 ], descSubTitle: [
//                   '1.1 km',
//                   '10 km',
//                   '2.5 km',
//                   '200 m'
//                 ], imgList: [
//                   TImages.hk_event_1,
//                   TImages.hk_event_2,
//                   TImages.hk_event_3,
//                   TImages.hk_event_4,
//                 ]),
//                 const EventCardBuilder(title: 'Upcoming Events', descTitle: [
//                   'Temple Street Night',
//                   'Discovery of Hong Kong',
//                   'Bus Journey in Central',
//                   'Street Life Market'
//                 ], descSubTitle: [
//                   '1.1 km',
//                   '10 km',
//                   '2.5 km',
//                   '200 m'
//                 ], imgList: [
//                   TImages.hk_event_1,
//                   TImages.hk_event_2,
//                   TImages.hk_event_3,
//                   TImages.hk_event_4,
//                 ]),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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
