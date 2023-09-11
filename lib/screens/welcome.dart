import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOŞGELDİN'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HOŞGELDİN',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            if (user != null)
              Text(
                '${user.email}',
                style: TextStyle(fontSize: 18.0),
              ),
          ],
        ),
      ),
    );
  }
}
