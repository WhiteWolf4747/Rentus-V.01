import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Models/reservationmodel.dart';
import 'package:flutter06/Screens/home.dart';
import 'package:flutter06/Services/reservationservice.dart';
import 'package:flutter06/shared/styles.dart';
import '../shared/classes.dart';
import 'package:intl/intl.dart';

final myuid = FirebaseAuth.instance.currentUser!.uid;

int adultnumber = 1;
int childnumber = 0;
int guests = 0;
int thetotalfee = 0;
String selecteddatefrom = "";
String selecteddateto = "";
String housetitle = "";
String houseuid = "";
String hostuid = "";
String reserveruid = "";

class checkOutpage extends StatefulWidget {
  String reserveruid;
  HouseListing houseobj;
  checkOutpage(this.reserveruid, this.houseobj);

  @override
  State<checkOutpage> createState() => _checkOutpageState();
}

class _checkOutpageState extends State<checkOutpage> {
  DateTimeRange daterange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 2)));

  Future pickdaterange() async {
    DateTimeRange? newdaterange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 1000)),
      lastDate: DateTime.now().add(Duration(days: 1000)),
      initialDateRange: daterange,
    );

    if (newdaterange == null) {
      return;
    }

    setState(() {
      daterange = newdaterange;
    });
  }

  @override
  Widget build(BuildContext context) {
    final start = daterange.start;
    final end = daterange.end;

    double _screenwidth = getScreenWidth(context);
    double _screenheight = getScreenHeight(context);

    int datedifference = daterange.duration.inDays;

    return Scaffold(
        body: Container(
      margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Stack(
        children: [
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.0, color: linecolor),
                    )),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 20,
                            color: textcolorsecondary,
                          ),
                        ),
                        Text(
                          "    Reservation request",
                          style: header14,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //top displayer
                  Container(
                    width: double.infinity,
                    decoration: linedboxdec,
                    padding: EdgeInsets.all(14),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            image: NetworkImage(widget.houseobj.imageurl[0]),
                            width: 84,
                            height: 84,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            //the 3 descriptions
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  widget.houseobj.subtitle,
                                  style: header12bold,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                    child: Image(
                                      image: AssetImage("assets/5star01.png"),
                                      height: 18,
                                    ),
                                  ),
                                  Text("  4.5 reviews", style: header10)
                                ],
                              ),
                              Text(
                                widget.houseobj.location,
                                style: header12light,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),

                  //date and guest displayer
                  Container(
                      width: double.infinity,
                      decoration: linedboxdec,
                      padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Column(
                        children: [
                          //the one row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date",
                                style: header12medium,
                              ),
                              TextButton(
                                onPressed: (() {
                                  pickdaterange();
                                }),
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                child: Text(
                                  "${DateFormat("MMMM").format(start)} ${start.day} - ${DateFormat("MMMM").format(end)} ${end.day}",
                                  style: header12light.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1.5,
                                      color: textcolorprimary),
                                ),
                              )
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Guests",
                                style: header12medium,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      builder: (context) => guestscounter());
                                },
                                child: Text(
                                  "1 Adult. 2 Children",
                                  style: header12light.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1.5,
                                      color: textcolorprimary),
                                ),
                              )
                            ],
                          )
                        ],
                      )),

                  SizedBox(
                    height: 24,
                  ),

                  //price displayer
                  Container(
                      width: double.infinity,
                      decoration: linedboxdec,
                      padding: EdgeInsets.all(14),
                      child: Expanded(
                        child: Column(
                          children: [
                            //the one row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Stay for ${datedifference.toString()} Nights",
                                  style: header12medium,
                                ),
                                Text(
                                    "${daterange.duration.inDays} x \$${widget.houseobj.price}",
                                    style: header12medium.copyWith(
                                        color: textcolorprimary))
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tax Fee",
                                  style: header12medium,
                                ),
                                Text(
                                  "\$ ${(daterange.duration.inDays * widget.houseobj.price) * 0.15}",
                                  style: header12medium.copyWith(
                                      color: textcolorprimary),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Service Fee",
                                  style: header12medium,
                                ),
                                Text(
                                  "\$ ${(daterange.duration.inDays * widget.houseobj.price) * 0.15}",
                                  style: header12medium.copyWith(
                                      color: textcolorprimary),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Divider(
                              color: linecolor,
                              thickness: 1.6,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Fee",
                                  style: header12bold,
                                ),
                                Text(
                                  "\$ ${(daterange.duration.inDays * widget.houseobj.price + (daterange.duration.inDays * widget.houseobj.price) * 0.15).toInt()}",
                                  style: header12bold.copyWith(
                                      color: theprimarycolor),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {
                    selecteddatefrom =
                        "${DateFormat("MMMM").format(start)} ${start.day} ";
                    selecteddateto =
                        "${DateFormat("MMMM").format(end)} ${end.day}";
                    housetitle = widget.houseobj.title;
                    houseuid = widget.houseobj.houseuid;
                    hostuid = widget.houseobj.uid;
                    reserveruid = widget.reserveruid;
                    guests = adultnumber + childnumber;
                    thetotalfee =
                        (daterange.duration.inDays * widget.houseobj.price +
                                (daterange.duration.inDays *
                                        widget.houseobj.price) *
                                    0.15)
                            .toInt();
                    reservationmodel reservenew = reservationmodel(
                        housetitle,
                        hostuid,
                        houseuid,
                        reserveruid,
                        selecteddatefrom,
                        guests,
                        thetotalfee,
                        selecteddateto);
                    if (reservenew.checkifvalid()) {
                      reservationservice(myuid, widget.houseobj.uid)
                          .createreservation(reservenew);
                      return Navigator.of(context).pop();
                    }
                  },
                  child: Text("data")))
        ],
      ),
    ));
  }
}

//----

class guestscounter extends StatefulWidget {
  const guestscounter({Key? key}) : super(key: key);

  @override
  State<guestscounter> createState() => _guestscounterState();
}

class _guestscounterState extends State<guestscounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Adults",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        adultnumber += 1;
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(adultnumber.toString()),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        adultnumber -= 1;
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Children",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        childnumber += 1;
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(childnumber.toString()),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        childnumber -= 1;
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () => Navigator.pop(context), child: Text("done")),
        ],
      ),
    );
  }
}
