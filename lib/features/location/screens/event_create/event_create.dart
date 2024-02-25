import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_circle/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:golden_circle/flutter_flow/flutter_flow_util.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/icon_svg.dart';
import 'package:golden_circle/utils/constants/sizes.dart';
import 'package:golden_circle/utils/constants/texts_style.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:flutter/cupertino.dart';

class EventCreateScreen extends StatefulWidget {
  const EventCreateScreen({super.key});

  @override
  State<EventCreateScreen> createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime =
      TimeOfDay(hour: TimeOfDay.now().hour + 2, minute: TimeOfDay.now().minute);

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm').format(dateTime);
  }

  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            initialDateTime: selectedDate,
            onDateTimeChanged: (DateTime newDate) {
              if (newDate != selectedDate) {
                setState(() {
                  selectedDate = newDate;
                });
              }
            },
            mode: CupertinoDatePickerMode.date,
          ),
        );
      },
    );
  }

  void _showStartTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedStartTime.hour,
              selectedStartTime.minute,
            ),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                selectedStartTime = TimeOfDay.fromDateTime(newDateTime);
              });
            },
          ),
        );
      },
    );
  }

  // Method to show the time picker for end time
  void _showEndTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedEndTime.hour,
              selectedEndTime.minute,
            ),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                selectedEndTime = TimeOfDay.fromDateTime(newDateTime);
              });
            },
          ),
        );
      },
    );
  }

  // Method to calculate the duration between start and end time
  String calculateDuration() {
    final startTimeInMinutes =
        selectedStartTime.hour * 60 + selectedStartTime.minute;
    final endTimeInMinutes = selectedEndTime.hour * 60 + selectedEndTime.minute;
    final durationInMinutes = endTimeInMinutes - startTimeInMinutes;

    if (durationInMinutes < 0) {
      // Handle case where end time is on the next day
      return "Invalid Time Range";
    } else {
      final hours = durationInMinutes ~/ 60;
      final minutes = durationInMinutes % 60;
      return 'Duration: ${hours}h ${minutes}m';
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
                expandedHeight: 90,
                backgroundColor: TColors.white,
                leading: IconButton(
                    icon: const Iconify(TIcons.svgCross,
                        size: 22, color: TColors.secondary),
                    onPressed: () => Get.back()),
                title: Text('Create Event', style: TTextStyle.headlineMedium),
                centerTitle: true,
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
                                      blurRadius: 10,
                                      color: TColors.black.withOpacity(0.35))
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
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Event Information',
                              style: TTextStyle.headlineLarge),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TColors.buttonSecondary,
                              hintText: 'Event Name',
                              hintStyle: TTextStyle.bodySubtitle2,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.borderPrimary3, width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.secondary.withOpacity(0.7),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TColors.buttonSecondary,
                              hintText: 'Event Category',
                              hintStyle: TTextStyle.bodySubtitle2,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.borderPrimary3, width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.secondary.withOpacity(0.7),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                              suffixIcon: IconButton(
                                  icon: Iconify(TIcons.svgArrowRight,
                                      size: 17,
                                      color:
                                          TColors.secondary.withOpacity(0.7)),
                                  onPressed: () {}),
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TColors.buttonSecondary,
                              hintText: 'Event Address',
                              hintStyle: TTextStyle.bodySubtitle2,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.borderPrimary3, width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.secondary.withOpacity(0.7),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                              suffixIcon: IconButton(
                                  icon: Iconify(TIcons.svgLocateMe,
                                      size: 22,
                                      color:
                                          TColors.secondary.withOpacity(0.7)),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Event Date', style: TTextStyle.headlineLarge),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: TColors.buttonSecondary,
                              borderRadius:
                                  BorderRadius.circular(TSizes.borderRadiusSm),
                              border: Border.all(
                                color: TColors.borderPrimary3,
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 5, left: 25, right: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Iconify(TIcons.svgCalendar,
                                              size: 22,
                                              color: TColors.secondary
                                                  .withOpacity(0.7)),
                                          const SizedBox(width: 8),
                                          Text('Date',
                                              style: TTextStyle.bodySubtitle2),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Iconify(TIcons.svgClock,
                                              size: 22,
                                              color: TColors.secondary
                                                  .withOpacity(0.7)),
                                          const SizedBox(width: 8),
                                          Text('Time',
                                              style: TTextStyle.bodySubtitle2),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                    thickness: 2.0,
                                    color: TColors.borderPrimary3),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => _showDatePicker(context),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              DateFormat('d MMM, yyyy')
                                                  .format(selectedDate),
                                              style: TTextStyle.bodySubtitle,
                                            ),
                                            Text(
                                              DateFormat('EEEE')
                                                  .format(selectedDate),
                                              style: TTextStyle.bodySubtitle2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    _showStartTimePicker(
                                                        context),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      formatTimeOfDay(
                                                          selectedStartTime),
                                                      style: TTextStyle
                                                          .bodySubtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                '-',
                                                style: TTextStyle.bodySubtitle,
                                              ),
                                              GestureDetector(
                                                onTap: () =>
                                                    _showEndTimePicker(context),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      formatTimeOfDay(
                                                          selectedEndTime),
                                                      style: TTextStyle
                                                          .bodySubtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            calculateDuration(),
                                            style: TTextStyle.bodySubtitle2,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                    thickness: 2,
                                    color: TColors.borderPrimary3),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25, top: 5, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Iconify(TIcons.svgGlobe,
                                              size: 22,
                                              color: TColors.secondary
                                                  .withOpacity(0.7)),
                                          const SizedBox(width: 8),
                                          Text('Time Zone',
                                              style: TTextStyle.bodySubtitle2),
                                        ],
                                      ),
                                      Iconify(TIcons.svgArrowRight,
                                          size: 17,
                                          color: TColors.secondary
                                              .withOpacity(0.7)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Event Description',
                              style: TTextStyle.headlineLarge),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TextField(
                            maxLines: 8,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TColors.buttonSecondary,
                              hintText: 'Add event description here...',
                              hintStyle: TTextStyle.bodySubtitle2,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.borderPrimary3, width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColors.secondary.withOpacity(0.7),
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusSm),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 10,
            left: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                primary: Color.fromARGB(255, 209, 169, 23),
                onPrimary: TColors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16), // horizontal padding for the content
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // This will shrink the row's width to its children width
                  children: [
                    SizedBox(width: 9),
                    Text(
                      'Add',
                      style: TTextStyle.secondaryLargeButton,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
