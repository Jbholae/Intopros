import 'package:flutter/material.dart';
import 'package:intoPros/Screens/maps.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                title: Text("Location"),
              ),
              searchContainer(),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: TabBar(
                  isScrollable: false,
                  unselectedLabelColor: Colors.blue,
                  labelPadding: EdgeInsets.all(12.0),
                  indicator: ShapeDecoration(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  //  UnderlineTabIndicator(
                  //   insets: EdgeInsets.all(5.0),
                  //   borderSide: BorderSide(
                  //       color: Colors.blue,
                  //       width: 50,
                  //       style: BorderStyle.solid),
                  // ),
                  tabs: [
                    Tab(
                      child: Text("Service Center"),
                    ),
                    Tab(
                      child: Text("Sales"),
                    ),
                    Tab(
                      child: Text("Parts Outlets"),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.69,
                child: TabBarView(children: [
                  Container(
                    child: Center(
                      child: Text("Service Center"),
                    ),
                  ),
                  Maps(),
                  Container(
                    child: Center(child: Text("Parts Outlets")),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  searchContainer() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      height: height * 0.1,
      width: width,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 20, color: Colors.black),
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
