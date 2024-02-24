import 'package:neurohome/pages/choose_location.dart';
import 'package:flutter/material.dart';
import 'package:neurohome/pages/loading.dart';
import 'package:neurohome/pages/about.dart';
import 'package:neurohome/pages/menu.dart';
import 'package:neurohome/pages/objects.dart';
import 'package:neurohome/pages/priza.dart';
import 'package:neurohome/pages/baterie.dart';
import 'package:neurohome/pages/lumina.dart';
import 'package:neurohome/pages/centrala.dart';
import 'package:neurohome/pages/home.dart';
import 'package:neurohome/pages/flush.dart';
import 'package:neurohome/pages/incrustata.dart';
import 'package:neurohome/pages/bluetooth.dart';
import 'package:neurohome/pages/ajutor.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    '/about': (context) => About(),
    '/menu': (context) => Menu(),
    '/objects': (context) => Objects(),
    '/priza': (context) => Priza(),
    '/baterie': (context) => Baterie(),
    '/lumina': (context) => Lumina(),
    '/centrala': (context) => Centrala(),
    '/flush': (context) => Flush(),
    '/incrustata': (context) => Incrustata(),
    '/bluetooth': (context) => FlutterBlueApp(),
    '/ajutor': (context) => Ajutor(),
 },


  debugShowCheckedModeBanner: false,
  debugShowMaterialGrid: false,
));