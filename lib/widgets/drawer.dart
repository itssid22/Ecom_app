import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.lightBlue,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  // decoration:
                  // BoxDecoration(color: Color.fromARGB(255, 60, 182, 238)),
                  accountName: Text("siddhant"),
                  accountEmail: Text("sid22khot@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    // backgroundImage:
                    backgroundImage: AssetImage("assets/siddhant.jpg"),
                  ),
                )),
            ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white),
                title: Text("home",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            ListTile(
                leading:
                    Icon(CupertinoIcons.profile_circled, color: Colors.white),
                title: Text("profile",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            ListTile(
                leading: Icon(CupertinoIcons.mail_solid, color: Colors.white),
                title: Text("Mail",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}
