import 'package:neurohome/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations =[
    WorldTime(location: 'Craiova', flag: 'romania.jpg', url: 'Europe/Bucharest'),
    WorldTime(location: 'București', flag: 'romania.jpg', url: 'Europe/Bucharest'),
    WorldTime(location: 'Londra', flag: 'anglia.jpg', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Paris', flag: 'franta.jpg', url: 'Europe/Paris'),
    WorldTime(location: 'Brussels', flag: 'belgia.png', url: 'Europe/Brussels'),
    WorldTime(location: 'Roma', flag: 'italia.png', url: 'Europe/Rome'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: dayOrNight ? Colors.yellowAccent : Colors.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Alegeți o locație',
          style: TextStyle(
            color: Color(0xFF28208C),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradientPainter(
              colors:[
                dayOrNight ? Color(0xFFffff00) : Color(0xFFffffff),
                dayOrNight ? Color(0xFF39ff14) : Color(0xFF28208C),
                //Color(0xFF28208C),
                //Color(0xFF215bad),
                //Color(0xFF23b0ba),
                //Color(0xFF1fd17b),
                //Color(0xFF3be016),
                //Color(0xFFffff00),
              ],

              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradientPainter(
                            colors: [
                              //dayOrNight ? Colors.white : Color(0xFF909090),
                              dayOrNight ? Colors.white : Color(0xFFffffff),
                              dayOrNight ? Color(0xFF007FFF) : Color(0xFF909090),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(150.0)),
                        ),
                        child: ListTile(
                          onTap: () {
                            updateTime(index);
                          },
                          title: Center(child:
                            //GradientText(
                            Stack(
                              children: [

                                //outside
                                Text(
                                  locations[index].location,
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,

                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2.0
                                      ..color = Color(0xFF28208C)

                                    //color: dayOrNight ? Colors.white : Colors.white,
                                  ),
                                  //gradientType: GradientType.radial,
                                  //colors: [
                                  // dayOrNight ? Colors.black : Colors.black,
                                  //dayOrNight ? Colors.white : Colors.white,
                                  //],
                                ),





                                //inside
                                Text(
                                  locations[index].location,
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: dayOrNight ? Colors.white : Colors.white,
                                  ),
                                  //gradientType: GradientType.radial,
                                  //colors: [
                                  // dayOrNight ? Colors.black : Colors.black,
                                  //dayOrNight ? Colors.white : Colors.white,
                                  //],
                                ),
                              ],
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/${locations[index].flag}'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
      ),
    );
  }
}
