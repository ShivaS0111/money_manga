import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manga/config/resource_constants.dart';
import 'package:money_manga/ui/widgets/common/shqs_buttons.dart';

class DashboardPage extends StatelessWidget {

  static final name = 'dashboard';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _dashboardAppBar(),
      body: ElevatedButton(
        onPressed: () {

        },
        child: Text('Customer education module'),
      ),
    );
  }

  PreferredSizeWidget _dashboardAppBar() {

    return AppBar(
      toolbarHeight: 100,
      title: Row(
        children: [
          Image(image: ShqsIcons.fridge, width: 80, height: 80,),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: InkWell(
                  onTap: () {
                    // Back button is there..
                    // Does SmartHQ Service app need model switch button?
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${Get.arguments['model_number']}'.toUpperCase()),
                      Text('${Get.arguments['serial_number']}'.toUpperCase()),
                    ],
                  ),
                ),
              )
          ),
          ShqsCommonButton(
            text: 'Note',
            isServiceMode: true,
            size: Size(100, 40),
            onTap: () {

            },
          )
        ],
      ),
    );
  }
}