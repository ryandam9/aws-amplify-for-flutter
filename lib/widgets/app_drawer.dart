import 'package:flutter/material.dart';
import 'package:my_amplify_app/providers/auth.dart';
import 'package:my_amplify_app/screens/home_page.dart';
import 'package:my_amplify_app/screens/login_screen.dart';
import 'package:my_amplify_app/screens/session_details.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text('Photos'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => HomePage(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Show Session Details'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SessionDetailsScreen(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                // Signout the user
                await auth.signOut();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => AuthScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
