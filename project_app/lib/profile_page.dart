import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String name;

  ProfilePage({required this.name});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String bio = "This is my bio. Edit me!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color(0xFFFF00FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Friends'),
                SizedBox(width: 16),
                Text('Photos'),
                SizedBox(width: 16),
                Text('Comments'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              bio,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _editBio(context);
              },
              child: Text('Edit Bio'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _editBio(BuildContext context) async {
    TextEditingController bioController = TextEditingController();
    bioController.text = bio;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Bio'),
          content: TextField(
            controller: bioController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter your bio here',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bio = bioController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
