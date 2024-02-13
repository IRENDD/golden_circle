import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Half of the screen with curved edges
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height /
                  2, // Half of the screen height
              child: TCurvedEdgeWidget(
                child: Container(
                  color: TColors.primary,
                ),
              ),
            ),
            // Second half of the screen
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height /
                  2, // Half of the screen height
              color: Colors.white, // Adjust as needed
              // Add your content here
              child: Column(
                children: [
                  // Add your content here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
