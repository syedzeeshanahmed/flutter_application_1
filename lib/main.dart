import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            //Header Container
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text("Header"),
            ),

            //Body Container
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: const Text("Sign In",
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cutive')),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const MyCustomForm(),
                    )
                  ],
                ),
              ),
            ),

            //Footer Container
            //Here you will get unexpected behaviour when keyboard pops-up.
            //So its better to use `bottomNavigationBar` to avoid this.
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text("Footer"),
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
              padding: const EdgeInsets.only(bottom: 0, left: 10),
              alignment: Alignment.topLeft,
              child: const Text("Enter your Email",
                  style: TextStyle(fontSize: 14.0)),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Email'),
                validator: (val) {
                  if (val == null || val.isEmpty || !val.contains("@")) {
                    return 'Enter a valid eamil';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 0, left: 10),
              alignment: Alignment.topLeft,
              child: const Text("Enter your password",
                  style: TextStyle(fontSize: 14.0)),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please insert password';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: ElevatedButton(
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
