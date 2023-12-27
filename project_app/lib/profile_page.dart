import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color(0xFF040720),
      ),
      body: Center(
        child: Text('Welcome to your profile!'),
      ),
    );
  }
}
