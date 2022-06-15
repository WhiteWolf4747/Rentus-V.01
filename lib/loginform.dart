import 'package:flutter/material.dart';
import 'shared/classes.dart';
import 'main.dart';
import 'Services/auth.dart';

class loginform extends StatefulWidget {
  const loginform({Key? key}) : super(key: key);

  @override
  State<loginform> createState() => _loginformState();
}

class _loginformState extends State<loginform> {
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    final _formkey = GlobalKey<FormState>();

    String email = '.';
    String password = '';

    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 80, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Container(
                  width: 90,
                  child: Image(image: AssetImage("assets/logo.png")),
                ),
                SizedBox(
                  height: 10,
                ),
                //title
                Text(
                  "Welcome to Rentus",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                //subtitle
                Text(
                  "You can be anywhere anytime anywhere",
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 110, 110, 110)),
                ),
                SizedBox(
                  height: 28,
                ),
                //form
                //email input
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: textformfielddec.copyWith(
                            label: Text(
                              "Enter email",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 83, 83, 83),
                                  fontSize: 14),
                            ),
                          ),
                          validator: (value) =>
                              (value!.isEmpty && value.length < 10)
                                  ? "Enter valid email"
                                  : null,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: textformfielddec.copyWith(
                            label: Text(
                              "Enter Password",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 83, 83, 83),
                                  fontSize: 14),
                            ),
                          ),
                          validator: (value) =>
                              (value!.isEmpty && value.length < 10)
                                  ? "Enter valid Password"
                                  : null,
                          obscureText: true,
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),

                SizedBox(
                  height: 10,
                ),

                //the signup
                ElevatedButton(
                    style: y,
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        dynamic result02 = await _authService.signUpemail(
                            email, password, "ehie");
                        if (result02 == null) {
                          print("Didnt create account");
                        } else {
                          Navigator.of(context).pop();
                          print("Account created");
                        }
                      } else {}

                      print(email);
                      print(password);
                    },
                    child: Text("Sign up")),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "dont have an account but you can?",
                      style:
                          TextStyle(color: Color.fromARGB(255, 119, 119, 119))),
                  TextSpan(
                      text: " Register here",
                      style: TextStyle(
                          color: primarycolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
