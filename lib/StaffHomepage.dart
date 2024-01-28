import 'package:flutter/material.dart';
import 'geofencing.dart';
import 'HomeScreen.dart';
import 'FirebaseRetrieve.dart';
class StaffHomePage extends StatefulWidget {
  const StaffHomePage({super.key});

  @override
  State<StaffHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<StaffHomePage> {
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
                  onPressed: (){}, child: Text('View Students Attendance')
              ),
            ],
          ),
        ),
      ),
    );
  }
}