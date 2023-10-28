import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({super.key, required this.setIndex});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final User user = FirebaseAuth.instance.currentUser!;

  // Sign Out Method for Google Account
  void signOutGoogle() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  // Sign Out Method for Password-based Authentication
  void signOutPassword() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade300,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    user.photoURL != null ? NetworkImage(user.photoURL!) : null,
                child: user.photoURL == null
                    ? const Icon(Icons.person, size: 40)
                    : null,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                user.email!,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Add some spacing

              if (user.displayName != null && user.displayName!.isNotEmpty)
                Text(
                  'Hi  ' + user.displayName!,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Divider(
                  thickness: 2,
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawerList(Icons.home, 'Home', 0),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedButton(
                    width: 100,
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "LogOut",
                        desc: "Are You Sure Log Out",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          if (user.providerData[0].providerId == 'google.com') {
                            signOutGoogle();
                          } else {
                            signOutPassword();
                          }
                        },
                      ).show();
                    },
                    text: "Logout",
                    color: Colors.blue.shade800,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget drawerList(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        ZoomDrawer.of(context)!.close();
        widget.setIndex(index);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          bottom: 30,
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
