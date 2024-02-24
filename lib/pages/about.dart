import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:neurohome/services/world_time.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}


_launchURL() async {
  Uri _url = Uri.parse('https://bit.ly/3QnKz4Y');
  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Stack(
          children: [

            //outside
              Text(
               'Despre noi',
               style: TextStyle(
                   //letterSpacing: 2.0,
                   //fontSize: 17.0,
                   //fontWeight: FontWeight.bold,

                   foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.0
                      ..color = Color(0xFFFFFFFF),
                ),
              ),

            //inside
             Text(
               'Despre noi',
             style: TextStyle(
                color: Color(0xFF28208C),
              ),
           ),
         ],
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body:
      Stack(
        children: [


          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/thumbnail.jpeg'),
                        radius: 60.0,
                      ),

                      SizedBox(width: 20.0),

                      CircleAvatar(
                        backgroundImage: AssetImage('assets/neurohome_stema_aplicatie_jpg_mai_bun.jpg'),
                        radius: 60.0
                      ),
                    ],
                  ),




                  Divider(
                    height: 90.0,
                    color: Color(0xFFFF5F1F),
                  ),




                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.web,
                        color: Colors.grey[400],
                      ),
                      SizedBox(width: 50.0,),
                      InkWell(
                        onTap: _launchURL,
                        child:
                        Text(
                          'https://bit.ly/3QnKz4Y',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    height: 90.0,
                    color: Color(0xFFFF5F1F),
                  ),



                  Text(
                    'NUME',
                    style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Andrei - Lucian Mustafa',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Rares-Mihai Bălănel',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Theodor Alexandru Căpitanu',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Cristian Eduard Andrei Săvulescu',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 70.0),







                ],

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
}
