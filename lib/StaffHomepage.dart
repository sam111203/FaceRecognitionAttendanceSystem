import 'package:flutter/material.dart';
import 'ViewStudentsAttendance.dart';
import 'geofencing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'changeGeofence.dart';

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({Key? key}) : super(key: key);

  @override
  State<StaffHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<StaffHomePage> {

  TextEditingController new_latitude = TextEditingController();
  TextEditingController new_longitude = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hey! What would you like to do today?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewAttendance()),
                  );
                },
                child: Text('View Students Attendance'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(200, 30)), // Adjust the Size as needed
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeGeofence(),
                    ),
                  );
                },
                child: Text('Change geofence'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(200, 30)), // Adjust the Size as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
