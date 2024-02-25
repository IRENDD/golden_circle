import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Color(0xFF6B555A) , fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/1.png'),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: const Icon(Icons.edit,
                            size: 18.0, color: Colors.black)),
                  ),
                ]),
                const SizedBox(height: 50),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            prefixIcon: const Icon(Icons.person,
                                color: Color.fromARGB(255, 245, 178, 21)),
                            hintText: "Enter your new name",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 245, 178, 21)),
                            filled: true,
                            fillColor: Colors.yellow[50],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            prefixIcon: const Icon(Icons.email,
                                color: Color.fromARGB(255, 245, 178, 21)),
                            hintText: "Enter your new email",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 245, 178, 21)),
                            filled: true,
                            fillColor: Colors.yellow[50],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            prefixIcon: const Icon(Icons.phone,
                                color: Color.fromARGB(255, 245, 178, 21)),
                            hintText: "Enter your new number",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 245, 178, 21)),
                            filled: true,
                            fillColor: Colors.yellow[50],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            prefixIcon: const Icon(Icons.fingerprint,
                                color: Color.fromARGB(255, 245, 178, 21)),
                            hintText: "Enter your new password",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 245, 178, 21)),
                            filled: true,
                            fillColor: Colors.yellow[50],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const UpdateProfileScreen()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text('Save',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
