import 'package:flutter/material.dart';
import 'package:getx_example/controllers/counterController.dart';
import 'package:get/get.dart';
import 'package:getx_example/screens/other.dart';

class HomeScreen extends StatelessWidget {
  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text("Clciks: ${_counterController.counter.value}")),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(OtherScreen());
                    },
                    child: const Text("Open Other Screen")),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
