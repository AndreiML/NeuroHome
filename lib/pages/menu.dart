import 'package:flutter/material.dart';
import 'package:neurohome/services/world_time.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Meniu'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [


          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                icon: Icon(Icons.line_style),
                label: Text(
                  'Despre noi',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextButton.icon(
                onPressed: () async {
                  dynamic resoult = Navigator.pushNamed(context, '/location');
                  },
                icon: Icon(Icons.location_on),
                label: Text(
                  'Alege locația',
                   style: TextStyle(
                   fontSize: 30.0,
                   fontWeight: FontWeight.bold,
                   ),
                 ),
               ),

              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/objects');
                },
                icon: Icon(Icons.device_hub),
                label: Text(
                  'Dispozitive',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/ajutor');
                },
                icon: Icon(Icons.help_outline),
                label: Text(
                  'Ajutor',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextButton.icon(
                onPressed: () {
                  //Navigator.pushNamed(context, '/ajutor');
                },
                icon: Icon(Icons.shop_outlined),
                label: Text(
                  'NeuroShop',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextButton.icon(
                onPressed: () {
                  //Navigator.pushNamed(context, '/ajutor');
                },
                icon: Icon(Icons.connect_without_contact_outlined),
                label: Text(
                  'NeuroSocial',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              TextButton.icon(
                onPressed: () {
                  //Navigator.pushNamed(context, '/ajutor');
                },
                icon: Icon(Icons.person_2_outlined),
                label: Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
}
