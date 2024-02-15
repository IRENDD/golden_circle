import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/events/event_cards/event_card_horizontal.dart';
import 'package:flutter_application_1/common/widgets/texts/section_heading.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class EventSection extends StatelessWidget {
  const EventSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Column(
        children: [
          const TSectionHeading(
            title: 'Upcoming Events',
            showActionButton: true,
            textColor: TColors.secondary,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            height: 170,
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const SizedBox(width: TSizes.spaceBtwItems * 1.5),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const TEventCardHorizontal(),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
