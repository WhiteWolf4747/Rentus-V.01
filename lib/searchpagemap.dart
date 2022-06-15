import 'package:flutter/material.dart';
import 'package:flutter06/Screens/searchbarresults.dart';
import 'package:flutter06/searchpage.dart';
import 'shared/classes.dart';

class searchPageMap extends StatelessWidget {
  const searchPageMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "poppins", primaryColor: primarycolor),
      home: Scaffold(
          body: Stack(
        children: [
          Stack(
            children: [
              //bottom map
              Container(
                margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
                width: 420,
                child: Image.asset(
                  "assets/map02.png",
                  fit: BoxFit.cover,
                ),
              ),
              //all the above stuff
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  //main page without searchbar
                  topappbar(),
                  Positioned(
                    //searchbar and filter
                    top: 90,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => searchbarresul())),
                          child: Container(
                            width: 370,
                            height: 48,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 252, 252, 252),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(167, 107, 107, 107),
                                      blurRadius: 2.0,
                                      spreadRadius: 2,
                                      offset: Offset(0, 2))
                                ]),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 4, 0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 32,
                                  ),
                                ),
                                Text("Enter something here...",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 172, 172, 172),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomCategoryChip("something"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("wifi"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("apartment"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("title"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("title")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 70),
                      child: favOneBlock(
                          "assets/house01.jpg",
                          "addis ababa",
                          "assets/four.jpg",
                          "Luxury 2 bedroom\n aprtment",
                          "k"),
                    ),
                  )
                ],
              ),
            ],
          ),
          //bottom sheet
          DraggableScrollableSheet(
              minChildSize: 0.1,
              maxChildSize: 0.8,
              initialChildSize: 0.4,
              builder: (context, scrollcontroller) {
                return SingleChildScrollView(
                  controller: scrollcontroller,
                  child: Container(
                    height: 800,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 139, 139, 139),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ]),
                    child: Column(
                      children: [
                        //top picker
                        Container(
                          width: 70,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 70, 70, 70),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        //number of items
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "50 items",
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Featured",
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        //the two blocks
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //the one blick
                            featuredEachBlocks("assets/house01.jpg",
                                "assets/four.jpg", house01.title, "34"),

                            featuredEachBlocks("assets/house02.jpg",
                                "assets/four.jpg", house01.title, "94")
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: customsearchdelegate());
                            },
                            child: Text("search")),
                      ],
                    ),
                  ),
                );
              })
        ],
      )),
    );
  }
}

List<String> search = ["addis ababa", "gonder", "mekelle", "hawassa"];

class searchbar extends StatefulWidget {
  const searchbar({Key? key}) : super(key: key);

  @override
  State<searchbar> createState() => _searchbarState();
}

class _searchbarState extends State<searchbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            showSearch(context: context, delegate: customsearchdelegate());
          },
          child: Text("search")),
    );
  }
}

class customsearchdelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchresults = [];
    for (var each in search) {
      if (each.toLowerCase().contains(query.toLowerCase())) {
        searchresults.add(each);
      }
    }
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

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchresults = [];
    for (var each in search) {
      if (each.toLowerCase().contains(query.toLowerCase())) {
        searchresults.add(each);
      }
    }
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

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.deepOrange, // affects AppBar's background color
          toolbarHeight: 175,
        ),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10)));
  }
}


