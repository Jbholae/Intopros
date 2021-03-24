import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intoPros/Screens/location.dart';
import 'package:intoPros/Screens/maps.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg"
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Drawer(
              child: Container(
                child: Text("This is drawer"),
              ),
            );
          },
        ),
        title: Text("App"),
        actions: [
          CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/images/model.jpeg'),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Carousel
              Container(
                height: height * 0.3,
                width: width,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlayCurve: Curves.linearToEaseOut,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      initialPage: 0,
                      height: height * 0.23,
                      onPageChanged: (index, reaseon) {
                        _current = index;
                      }),
                  items: imageList.map((e) {
                    return Builder(
                      builder: (context) {
                        return Container(
                          width: width,
                          child: Image.asset(e),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              //Buttons
              Container(
                height: height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Buttons Items
                    buttonItems(
                      Icons.precision_manufacturing_sharp,
                      "Spare Parts",
                      Colors.lightGreen,
                      () {},
                    ),
                    buttonItems(Icons.event_note_rounded, "Book Service",
                        Colors.lightBlue, () {}),
                    buttonItems(Icons.history, "History", Colors.brown, () {}),
                    buttonItems(
                        Icons.location_on, "Location", Colors.pinkAccent, () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Location()));
                    }),
                  ],
                ),
              ),
              // Crossfire
              Container(
                height: height * 0.2,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Crossfire - RM250",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Last Servicing
                        servicing(
                          "Last Servicing",
                          "2nd December 2020",
                          Colors.white,
                          Colors.green[700],
                        ),
                        // Next Servicing
                        servicing(
                          "Next Servicing",
                          "2nd December 2021",
                          Colors.white,
                          Colors.blue[700],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Events
              Container(
                height: height * 0.4,
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Event Containts
                    eventContainer("assets/images/test.jpeg", "First Event",
                        "We have organized this event to demo..."),
                  ],
                ),
              ),
              // New Products
              Container(
                height: height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Products",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        newproductItems("assets/images/bike.jpeg", "CRF250l"),
                        newproductItems("assets/images/bike.jpeg", "CRF250l"),
                        newproductItems("assets/images/bike.jpeg", "CRF250l"),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonItems(IconData icon, String text, Color color, Function onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  servicing(
    String text,
    String date,
    Color color1,
    color2,
  ) {
    var servicingTextHeading = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
      letterSpacing: 1,
      fontSize: 17.0,
    );
    var servicingTextBody = TextStyle(
      color: Color(0xFFFFFFFF),
    );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: FractionalOffset(0.0, 4),
          end: FractionalOffset(0.0, 0.1),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Text(
              text,
              style: servicingTextHeading,
            ),
            SizedBox(height: 5),
            Text(
              date,
              style: servicingTextBody,
            ),
          ],
        ),
      ),
    );
  }

  eventContainer(
    String image,
    heading,
    body,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var headingStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    var bodyStyle = TextStyle(color: Colors.white);
    return Container(
      height: height * 0.28,
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.9),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Image
          Container(
            height: height * 0.25,
            width: width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.blue,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Other Details
          Container(
            height: height * 0.25,
            width: width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: headingStyle,
                      ),
                      Text(
                        body,
                        style: bodyStyle,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
                // Button
                Container(
                  width: width,
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Text(
                      "View All".toUpperCase(),
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  newproductItems(String image, String name) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 70,
            fit: BoxFit.cover,
          ),
          Text(name),
        ],
      ),
    );
  }
}
