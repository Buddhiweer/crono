import 'package:flutter/material.dart';
import '../drawer/drawer_widget.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: DrawerWidget(),
        title: Text('Account Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
                // child: AnimatedButton(
                //   width: 120,
                //   pressEvent: () {},
                //   text: "Logout",
                //   color: Colors.green,
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
