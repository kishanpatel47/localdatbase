import 'package:flutter/material.dart';
import 'package:localdatbase/Drawermodel.dart';
import 'package:localdatbase/geticon.dart';
import 'package:localdatbase/navigation/route_screen.dart';

List<Drawermodel> model = [
  Drawermodel(
    id: 0,
    name: 'Home',
    screenname: Routesscreen.Home,
    icon: getIcons.Home,
  ),
  Drawermodel(
    id: 1,
    name: 'Why Suvidha Sarthi ?',
    screenname: Routesscreen.Movie,
    icon: getIcons.movie,
  ),
];
