import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localdatbase/Pages/Homescreen.dart';
import 'package:localdatbase/Pages/Movie.dart';

class Bottomscreen extends StatefulWidget {
  const Bottomscreen({super.key});

  @override
  State<Bottomscreen> createState() => _BottomscreenState();
}

class _BottomscreenState extends State<Bottomscreen> {
  int currentindex = 0;
  final screens = [HomeScreen(), Movie()];
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          if (_navigatorKeys[currentindex].currentState!.canPop()) {
            _navigatorKeys[currentindex].currentState!.pop();
            return false;
          } else {
            if (currentindex == 0) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Exit Confirmation'),
                  content: Text('Do you want to exit the app?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Pop the AlertDialog
                        Navigator.of(context).pop();
                        // Exit the app
                        SystemNavigator.pop();
                      },
                      child: Text('Yes'),
                    ),
                  ],
                ),
              );
            } else {
              setState(() {
                currentindex = 0;
              });
            }
            return false;
          }
        },
        child: Scaffold(
          body: IndexedStack(
            index: currentindex,
            children: [
              Navigator(
                key: _navigatorKeys[0],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => screens[0],
                  );
                },
              ),
              Navigator(
                key: _navigatorKeys[1],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => screens[1],
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentindex,
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            onTap: (value) {
              setState(() {
                currentindex = value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie')
            ],
          ),
        ),
      ),
    );
  }
}