/*
class modalbtn extends StatelessWidget {
  const modalbtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GoogleMapsClonePage());
  }
}

class GoogleMapsClonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomGoogleMap(),
          CustomHeader(),
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.15,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: CustomScrollViewContent(),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Google Map in the background
class CustomGoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Center(child: Text("Google Map here")),
    );
  }
}

/// Search text field plus the horizontally scrolling categories below the text field
class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomSearchContainer(),
        CustomSearchCategories(),
      ],
    );
  }
}

class CustomSearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          16, 40, 16, 8), //adjust "40" according to the status bar size
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: <Widget>[
            CustomTextField(),
            Icon(Icons.mic),
            SizedBox(width: 16),
            CustomUserAvatar(),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: "Search here",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CustomUserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          color: Colors.grey[500], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomSearchCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          CustomCategoryChip(Icons.fastfood, "Takeout"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.directions_bike, "Delivery"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.local_gas_station, "Gas"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.shopping_cart, "Groceries"),
          SizedBox(width: 12),
          CustomCategoryChip(Icons.local_pharmacy, "Pharmacies"),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}

class CustomCategoryChip extends StatelessWidget {
  final IconData iconData;
  final String title;

  CustomCategoryChip(this.iconData, this.title);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        children: <Widget>[
          Icon(iconData, size: 16),
          SizedBox(width: 8),
          Text(title)
        ],
      ),
      backgroundColor: Colors.grey[50],
    );
  }
}

/// Content of the DraggableBottomSheet's child SingleChildScrollView
class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        CustomDraggingHandle(),
        SizedBox(height: 16),
        CustomExploreBerlin(),
        SizedBox(height: 16),
        CustomHorizontallyScrollingRestaurants(),
        SizedBox(height: 24),
        CustomFeaturedListsText(),
        SizedBox(height: 16),
        CustomFeaturedItemsGrid(),
        SizedBox(height: 24),
        CustomRecentPhotosText(),
        SizedBox(height: 16),
        CustomRecentPhotoLarge(),
        SizedBox(height: 12),
        CustomRecentPhotosSmall(),
        SizedBox(height: 16),
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomExploreBerlin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Explore Berlin",
            style: TextStyle(fontSize: 22, color: Colors.black45)),
        SizedBox(width: 8),
        Container(
          height: 24,
          width: 24,
          child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black54),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        ),
      ],
    );
  }
}

class CustomHorizontallyScrollingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
            CustomRestaurantCategory(),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class CustomFeaturedListsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      //only to left align the text
      child: Row(
        children: <Widget>[
          Text("Featured Lists", style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}

class CustomFeaturedItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        //to avoid scrolling conflict with the dragging sheet
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        children: <Widget>[
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
        ],
      ),
    );
  }
}

class CustomRecentPhotosText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: <Widget>[
          Text("Recent Photos", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class CustomRecentPhotoLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomFeaturedItem(),
    );
  }
}

class CustomRecentPhotosSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFeaturedItemsGrid();
  }
}

class CustomRestaurantCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class CustomFeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}


DraggableScrollableSheet(
              minChildSize: 0.2,
              maxChildSize: 0.8,
              initialChildSize: 0.4,
              builder: (context, scrollcontroller) {
                return SingleChildScrollView(
                  controller: scrollcontroller,
                  child: Container(
                    height: 500,
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 230, 230),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: Column(
                      children: [
                        //number of items
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "50 items",
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Featured",
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        //the two blocks
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //the one blick
                            featuredEachBlocks("assets/house01.jpg",
                                "assets/four.jpg", house01.title, "34"),

                            featuredEachBlocks("assets/house02.jpg",
                                "assets/four.jpg", house01.title, "94")
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                );
              })




 Stack(
            children: [
              //bottom map
              Container(
                margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
                width: 400,
                child: Image.asset(
                  "assets/map.png",
                  fit: BoxFit.cover,
                ),
              ),
              //all the above stuff
              Stack(
                alignment: AlignmentDirectional.topCenter,
                overflow: Overflow.visible,
                children: [
                  //main page without searchbar
                  Column(
                    children: [
                      Container(
                          height: 120,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            height: 75,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromARGB(255, 238, 214, 0),
                                  Color.fromARGB(255, 255, 60, 0)
                                ],
                                tileMode: TileMode.repeated,
                              ),
                            ),
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
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 32,
                                )
                              ],
                            ),
                          )),
                      //whole page below search and filter ie Bottom sheet
                    ],
                  ),
                  Positioned(
                    //searchbar and filter
                    top: 90,
                    child: Column(
                      children: [
                        Container(
                          width: 370,
                          height: 48,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 252, 252),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 201, 201, 201),
                                    blurRadius: 51.0)
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 32,
                                ),
                              ),
                              Text("Enter something here...",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 172, 172, 172),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomCategoryChip("something"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("wifi"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("apartment"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("title"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomCategoryChip("title")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
            ],
          ),

*/

