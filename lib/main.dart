import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 242, 248, 254)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //You should use `Scaffold` if you have `TextField` in body.
      //Otherwise on focus your `TextField` won`t scroll when keyboard popup.
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Body Container
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/splashBG.png"),
                              fit: BoxFit.cover)),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 90, bottom: 20),
                      child: Image.asset('assets/images/logo.png', width: 150),
                    )
                  ],
                ),
              ),
            ),

            //Form Container
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  )),
              child: const Text("Sign In",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cutive')),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              color: Colors.white,
              alignment: Alignment.center,
              child: const MyCustomForm(),
            ),
          ],
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              alignment: Alignment.topLeft,
              child: const Text("Email", style: TextStyle(fontSize: 13.0)),
            ),
            Container(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Hello@yahoo.com',
                  fillColor: const Color.fromARGB(255, 243, 249, 255),
                  // fillColor: Colors.deepPurpleAccent,
                ),
                style: const TextStyle(fontSize: 13),
                validator: (val) {
                  if (val == null || val.isEmpty || !val.contains("@")) {
                    return 'Enter a valid eamil';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              alignment: Alignment.topLeft,
              child: const Text("Password", style: TextStyle(fontSize: 13.0)),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  labelText: "Password",
                  fillColor: const Color.fromARGB(255, 243, 249, 255),
                  // fillColor: Colors.deepPurpleAccent,
                ),
                style: const TextStyle(fontSize: 13),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please insert password';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, //<-- SEE HERE
                    minimumSize: const Size.fromHeight(60)),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ]),
    );
  }
}
