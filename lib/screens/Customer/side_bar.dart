import 'package:eat_easy/screens/onboarding/login_screen.dart';
import 'package:eat_easy/screens/onboarding/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:eat_easy/stores/user_store.dart';

import 'user_profile_screen.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, ProfileScreen.id);
            },
            child: UserAccountsDrawerHeader(
              accountName: Text(
                UserStore().currUser['name']==null?'User':UserStore().currUser['name'],
                textScaleFactor: 1.5,
              ),
              accountEmail: UserStore().currUser['email']==null?'':UserStore().currUser['email'],
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://source.unsplash.com/50x50/?portrait',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Your History'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('Donate'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.popAndPushNamed(context, SplashScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
