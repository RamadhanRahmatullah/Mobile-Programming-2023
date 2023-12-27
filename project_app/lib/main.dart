import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isAgree = false;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF040720),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16.0),
            PasswordLevel(password: _password),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('I agree with the Privacy Policy'),
              value: _isAgree,
              onChanged: (value) {
                setState(() {
                  _isAgree = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isAgree
                  ? () {
                      // Add your sign-up logic here
                    }
                  : null,
              child: Text('Sign Up Account'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00008B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordLevel extends StatelessWidget {
  final String password;

  PasswordLevel({required this.password});

  @override
  Widget build(BuildContext context) {
    String level = determinePasswordLevel(password);
    Color levelColor = determineLevelColor(level);

    return Text(
      'Password Level: $level',
      style: TextStyle(
        color: levelColor,
      ),
    );
  }

  String determinePasswordLevel(String password) {
    if (password.length >= 6 && password.length < 8) {
      return 'Low';
    } else if (password.length >= 8 &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password)) {
      return 'Fair';
    } else if (password.length >= 8 &&
        RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])').hasMatch(password)) {
      return 'Good';
    } else {
      return 'Low';
    }
  }

  Color determineLevelColor(String level) {
    switch (level) {
      case 'Low':
        return Colors.red;
      case 'Fair':
        return Colors.orange;
      case 'Good':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
