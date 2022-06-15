import 'package:flutter/material.dart';
import 'package:flutter06/main.dart';
import 'package:provider/provider.dart';
import '../shared/classes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter06/Services/auth.dart';
import 'package:flutter06/loginform.dart';
import 'package:flutter06/shared/styles.dart';

class loginScaffold extends StatefulWidget {
  final toggleview;
  const loginScaffold({Key? key, this.toggleview}) : super(key: key);

  @override
  State<loginScaffold> createState() => _loginScaffoldState();
}

class _loginScaffoldState extends State<loginScaffold> {
  AuthService _authService = AuthService();

  String signinoruptext = "Sign Up";

  String email = '';
  String password = '';
  String username = "";
  bool showusername = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _widthscreen = MediaQuery.of(context).size.width;
    double _heightscreen = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(
      children: [
        //login form

        Container(
          margin: EdgeInsets.fromLTRB(20, 90, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Container(
                width: _widthscreen * 0.22,
                child: Image(image: AssetImage("assets/logo02.png")),
              ),
              SizedBox(
                height: 16,
              ),
              //title
              Text(
                "Welcome to Rentus",
                style: header16,
              ),
              SizedBox(
                height: 10,
              ),
              //subtitle
              Text(
                "Sign in to continue",
                style: header12light,
              ),
              SizedBox(
                height: 32,
              ),
              //form here

              Container(
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        if (showusername) ...[
                          TextFormField(
                            decoration: textformfielddec.copyWith(
                                label: Text(
                                  "Enter Username",
                                  style: header12light,
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: textcolorsecondary,
                                )),
                            validator: (value) =>
                                (value!.isEmpty && value.length < 10)
                                    ? "Enter valid Username"
                                    : null,
                            onChanged: (value) {
                              username = value;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                        TextFormField(
                          decoration: textformfielddec.copyWith(
                              label: Text(
                                "Enter email",
                                style: header12light,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: textcolorsecondary,
                              )),
                          validator: (value) =>
                              (value!.isEmpty && value.length < 10)
                                  ? "Enter valid email"
                                  : null,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: textformfielddec.copyWith(
                              label: Text(
                                "Enter Password",
                                style: header12light,
                              ),
                              prefixIcon: Icon(
                                Icons.password,
                                color: textcolorsecondary,
                              )),
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
              ),

              //the login or signup button
              Container(
                decoration: buttonshadow,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        if (showusername) {
                          dynamic signup = await _authService.signUpemail(
                              email, password, username);
                        }
                        dynamic result =
                            await _authService.signInemail(email, password);
                        if (result == null) {
                          print("Didnt Sign in");
                        }
                      } else {}

                      print(email);
                      print(password);
                    },
                    child: Text(
                      signinoruptext,
                      style: header14.copyWith(color: Colors.white),
                    ),
                    style: y.copyWith(
                        backgroundColor:
                            MaterialStateProperty.all(theprimarycolor))),
              ),
              SizedBox(
                height: 16,
              ),

              //or block
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: linecolor,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text(
                        'OR',
                        style: header14.copyWith(color: textcolorsecondary),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: linecolor,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 14,
              ),
              //google button
              InkWell(
                  onTap: () {
                    final provider = Provider.of<googlesigninprovider>(context,
                        listen: false);
                    provider.googlelogin();
                  },
                  child: socaillogin("assets/google.png", "Login with Google")),
              SizedBox(
                height: 8,
              ),
              socaillogin("assets/facebook.png", "Login with Facebook"),

              SizedBox(
                height: 20,
              ),

              //forgot passowrd
              Text(
                "Forgot password?",
                style: header12bold.copyWith(color: theprimarycolor),
              ),
              SizedBox(
                height: 14,
              ),
              if (showusername == false) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account?",
                      style: header12light,
                    ),
                    TextButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            dynamic result = await _authService.signUpemail(
                                email, password, username);
                            if (result == null) {
                              print("Didnt create account");
                            }
                          } else {}

                          setState(() {
                            showusername = true;
                            signinoruptext = "Sign Up";
                          });

                          print(email);
                          print(password);
                        },
                        child: Text(
                          "Register Here",
                          style: header12bold.copyWith(color: theprimarycolor),
                        )),
                  ],
                )
              ] else ...[
                InkWell(
                  onTap: () {
                    setState(() {
                      showusername = false;
                      signinoruptext = "Login";
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I do have an account?",
                        style: header12light,
                      ),
                      Text(
                        "  Login Here",
                        style: header12bold.copyWith(color: theprimarycolor),
                      ),
                    ],
                  ),
                )
              ],
              SizedBox(
                height: 24,
              )

              //googel buttons
            ],
          ),
        ),

        //new form
      ],
    ));
  }
}

class socaillogin extends StatelessWidget {
  String iconurl;
  String logintext;
  socaillogin(this.iconurl, this.logintext);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: linecolor, width: 1.7),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Row(
        children: [
          Image.asset(
            iconurl,
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
            child: Text(logintext,
                style: header14.copyWith(color: textcolorsecondary),
                textAlign: TextAlign.end),
          )
        ],
      ),
    );
  }
}


/*
ElevatedButton(
                  style: y.copyWith(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic result = await _authService.signUpemail(
                          email, password, username);
                      if (result == null) {
                        print("Didnt create account");
                      }
                    } else {}

                    print(email);
                    print(password);
                  },
                  child: Text("Sign up",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),


class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "poppins",
          scaffoldBackgroundColor: Color.fromARGB(255, 233, 233, 233)),
      home: Scaffold(
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
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 28,
                ),
                //email input
                textfieldinput(Icons.email, "Enter something here"),
                SizedBox(
                  height: 10,
                ),
                textfieldinput(Icons.password, "Enter password"),
                SizedBox(
                  height: 10,
                ),
                //the login button
                buttonWide(55, "Login", statefullhome()),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "or",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                //googel buttons
                btnWideIcon(Icons.facebook, "Sign In with Google"),
                SizedBox(
                  height: 20,
                ),
                btnWideIcon(Icons.facebook, "Sign In with Facebook"),
                SizedBox(
                  height: 28,
                ),
                //forgot passowrd
                Text(
                  "Forgot password?",
                  style: TextStyle(
                      color: primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
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
      )),
    );
  }
}

*/

/*
//email input
                textfieldinput(Icons.email, "Enter something here"),
                SizedBox(
                  height: 10,
                ),
                textfieldinput(Icons.password, "Enter password"),
                SizedBox(
                  height: 10,
                ),


ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          dynamic result =
                              await _authService.signUpemail(email, password);
                          if (result == null) {
                            print("Didnt create account");
                          }
                        } else {}

                        print(email);
                        print(password);
                      },
                      child: Text("Sign up")),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          dynamic result =
                              await _authService.signInemail(email, password);
                          if (result == null) {
                            print("Didnt Sign in");
                          }
                        } else {}

                        print(email);
                        print(password);
                      },
                      child: Text('Sign in'))

                      Container(
          padding: EdgeInsets.all(20),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: x,
                    validator: (value) => (value!.isEmpty && value.length < 10)
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
                    decoration: x,
                    validator: (value) => (value!.isEmpty && value.length < 10)
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
        ),

*/ 