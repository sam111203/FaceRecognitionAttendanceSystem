import 'package:flutter/material.dart';
import 'login.dart';
class ChangeGeofence extends StatefulWidget {
  const ChangeGeofence({super.key});

  @override
  State<ChangeGeofence> createState() => _ChangeGeofenceState();
}
TextEditingController startlat  = TextEditingController();
TextEditingController startlong  = TextEditingController();
String startlatitude='';
String startlongitude ='';
class _ChangeGeofenceState extends State<ChangeGeofence> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enter the new coordinates",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),),
             Container(
                    padding: const EdgeInsets.only(top:20, left:10, right: 10),
                    child: TextFormField(
                      maxLength: 45,
                      controller: startlat,
                      style: TextStyle(height: 2.0),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(15.0),
                        ),

                      ),

                    ),
                  ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        style: TextStyle(height: 2.0),
                        controller: startlong,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),

                      ),
                    ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      startlatitude=startlat.text;
                      startlongitude=startlong.text;
                      print(startlatitude);
                      print(startlongitude);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    });
                  },
                  child: Text("Ok!"),
                )
              ),
                  ],
                ),
              ),
          ),

    );
  }
}
