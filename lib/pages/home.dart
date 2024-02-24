import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:neurohome/services/world_time.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Added AnimationController for managing the animation
  DateTime _currentTime = DateTime.now(); // Added variable to store the current time
  Map data = {};


  @override
  void initState() {
    super.initState();

    // Initialized the AnimationController with a 1-second duration and set it to repeat
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);


    // Extracted common background and text color logic

    //set background

    String bgImage = data['isDayTime'] ? 'daytime.jpg' : 'nighttime_2.jpg';
    Color bgColor = data['isDayTime'] ? Colors.amberAccent : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [





          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
                ),
              ),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  _currentTime = DateTime.now();
                  String time = "${data['time']}:${_currentTime.minute}";

                  return Container(
                    child: Column(
                      children: <Widget>[
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/menu');
                          },
                          icon: Icon(
                            Icons.menu,
                            color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
                            size: 20.0,
                          ),
                          label: Text(
                            'Meniu',
                            style: TextStyle(
                              color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 120.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              data['location'],
                              style: TextStyle(
                                fontSize: 28.0,
                                letterSpacing: 2.0,
                                color: data['isDayTime'] ? Colors.yellowAccent : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 66.0,
                            color: data['isDayTime'] ? Colors.white : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 300),







                        // TODO De terminat acest pe fundal alb, daca ma decis sa fac asa
                        Center(
                          child:
                          Container(
                            child: Material(
                              child: InkWell(
                                //splashColor: Color(0xFF28208C),
                                onTap: () {
                                  Navigator.pushNamed(context, '/objects');
                                },
                                child: Ink.image(
                                  image: AssetImage('assets/stema_casa_smart_neurohome_fara_fundal.png'),
                                  height: 70,
                                  width: 70,
                                  //fit: BoxFit.cover,
                                ),
                              ),
                              color: Colors.transparent,
                            ),
                          ),







                          // TextButton.icon(
                          //  onPressed: () {
                          //    Navigator.pushNamed(context, '/objects');
                          //  },
                          // icon: Icon(
                          //   Icons.device_hub,
                          //    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
                          //    size: 40,
                          //  ),
                          // label: Text(
                          //  '',
                          //  style: TextStyle(
                          //    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
                          //   fontSize: 40,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          //),
                          // ),
                          //),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),









          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: (){},
              backgroundColor: Color(0xFFd285e3),
              child:
              SpeedDial(
                backgroundColor: Colors.transparent,
                animatedIcon: AnimatedIcons.menu_close,
                overlayColor: Color(0xFF28208C),
                overlayOpacity: 0.5,
                children: [

                  SpeedDialChild(
                    child: Icon(Icons.home),
                    label: 'Acasa',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    backgroundColor: Colors.blue[200],
                  ),

                  SpeedDialChild(
                    child: Icon(Icons.menu),
                    label: 'Meniu',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/menu');
                    },
                    backgroundColor: Colors.blue[200],
                  ),

                  SpeedDialChild(
                    child: Icon(Icons.location_city),
                    label: 'Locație',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/location');
                    },
                    backgroundColor: dayOrNight ? Color(0xFFffff00) : Color(0xFFffffff),
                  ),

                  SpeedDialChild(
                    child: Icon(Icons.emoji_objects_outlined),
                    label: 'Dispozitive',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/objects');
                    },
                    backgroundColor: dayOrNight ? Color(0xFFffff00) : Color(0xFFffffff),
                  ),

                  SpeedDialChild(
                    child: Icon(Icons.help_outline),
                    label: 'Ajutor',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/ajutor');
                    },
                    backgroundColor: dayOrNight ? Color(0xFFfde3d7) : Color(0xFF895c55),
                  ),

                  SpeedDialChild(
                    child: Icon(Icons.shop_outlined),
                    label: 'NeuroShop',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/ajutor');
                    },
                    backgroundColor: dayOrNight ? Color(0xFF005cce) : Color(0xFF4d3fbe),//0xFF90d9fe
                  ),

                  SpeedDialChild(
                    child: Icon(Icons.connect_without_contact_outlined),
                    label: 'NeuroSocial',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/ajutor');
                    },
                    backgroundColor: dayOrNight ? Color(0xFF005cce) : Color(0xFF4d3fbe),
                  ),

                  SpeedDialChild(
                    child: Icon(Icons.person_2_outlined),
                    label: 'Profil',
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/ajutor');
                    },
                    backgroundColor: dayOrNight ? Color(0xFFb0ed4e) : Color(0xFFa0a394),
                  ),
                ],
              ),
            ),
          ),













        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


