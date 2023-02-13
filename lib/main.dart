import 'package:flutter/material.dart';
import 'package:hii_flutter/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SecondScreen(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

double _volume = 0.0;

class _MyHomePageState extends State<MyHomePage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // screen alignment ex.
          // top, bottom, left,right , etc.

          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0), // for top padding
              child: Text(
                'Login',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), //Title Text
            Padding(
              padding: const EdgeInsets.all(20.0), // padding from all side
              // (margin)Left,Right,Top,Bottom,etc.
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelText: 'UserName',
                    labelStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                      // border color when text-field not selected.
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      // set border color
                      // and radius when selected
                      borderSide: BorderSide(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    )),
              ),
            ), // username Text field
            Padding(
              padding: const EdgeInsets.all(20.0), // padding from all side
              // (margin)Left,Right,Top,Bottom,etc.
              child: TextField(
                obscureText: _isObscure,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                  suffixIcon: IconButton(
                      //set password visibility
                      // icon-button
                      onPressed: () {
                        // set password show and hide logic
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                          color: Colors.grey[500],
                          _isObscure //password visibility button icon
                              // change when pressed.
                              ? Icons.visibility
                              : Icons.visibility_off)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                    // border color when text-field not selected.
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    // set border color
                    // and radius when selected
                    borderSide: BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ), // password Text Field
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.login),
              label: const Text("Log in"),
            ), // login button
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Or Sign With',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10',
              onPressed: () {
                setState(() {
                  _volume += 10;
                });
              },
            ), // with volume increment
            Text('Volume : $_volume'), // login with Text
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.login),
        //  child: const Text('Sign Up'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondScreen(),
            ),
          );
        },
      ),
    );
  }
}
