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
              Text('Hey! What would you like to do today?'),
              Container(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  }, child: Text('Register Face')
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GeolocationApp()),
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