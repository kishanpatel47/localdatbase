import 'package:flutter/material.dart';
import 'package:localdatbase/Drawermodel.dart';
import 'package:localdatbase/Pages/Homescreen.dart';
import 'package:localdatbase/Pages/Movie.dart';
import 'package:localdatbase/navigation/route_screen.dart';

import 'Drawerlist.dart';

class CustomNavigationbar extends StatefulWidget {
  final index;
  const CustomNavigationbar({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomNavigationbar> createState() => _CustomNavigationbarState();
}

class _CustomNavigationbarState extends State<CustomNavigationbar> {
  late int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
  }

  handleColor(Drawermodel item) {
    selectedIndex = item.id;
    setState(() {
      selectedIndex = widget.index; //item.id;
    });
    print("your  button $selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          drawerHeader(),
          Expanded(flex: 10, child: drawerlist()),
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return Center(
      child: Container(
        width: double.infinity,
        child: DrawerHeader(
          padding: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image(
                    height: 50,
                    width: 50,
                    image: NetworkImage(
                        'https://as1.ftcdn.net/v2/jpg/02/11/08/06/1000_F_211080640_xXT8ruEmESoNxB7bJB0LPL7JdXspR5iE.jpg')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerlist() {
    var widthmedia = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(2),
        child: Column(
          children: model.map((item) {
            return InkWell(
              onTap: () {
                Navigator.push(context, item.screenname);
              },
              child: Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color:
                          selectedIndex == item.id ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: item.id == 0 || item.id == 1
                      ? ListTileTheme(
                          child: ListTile(
                              selectedColor: Colors.black26,
                              hoverColor: Colors.black38,
                              tileColor:
                                  selectedIndex == item.id ? Colors.blue : null,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushReplacementNamed(item.screenname,
                                        arguments: selectedIndex);

                                setState(() {
                                  handleColor(item);
                                });
                              },
                              leading: Image.asset(
                                item.icon,
                                width: 25,
                                height: 25,
                                color: item.id == selectedIndex
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              title: Text(
                                item.name,
                                style: TextStyle(
                                  color: item.id == selectedIndex
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              )),
                        )
                      : null),
            );

            // return
          }).toList(),
        ),
      ),
    );
  }
}
