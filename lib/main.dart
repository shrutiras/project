import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enter the details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textController1,
                decoration: InputDecoration(
                  labelText: 'Name',
                  fillColor: Colors.pinkAccent,
                ),
              ),
              TextField(
                controller: _textController2,
                decoration: InputDecoration(
                    labelText: 'Email', fillColor: Colors.pinkAccent),
              ),
              TextField(
                controller: _textController3,
                decoration: InputDecoration(
                  labelText: 'Roll Number',
                  fillColor: Colors.pinkAccent,
                ),
              ),
              TextField(
                controller: _textController4,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  fillColor: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String userInput1 = _textController1.text;
                  String userInput2 = _textController2.text;
                  String userInput3 = _textController3.text;
                  String userInput4 = _textController4.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayPage(
                        userInput1: userInput1,
                        userInput2: userInput2,
                        userInput3: userInput3,
                        userInput4: userInput4,
                        userInput: '',
                      ),
                    ),
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayPage extends StatelessWidget {
  final String userInput1;
  final String userInput2;
  final String userInput3;
  final String userInput4;

  const DisplayPage(
      {Key? key,
      required this.userInput1,
      required this.userInput2,
      required this.userInput3,
      required this.userInput4,
      required String userInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent),
            ),
            SizedBox(height: 10),
            Text(
              userInput1,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent),
            ),
            SizedBox(height: 10),
            Text(
              userInput2,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Roll Number',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent),
            ),
            SizedBox(height: 10),
            Text(
              userInput3,
              style: TextStyle(fontSize: 18),
            ),
            // ignore: prefer_const_constructors
            Text(
              'Phone Number',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent),
            ),
            SizedBox(height: 10),
            Text(
              userInput4,
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                MaterialPageRoute(
                  builder: (context) => InputPage(),
                );
                _showSnackBar(context, 'User $userInput1 Logged Out');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
