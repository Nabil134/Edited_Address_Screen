import 'package:edit_address_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.home, 'text': 'Home'},
    {'icon': Icons.business, 'text': 'Business'},
    {'icon': Icons.school, 'text': 'School'},
  ];

  final ListController listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Add your back button action here
          },
        ),
        centerTitle: true,
        title: Text(
          'Edit Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              CustomTextField(
                hintText: '1234 Elm Street',
                prefixIconPath: 'assets/images/location.svg',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Springfield',
                prefixIconPath: 'assets/images/location.svg',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'IL',
                prefixIconPath: 'assets/images/location.svg',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: '627054',
                prefixIconPath: 'assets/images/location.svg',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'USA',
                prefixIconPath: 'assets/images/location.svg',
              ),
              const SizedBox(height: 10),
              Text(
                'Address Label',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: Obx(
                      () {
                    return ListView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isSelected = listController.selectedIndex.value == index;
                        return GestureDetector(
                          onTap: () {
                            listController.updateIndex(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: isSelected ? Colors.green : Colors.grey),
                              color: isSelected ? Colors.green[50] : Colors.white,
                            ),
                            child: Column(
                              children: [
                                Icon(items[index]['icon'], color: isSelected ? Colors.green : Colors.grey),
                                const SizedBox(height: 2),
                                Text(
                                  items[index]['text'],
                                  style: TextStyle(
                                    color: isSelected ? Colors.green : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String prefixIconPath;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(prefixIconPath),
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
