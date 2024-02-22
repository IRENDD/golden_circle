import 'package:flutter/material.dart';
import 'package:jazz/utils/constants/image_string.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF987654),
          iconSize: 40,
          onPressed: () {},
        ),
        title: const Text('Upcoming Events',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF987654),
            )),
        centerTitle: true,
        toolbarHeight: 110,
        elevation: 12,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: const Color(0xFF987654),
            iconSize: 40,
            onPressed: () {},
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 15),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(width: 5),
                      Text(
                        'Filters',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF987654)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 15),
                  width: 165,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 5),
                      Text(
                        'This weekend',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF987654),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 15),
                  width: 95,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 5),
                      Text(
                        'Sports',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF987654),
                        ),
                      ),
                      Icon(Icons.close),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 15),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 5),
                      Text(
                        'Dance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF987654),
                        ),
                      ),
                      Icon(Icons.close),
                      //
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //Body part of the screen

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 11),
                width: 400,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Image(image: AssetImage(TImages.hk_event_1)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 11),
                width: 400,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Image(image: AssetImage(TImages.hk_event_1)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 11),
                width: 400,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Image(image: AssetImage(TImages.hk_event_1)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 11),
                width: 400,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Image(image: AssetImage(TImages.hk_event_1)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 11),
                width: 400,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Image(image: AssetImage(TImages.hk_event_1)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 11),
                width: 400,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 20,
                  child: Image(image: AssetImage(TImages.hk_event_1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
