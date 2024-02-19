import 'package:flutter/material.dart';
import 'geofencing.dart';
import 'HomeScreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hey! What would you like to do today?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              Container(
                height: 20,
              ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon/Homepage Wallpaper (1).png"), //
                fit: BoxFit.cover,
              ),
            ),
           ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  }, child: Text('   Register Face   ')
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GeolocationApp()), //Check this out!!
                    );
                  }, child: Text('Mark Attendance')
              ),
              ElevatedButton(
                  onPressed: (){}, child: Text('View Attendance')
              ),
            ],
          ),
        ),
      ),
    );
  }
}