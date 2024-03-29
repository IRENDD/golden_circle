import 'package:flutter/material.dart';
import 'package:golden_circle/backend/schema/index.dart';
import 'package:golden_circle/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:golden_circle/features/location/screens/event_create/event_create.dart';
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
      QuerySnapshot querySnapshot_Social =
          await collection.where('eventID', isEqualTo: 'social').get();

      // Create a List<String> to store event details
      List<String> socialEventNameList = [];
      List<String> socialEventDetailList = [];
      List<LatLng?> socialEventLocationList = [];
      List<int> socialEventParticipationListi = [];

      // Loop through the documents and populate the eventDetailsList
      querySnapshot_Social.docs.forEach((doc) {
        EventsCollectionRecord record =
            EventsCollectionRecord.fromSnapshot(doc);

        // Add event details to the list
        socialEventNameList.add(record.eventName);
        socialEventDetailList.add(record.eventDetails);
        socialEventLocationList.add(record.location);
        socialEventParticipationListi.add(record.participants);
      });

      List<String> socialEventParticipationList = socialEventParticipationListi
          .map((int number) => number.toString())
          .toList();

      // Create EventCardBuilder using the eventDetailsList
      EventCardBuilder eventSocialCardBuilder = EventCardBuilder(
        showDate: false,
        descSubTitle: const ['1.1 km', '250 m', '2 km', '3.4 km'],
        descTitle: [
          'Temple Street Night',
          'Wisdom Circle Discussion',
          'Senior Social Mixer',
          'Nostalgic Nights Dinner Club'
        ],
        descSubTitleDate: [
          '25th February',
          '27th February',
          '2nd March',
          '7th March'
        ],
        // descTitle: socialEventNameList,
        // descSubTitleDate: socialEventParticipationList,
        height: 250,
        imgHeight: 150,
        imgWidth: 380,
        descTitleStyle: TTextStyle.headlineSmall,
        descSubTitleStyle: TTextStyle.bodyTitle,
        onTap: [
          () => Get.to(() => const EventDetailsScreen()),
          () => Get.to(() => const EventDetailsScreen()),
          () => Get.to(() => const EventDetailsScreen()),
          () => Get.to(() => const EventDetailsScreen()),
        ],

        descSubTitleFee: const ['Free', 'Free', 'From \$15', 'From \$35'],

        title: "Social Events: Meet new people",
        imgList: const [
          TImages.hk_event_1,
          TImages.social_event,
          TImages.social_event_2,
          TImages.social_event_3,
        ],
      );

      QuerySnapshot querySnapshot_Active =
          await collection.where('eventID', isEqualTo: 'active').get();

      // Create a List<String> to store event details
      List<String> activeEventNameList = [];
      List<String> activeEventDetailList = [];
      List<LatLng?> activeEventLocationList = [];
      List<int> activeEventParticipationListi = [];

      // Loop through the documents and populate the eventDetailsList
      querySnapshot_Active.docs.forEach((doc) {
        EventsCollectionRecord record =
            EventsCollectionRecord.fromSnapshot(doc);

        // Add event details to the list
        activeEventNameList.add(record.eventName);
        activeEventDetailList.add(record.eventDetails);
        activeEventLocationList.add(record.location);
        activeEventParticipationListi.add(record.participants);
      });

      List<String> activeEventParticipationList = activeEventParticipationListi
          .map((int number) => number.toString())
          .toList();

      // Create EventCardBuilder using the eventDetailsList
      EventCardBuilder eventActiveCardBuilder1 = EventCardBuilder(
          title: 'Because you liked Modern Proes',
          descTitle: [
            'Golden Memories Book Club',
            'Reflections Art Exhibit',
            'Tranquil Tea Tasting',
            'Classic Cinema Nights'
          ],
          showDate: true,
          descSubTitleDate: ['26th Feb', '1st Mar', '5th Mar', '9th Mar'],
          descSubTitle: ['5.6 km', '1.7 km', '500 m', '7.5 km'],
          imgList: [
            TImages.book_event,
            TImages.exhibit_event,
            TImages.tea_event,
            TImages.movie_event,
          ]);

      // Create EventCardBuilder using the eventDetailsList
      const EventCardBuilder eventActiveCardBuilder2 = EventCardBuilder(
          title: 'Historical Seminars',
          descTitle: [
            'Rome\'s Legacy: A Symposium on Ancient Influences',
            'Innovations of the Han: The Foundations of Chinese Science and Technology',
            'The Carolingian Renaissance: A New Dawn in Medieval Europe',
            'Byzantium and Beyond: The Roman Empire\'s Second Life'
          ],
          showDate: true,
          descSubTitleDate: ['1st Mar', '15th Mar', '28th Mar', '2nd Apr'],
          descSubTitle: ['1.3 km', '6.5 km', '5.0 km', '7.7 km'],
          imgList: [
            TImages.roman_event,
            TImages.han_event,
            TImages.carolongian_event,
            TImages.byzantium_event,
          ]);

      const EventCardBuilder eventActiveCardBuilder3 = EventCardBuilder(
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
          ]);

      // Display the retrieved event cards
      setState(() {
        eventCardsList = [
          eventSocialCardBuilder,
          eventActiveCardBuilder1,
          eventActiveCardBuilder2,
          eventActiveCardBuilder3
        ];
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
      QuerySnapshot querySnapshot =
          await collection.where('eventID', isEqualTo: 'active').get();

      // Create a List<String> to store event details
      List<String> eventDetailsList = [];

      // Loop through the documents and populate the eventDetailsList
      querySnapshot.docs.forEach((doc) {
        EventsCollectionRecord record =
            EventsCollectionRecord.fromSnapshot(doc);

        // Add event details to the list
        eventDetailsList.add(record.eventDetails);
        // ... (you can add other fields to other lists if needed)
      });

      // Create EventCardBuilder using the eventDetailsList
      EventCardBuilder eventCardBuilder = EventCardBuilder(
        descTitle: eventDetailsList,
        descSubTitle: eventDetailsList,
        title: "Social Events: Meet and conversate with new people",
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
      body: Stack(
        children: [
          CustomScrollView(
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
                                bottomLeft:
                                    Radius.circular(TSizes.borderRadiusLg),
                                bottomRight:
                                    Radius.circular(TSizes.borderRadiusLg),
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
                                          backgroundColor:
                                              TColors.buttonPrimary,
                                          text: "Filters",
                                          textStyle: TTextStyle.bodySubtitle,
                                          icon: const Iconify(TIcons.svgFilter,
                                              size: 26,
                                              color: TColors.secondary),
                                        ),
                                        const SizedBox(
                                            width: TSizes.spaceBtwItems),
                                        const TRoundedContainer(
                                          height: 40,
                                          radius: 9,
                                          backgroundColor: TColors.secondary,
                                          text: "Date",
                                          textStyle:
                                              TTextStyle.bodySecondaryTitle,
                                          icon: Iconify(TIcons.svgEvents,
                                              size: 24, color: TColors.white),
                                          icon1: Iconify(TIcons.svgArrowBottom,
                                              size: 18, color: TColors.white),
                                        ),
                                        const SizedBox(
                                            width: TSizes.spaceBtwItems),
                                        const TRoundedContainer(
                                          height: 40,
                                          radius: 9,
                                          backgroundColor: TColors.secondary,
                                          text: "Category",
                                          textStyle:
                                              TTextStyle.bodySecondaryTitle,
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
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              child: ElevatedButton(
                onPressed: () => Get.to(() => const EventCreateScreen()),
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Color.fromARGB(255, 209, 169, 23),
                  onPrimary: TColors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Iconify(TIcons.svgAdd, size: 23, color: TColors.white),
                      SizedBox(width: 9),
                      Text(
                        'Create Event',
                        style: TTextStyle.secondaryLargeButton,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
