import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String firstName = 'First Name to be displayed';
  String lastName = 'Last Name to be displayed';
  String email = 'Email to be displayed';

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textfields in Flutter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                  keyboardType: TextInputType.name,
                  controller: firstNameController,
                  hint: 'Enter Your First Name',
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextField(
                  keyboardType: TextInputType.name,
                  controller: lastNameController,
                  hint: 'Enter Your Last Name',
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hint: 'Enter Your Email',
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      firstName = firstNameController.text;
                      lastName = lastNameController.text;
                      email = emailController.text;
                    });
                  },
                  child: const Text('Submit'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'The value entered is...\n $firstName\n $lastName\n $email',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
          width: 3,
        )),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(),
        labelText: hint,
        labelStyle: TextStyle(color: Colors.green),
      ),
    );
  }
}