/**class ButonPlutitor extends StatefulWidget{
  @override
  _ButonPlutitor createState() => _ButonPlutitor();
}



class _ButonPlutitor extends State<ButonPlutitor> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    floatingActionButton: SpeedDial(

    ),
  );
}**/







/**
    import 'package:flutter/material.dart';
    import 'package:flutter_animated_button/flutter_animated_button.dart';
    import 'package:animated_text_kit/animated_text_kit.dart';

    class Home extends StatefulWidget {
    @override
    State<Home> createState() => _HomeState();
    }

    class _HomeState extends State<Home> {

    Map data = {};

    @override
    Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'daytime.jpg' : 'nighttime_2.jpg';
    Color bgColor = data['isDayTime'] ? Colors.amberAccent : Colors.white;


    return Scaffold(
    backgroundColor: bgColor,
    body: SafeArea(
    child: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/$bgImage'),
    fit: BoxFit.cover,
    ),
    ),
    child: Column(
    children: <Widget>[
    TextButton.icon(
    onPressed: () {
    Navigator.pushNamed(context, '/menu');
    },
    icon: Icon(
    Icons.menu,
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    size: 20.0,
    ),
    label: Text(
    'Meniu',
    style: TextStyle(
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    SizedBox(height: 140.0),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text(
    data['location'],
    style: TextStyle(
    fontSize: 28.0,
    letterSpacing: 2.0,
    color: data['isDayTime'] ? Colors.yellowAccent : Colors.white,
    fontWeight: FontWeight.bold,
    ),
    )
    ],
    ),
    SizedBox(height: 20.0),
    Text(
    data['time'],
    style: TextStyle(
    fontSize: 66.0,
    color: data['isDayTime'] ? Colors.white : Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 400),







    // TODO De terminat acest pe fundal alb, daca ma decis sa fac asa
    Center(
    child: TextButton.icon(
    onPressed: () {
    Navigator.pushNamed(context, '/objects');
    },
    icon: Icon(
    Icons.device_hub,
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    size: 40,
    ),
    label: Text(
    '',
    style: TextStyle(
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    );
    }
    }


 **//**import 'package:flutter/material.dart';
    import 'dart:async';
    import 'package:flutter_animated_button/flutter_animated_button.dart';
    import 'package:animated_text_kit/animated_text_kit.dart';

    class Home extends StatefulWidget{
    @override
    State<Home> createState() => _HomeState();
    }

    class _HomeState extends State<Home> with TickerProviderStateMixin {

    Map data = {};
    late String currentTime;
    late Timer _timer;

    @override
    Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'daytime.jpg' : 'nighttime_2.jpg';
    Color bgColor = data['isDayTime'] ? Colors.amberAccent : Colors.white;


    return Scaffold(
    backgroundColor: bgColor,
    body: SafeArea(
    child: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/$bgImage'),
    fit: BoxFit.cover,
    ),
    ),
    child: Column(
    children: <Widget>[
    TextButton.icon(
    onPressed: () {
    Navigator.pushNamed(context, '/menu');
    },
    icon: Icon(
    Icons.menu,
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    size: 20.0,
    ),
    label: Text(
    'Meniu',
    style: TextStyle(
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    SizedBox(height: 140.0),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text(
    data['location'],
    style: TextStyle(
    fontSize: 28.0,
    letterSpacing: 2.0,
    color: data['isDayTime'] ? Colors.yellowAccent : Colors.white,
    fontWeight: FontWeight.bold,
    ),
    )
    ],
    ),
    SizedBox(height: 20.0),
    Text(
    '${_currentTime.minute}',
    style: TextStyle(
    fontSize: 66.0,
    color: data['isDayTime'] ? Colors.white : Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 400),







    // TODO De terminat acest pe fundal alb, daca ma decis sa fac asa
    Center(
    child: TextButton.icon(
    onPressed: () {
    Navigator.pushNamed(context, '/objects');
    },
    icon: Icon(
    Icons.device_hub,
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    size: 40,
    ),
    label: Text(
    '',
    style: TextStyle(
    color: data['isDayTime'] ? Colors.amberAccent : Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    );
    }
    }**/