import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gradients/gradients.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:neurohome/services/world_time.dart';


class Flush extends StatefulWidget {
  const Flush({super.key});

  @override
  State<Flush> createState() => _FlushState();
}






_launchURL() async {
  Uri _url = Uri.parse('https://andreiml2006.wixsite.com/neurohome/portfolio-collections/my-portfolio/project-title-6-1-1-1');
  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}

class _FlushState extends State<Flush> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF28208C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Stack(
          children: [

            //outside
            Text(
              'Senzor Flush',
              style: TextStyle(
                //letterSpacing: 2.0,
                //fontSize: 17.0,
                //fontWeight: FontWeight.bold,
                fontWeight: FontWeight.bold,

                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1.0
                  ..color = Color(0xFFFFFFFF),
              ),
            ),

            //inside
            Text(
              'Senzor Flush',
              style: TextStyle(
                color: Color(0xFF0021f3),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body:
      Stack(
        children: [






          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradientPainter(
                  colors:[
                    Color(0xFF28208C),
                    Color(0xFF215bad),
                    Color(0xFF23b0ba),
                    Color(0xFF1fd17b),
                    Color(0xFF3be016),
                    Color(0xFFffff00),
                  ],

                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 0.0),
              child: Column(
                children: <Widget>[
                  Row( // Primul rand
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 2 - 32,
                          child: Image.asset('assets/senzor_toaleta_flush_2.jpg')
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' Senzorul',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            ' Flush',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            ' NeuroHome',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 120.0),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/objects');
                      },
                      icon: Icon(
                        Icons.assessment_outlined,
                        size: 100,
                        color: Colors.amberAccent,
                      ),
                      label: Text(
                        '',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 200.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.web,
                        color: Color(0xFF28208C),
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        onTap: _launchURL,
                        child:
                        Text(
                          'Află mai multe aici!',
                          style: TextStyle(
                            color: Color(0xFF28208C),
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
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


