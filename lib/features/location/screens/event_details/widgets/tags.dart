import 'package:flutter/material.dart';
import 'package:jazz/common/widgets/custom_shapes/containers/circular_container.dart';

class TTags extends StatelessWidget {
  const TTags({super.key, required this.tagNames});

  final List<String> tagNames;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < tagNames.length; i++)
          TCircularContainer(
            width: 95,
            height: 22,
            radius: 10,
            margin: const EdgeInsets.only(right: 10),
            backgroundColor: const Color.fromRGBO(157, 231, 139, 80),
            borderColor: const Color.fromRGBO(157, 231, 139, 80),
            text: tagNames[i],
          )
      ],
    );
  }
}
