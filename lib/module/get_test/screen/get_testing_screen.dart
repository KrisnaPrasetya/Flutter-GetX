import 'package:flutter/material.dart';
import 'package:flutter_getx/module/get_test/controller/get_testing_controller.dart';
import 'package:get/get.dart';

class GetTestingScreen extends StatelessWidget {
  const GetTestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetTestingController>(
      init: GetTestingController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Homepage Menu'),
          ),
          body: Column(
            children: [
              
            ],
          ),
        );
      },
    );
  }
}
