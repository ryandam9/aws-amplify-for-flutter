import 'package:flutter/material.dart';
import 'package:my_amplify_app/providers/auth.dart';
import 'package:my_amplify_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class SessionDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);

    final userName = auth.getCurrentUser();
    final isSignedIn = auth.fetchSession();

    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Australia'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Item('username', userName),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Item('Used Logged In ?', isSignedIn),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Future<String> future;
  final String keyName;
  const Item(this.keyName, this.future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Text('')
              : Text('$keyName ${snapshot.data}'),
    );
  }
}
