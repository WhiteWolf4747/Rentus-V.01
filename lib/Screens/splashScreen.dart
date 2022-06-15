import 'package:flutter/material.dart';
import 'package:flutter06/Services/auth.dart';
import 'package:flutter06/main.dart';
import 'package:flutter06/wrapper.dart';
import '../shared/classes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:provider/provider.dart';

class splashhomepage extends StatelessWidget {
  const splashhomepage({Key? key}) : super(key: key);
  //stream provider
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: null,
      value: AuthService().users,
      child: MaterialApp(
        home: splashScreens(),
      ),
    );
  }
}

class splashScreens extends StatefulWidget {
  const splashScreens({Key? key}) : super(key: key);

  @override
  State<splashScreens> createState() => _splashScreensState();
}

class _splashScreensState extends State<splashScreens> {
  void initState() {
    super.initState();
    _navigatehome();
  }

//wrapper here
  _navigatehome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => wrapper()));
  }

  @override
  Widget build(BuildContext context) {
    double _widthscreen = MediaQuery.of(context).size.width;
    double _heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomSheet: Center(
          child: Text(
            "Be Anywhere Anytime",
            style: header10.copyWith(color: Colors.white),
          ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: orangegradient,
            child: Center(
              child: Container(
                width: _widthscreen * 0.2,
                child: Image(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            )));
  }
}

/*bottom navigator
class homscaffold extends StatefulWidget {
  @override
  State<homscaffold> createState() => _homscaffoldState();
}

//this might be the bottom nav gliltch
class _homscaffoldState extends State<homscaffold> {
  int currentindex = 0;

  final pages = [myhomepagefirst(), searchpage(), searchPageMap()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) => setState(() => currentindex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined), label: "Map"),
          ],
        ),
        body: pages[currentindex]);
  }
}



/*login page
class loginScaffold extends StatefulWidget {
  const loginScaffold({Key? key}) : super(key: key);

  @override
  State<loginScaffold> createState() => _loginScaffoldState();
}

class _loginScaffoldState extends State<loginScaffold> {
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();

    String email = '.';
    String password = '';

    return Scaffold(
        body: ListView(
      children: [
        //login form
        Container(
          padding: EdgeInsets.all(20),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  child: Text("Login"))
            ],
          )),
        ),

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
              ElevatedButton(
                  onPressed: () async {
                    dynamic result = await _authService.signInAnon();
                    if (result == null) {
                      print("Didnt sign in");
                    } else {
                      print("Signed in");
                      print(result.uid);
                    }
                  },
                  child: Text("Login test")),
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

        //new form
      ],
    ));
  }
}
*/
*/