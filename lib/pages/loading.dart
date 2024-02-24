import 'package:flutter/material.dart';
import 'package:neurohome/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Craiova', flag: 'romania.png', url: 'Europe/Bucharest');
    await instance.getTime();
    await Future.delayed(Duration(seconds: 3), () {} );
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'NeuroHome',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 120.0),
            SpinKitPulsingGrid(
              color: Colors.white,
              size: 120.0,
            ),
            SizedBox(height: 100),
            Text(
              'Versiunea Pre-Alpha',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
