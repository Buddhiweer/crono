import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../drawer/drawer_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User user = FirebaseAuth.instance.currentUser!;

  // // Sign Out Method for Google Account
  // void signOutGoogle() async {
  //   await GoogleSignIn().disconnect();
  //   FirebaseAuth.instance.signOut();
  // }

  // // Sign Out Method for Password-based Authentication
  // void signOutPassword() async {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Crono',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        toolbarHeight: 50.0,
        leading: DrawerWidget(),
        // actions: [
        //   // IconButton(
        //   //   onPressed: () {},
        //   //   icon: const Icon(
        //   //     Icons.filter_list,
        //   //     color: Colors.black,
        //   //   ),
        //   // ),
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add,
      //     size: 40,
      //   ),
      //   backgroundColor: Colors.grey.shade300,
      //   foregroundColor: Colors.black,
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   notchMargin: 8.0,
      //   shape: CircularNotchedRectangle(),
      //   color: Colors.grey.shade300,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(
      //               Icons.home,
      //               color: Colors.black,
      //             ),
      //             Text(
      //               "Home",
      //               style: TextStyle(color: Colors.black),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(right: 40.0, top: 10.0, bottom: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(
      //               Icons.favorite,
      //               color: Colors.black,
      //             ),
      //             Text(
      //               "Favorite",
      //               style: TextStyle(color: Colors.black),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(
      //               Icons.chat_bubble,
      //               color: Colors.black,
      //             ),
      //             Text(
      //               "Chat",
      //               style: TextStyle(color: Colors.black),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(
      //               Icons.place,
      //               color: Colors.black,
      //             ),
      //             Text(
      //               "Map",
      //               style: TextStyle(color: Colors.black),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
