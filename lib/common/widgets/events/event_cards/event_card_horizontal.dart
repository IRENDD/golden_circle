import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/image_string.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class TEventCardHorizontal extends StatelessWidget {
  const TEventCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: Colors.white,
        border: Border.all(
            color: TColors.borderPrimary.withOpacity(0.45), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: TColors.borderPrimary.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Thumbnail Image with Date
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(TSizes.productImageRadius),
                  topRight: Radius.circular(TSizes.productImageRadius),
                ),
                child: Image.asset(TImages.hk_event_1,
                    width: 200, height: 100, fit: BoxFit.cover),
              ),

              /// -- Text of Date
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(TSizes.productImageRadius),
                        topRight: Radius.circular(TSizes.productImageRadius)),
                  ),
                  child: const Text(
                    'Today',
                    style: TextStyle(
                        color: TColors.secondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),

          /// -- Text Details
          const Padding(
            padding: EdgeInsets.all(TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temple Street Night',
                  style: TextStyle(
                      color: TColors.secondary, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '1.1 km',
                  style: TextStyle(color: TColors.textGrey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
