import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ProfileWidget(
        NIM: '20111024410444',
        email: '2011102441044@umkt.ac.id',
        name: 'Ramadhan Rahmatullah',
        homeBase: 'Jln Cendana GG 3',
        phoneNumber: '08979557648',
        dateOfBirth: 'December 4, 2002',
      ),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  final String NIM;
  final String email;
  final String name;
  final String homeBase;
  final String phoneNumber;
  final String dateOfBirth;

  ProfileWidget({
    required this.NIM,
    required this.email,
    required this.name,
    required this.homeBase,
    required this.phoneNumber,
    required this.dateOfBirth,
  });

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFF0048BA),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen(profile: widget)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileField(label: 'Name', value: widget.name),
            ProfileField(label: 'Email', value: widget.email),
            ProfileField(label: 'Home Base', value: widget.homeBase),
            ProfileField(label: 'Phone Number', value: widget.phoneNumber),
            ProfileField(label: 'Date of Birth', value: widget.dateOfBirth),
            ProfileField(label: 'NIM', value: widget.NIM),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.nightlight_round, size: 24),
                SizedBox(width: 10),
                Text('Dark Mode'),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                    Theme.of(context).brightness == Brightness.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final ProfileWidget profile;

  EditProfileScreen({required this.profile});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController homeBaseController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController nimController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing values
    nameController.text = widget.profile.name;
    emailController.text = widget.profile.email;
    homeBaseController.text = widget.profile.homeBase;
    phoneNumberController.text = widget.profile.phoneNumber;
    dateOfBirthController.text = widget.profile.dateOfBirth;
    nimController.text = widget.profile.NIM;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF0048BA),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Save the edited profile data
              // You can add your save logic here
              Navigator.pop(context); // Navigate back to the Profile screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: homeBaseController,
              decoration: InputDecoration(labelText: 'Home Base'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dateOfBirthController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
          ],
        ),
      ),
    );
  }
}
