import 'package:flutter/material.dart';
import 'package:golden_circle/common/widgets/events/event_cards/event_card_horizontal.dart';
import 'package:golden_circle/common/widgets/texts/section_heading.dart';
import 'package:golden_circle/utils/constants/colors.dart';
import 'package:golden_circle/utils/constants/sizes.dart';

class EventCardBuilder extends StatelessWidget {
  const EventCardBuilder({
    super.key,
    required this.imgList,
    required this.title,
    required this.descTitle,
    required this.descSubTitle,
    this.onTap,
    this.descTitleStyle,
    this.descSubTitleStyle,
    this.descSubTitleDate,
    this.descSubTitleFee,
    this.showDate = true,
    this.height = 170,
    this.imgHeight = 100,
    this.imgWidth = 200,
  });

  final double height;
  final double imgHeight, imgWidth;
  final bool showDate;
  final String title;
  final List<String> imgList;
  final List<String> descTitle, descSubTitle;
  final List<String>? descSubTitleDate, descSubTitleFee;
  final TextStyle? descTitleStyle, descSubTitleStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Column(
        children: [
          TSectionHeading(
            title: title,
            showActionButton: true,
            textColor: TColors.secondary,
          ),
          const SizedBox(height: TSizes.sm),
          SizedBox(
            height: height,
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const SizedBox(width: TSizes.spaceBtwItems * 1.5),
              itemCount: imgList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TEventCardHorizontal(
                image: imgList[index],
                title: descTitle[index],
                subtitle: descSubTitle[index],
                titleStyle: descTitleStyle,
                subtitleStyle: descSubTitleStyle,
                showTextDate: showDate,
                width: imgWidth,
                imageHeight: imgHeight,
                subtitleDate: descSubTitleDate?[index],
                subtitleFee: descSubTitleFee?[index],
                onPressed: onTap,
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems * 1.5),
        ],
      ),
    );
  }
}
