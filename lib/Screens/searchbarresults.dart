// main.dart
import 'package:flutter/material.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

InputDecoration inputdecor = InputDecoration(
  prefixIcon: Icon(
    Icons.search,
    color: textcolorsecondary,
  ),
  label: Text(
    "Search something here...",
    style: header12light.copyWith(color: textcolorsecondary),
  ),
  filled: true,
  fillColor: Color.fromARGB(255, 252, 252, 252),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40), borderSide: BorderSide.none),
);

class searchbarresul extends StatefulWidget {
  const searchbarresul({Key? key}) : super(key: key);

  @override
  _searchbarresulState createState() => _searchbarresulState();
}

class _searchbarresulState extends State<searchbarresul> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<String> _allUsers = [
    "addis ababa",
    "gonder",
    "mekelle",
    "hawassa",
    "nazret"
  ];

  // This list holds the data for the list view
  List<String> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      for (var each in _allUsers) {
        if (each.toLowerCase().contains(enteredKeyword.toLowerCase())) {
          results.add(each);
        }
      }
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            //app bar
            Column(
              children: [
                custmappbarwithx(),
                //----results
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      _foundUsers.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _foundUsers.length,
                              itemBuilder: (context, index) => ListTile(
                                leading: Text(
                                  _foundUsers[index].toString(),
                                  style: header12medium,
                                ),
                              ),
                            )
                          : const Text(
                              'No results found',
                              style: TextStyle(fontSize: 24),
                            ),
                    ],
                  ),
                ),
              ],
            ),

            //--
            Positioned(
                //searchbar
                top: 90,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: SizedBox(
                    width: 360,
                    height: 48,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(157, 157, 157, 0.14),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) => _runFilter(value),
                        decoration: inputdecor,
                      ),
                    ),
                  ),
                )),
          ],
        )
      ],
    ));
  }
}

class custmappbarwithx extends StatelessWidget {
  const custmappbarwithx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 75,
          decoration: orangegradient,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: "Rent",
                      style: header18bold.copyWith(fontFamily: "montserrat"),
                      children: [
                    TextSpan(
                        text: "US",
                        style: header18bold.copyWith(
                            fontFamily: "montserrat", color: Colors.white))
                  ])),
              InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 24,
                  )),
            ],
          ),
        ));
  }
}

/* 
Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: inputdecor,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _foundUsers.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(
                        _foundUsers[index].toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );






String enteredquery = "";

class searchresults extends StatefulWidget {
  const searchresults({Key? key}) : super(key: key);

  @override
  State<searchresults> createState() => _searchresultsState();
}

class _searchresultsState extends State<searchresults> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
                height: 120,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  height: 75,
                  decoration: lineargradient,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.notification_important_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      Text(
                        "Rentus",
                        style: header1,
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 32,
                      )
                    ],
                  ),
                )),

            //search bar new
            searchresultsmain(myController.text),

            Positioned(
              //searchbar
              top: 90,
              child: Container(
                
                width: 360,
                height: 52,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 201, 201, 201),
                          blurRadius: 51.0)
                    ]),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    label: Text("Search something here..."),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> search = ["addis ababa", "gonder", "mekelle", "hawassa"];

class searchresultsmain extends StatefulWidget {
  String queryword;
  searchresultsmain(this.queryword);

  @override
  State<searchresultsmain> createState() => _searchresultsmainState();
}

class _searchresultsmainState extends State<searchresultsmain> {
  @override
  Widget build(BuildContext context) {
    print(widget.queryword);
    List<String> searchresults = [];
    for (var each in search) {
      if (each.toLowerCase().contains(widget.queryword.toLowerCase())) {
        searchresults.add(each);
      }
    }
    print(searchresults);

    return ListView.builder(
      itemCount: searchresults.length,
      itemBuilder: (context, index) {
        var oneresult = searchresults[index];
        return ListTile(
          title: Text(oneresult),
        );
      },
    );
  }
}

class searchpageresults extends StatelessWidget {
  const searchpageresults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
                height: 120,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  height: 75,
                  decoration: lineargradient,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.notification_important_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      Text(
                        "Rentus",
                        style: header1,
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 32,
                      )
                    ],
                  ),
                )),
            Positioned(
                //searchbar
                top: 90,
                child: searchbarresul()),
          ],
        ),
      ),
    );
  }
}

*/