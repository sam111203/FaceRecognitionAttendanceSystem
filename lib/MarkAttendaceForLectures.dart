import 'package:flutter/material.dart';
import 'dart:core';
import 'package:gsheets/gsheets.dart';

class ActualAttendanceMarking extends StatefulWidget {
  const ActualAttendanceMarking({super.key});
  @override
  State<ActualAttendanceMarking> createState() => _ActualAttendanceMarkingState();
}
class UserSheetsApi2{
  static const _credentials = r''' 
  {
  "type": "service_account",
  "project_id": "fr-attendance-system",
  "private_key_id": "68cd118876cdb7c8f81c2fd0cff6990edcc4c9b1",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDyDbhkytZeUHCC\nfxc4//dPYqy2Yu6jqG7K8MCaaR2dJOuuat9eCjp8sqxJN2OeL9OO+lZMstTp6ybU\njF75EViGwlwGn9bZzfKCMUhjsap5R/GPe0Ad8u+qfH2CPJCDuBYXRR02K/SVl139\nncWfC1XMMKpEMcWKEwla+JxJ7wYc0wj3e6QVG0TSzbc4BVFzZTgNXpHfM/Lk5uy0\n/+F+TOZa4VoTEF7L8P2HwLNRuntNMlJDXke1DtUOuByd4g1a9zaABpAk7dmQ1o4s\nMheOQm0ndZLzpXyOvuLLIDSgx7oB77Q+EdAVUZIkwT24wk+N3pCm9oIkIt7kc5NC\n9zAOSTUtAgMBAAECggEAHiCBC+KHLfP7HPLulASf5nyUnJrRswL6zz2J624b5nw6\n7VmV9aF2SCEA+pfvSTgQr+IOrbswbvD6w0e5Zmy3RQaZ56UrW66beYLizK3HVxMS\nSNaBU3jyRZj7EiOxpQNblIfgq+ZqqdfONgvWFgaWJjUEbDp5qMbXyj/ZTAZ5D0si\n/Qbjk9b2knsLMmP0BntJmoJfnvi2suN/lu4oox+LtrbfcBmtseTHmyQkbII20Jjn\nHZ0KzYx8mJq9iMiU9Bjx6mgAxcJxwVJwwUYFc2tJyfZ6AUxYC2ezahKFPzEBJklF\n/wcUnBy5BrOAqmMiW7CG2Fe+GFXlEYZFurcXaACXgQKBgQD/WgNNvOMWMxJ0Kt1v\nL2j2amngvpncsickqKjQLUMTtghm3vx0azFlILd7mMu0xAcQ5U29/mbc5ILFmFve\nG6Ql8tFKd0/OsC1xir92E9W4n2PIEuiPOCkbcYV8EMmKUWfUEGWFgHddhyiGhy/x\nNBvdgkf17ekEwTwdK9N4DpcpIQKBgQDyqxAvmAGfp88rZ9HY1jGrYDvl96KaJkCJ\nDAC2U0LKQZeynaZ0SwQHQOmIjCCqhAfk/OT+wfH/+gXyEuvonKHutWHdBQvu8/yv\nbEpHjIqbksNdWr+VgIWvMP7Tf8Jrl7lcCr14RUiEKTUvZe07xVlLlHQYx1ioma5O\nC3Ba2Q/OjQKBgQDO3reqdQpsY7fhkRCQERKx/4gDYab5GwOHOXR6IxEimOi5npFc\nJ7N+wEClyyXNLrqiv4J6F+5xqlcfic1zZWVYsR1JfNuVETnfsI5oNK2Cwu5tmpP5\n43+6EgAYgOkmO8koDpiQzYDmrqbwRflbKeIhVHjEDpgnF/2BjI3nx7pCwQKBgFiQ\nEdIs2brY1YTz2OQYF/yBnJqrK86yUy8xEDl6XY/PLHvliVA76HZ1PEW3Tlys3uy1\nVyWaxqUzLGRSf4JfV8H0tIijRN2qcffbv6gpJJTulRpG+lCnnSJ48SdjIyN9Ngrf\naJKyRmrlVyG7Qz9jINmyjkRUzIiLvc+B4TlmqpwpAoGAeiduf2t+XGwtzf+XAlS2\n5lcA49caTypwBG7oZX8soMWCVFyMtszGmLOlINOAR9JO9aebcdVrMRK3lqZcVIDG\nvnWF7bNt4kR9zOlVbYx88m5AOpK/156jD8F6k48DmTlqCJpaG5iFzi4fSjmP91e7\nmLxUXZRQ5cNrxi2JGEf8ulQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "mini-project-sem5@fr-attendance-system.iam.gserviceaccount.com",
  "client_id": "105098431325622100803",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/mini-project-sem5%40fr-attendance-system.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
  ''';
  static final _spreadsheetId = '1EAvWQA32kmCJfkCPl1MbDvLzAwtFnuI5CKubDXoDX1Q';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet2;
  static Future init() async{
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet2 = await _getWorkSheet(spreadsheet, title: 'Sheet1');

      final firstRow = UserFields.getFields();
      _userSheet2!.values.insertRow(1, firstRow);
    }catch(e){
      print('Init Error: $e');
    }
  }
  static Future <Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet,{
        required String title,
      }
      )async{
    try{
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
  static Future insert(List<Map<String, dynamic>> rowList) async{
    if(_userSheet2 == null) return;

    _userSheet2!.values.map.appendRows(rowList);
  }
}

class UserFields{
  static final String Date = 'Date';
  static final String Name = 'Name';
  static final String A845 = 'A845';
  static final String A945 = 'A945';
  static final String A1100 = 'A1100';
  static final String A1200= 'A1200';
  static final String A130 = 'A130';
  static final String A230= 'A230';

  static List<String> getFields() => [Date, Name, A845, A945, A1100, A1200, A130, A230];
}

class _ActualAttendanceMarkingState extends State<ActualAttendanceMarking> {
  int selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Mark Attendance'),),
        body: Container(
          margin: EdgeInsets.only(top:80,left:60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right:60),
                child:Text('Which lecture would you like to mark attendance for??',style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 17,
                ),
               ),
              ),
              ListTile(
                title: const Text('8:45 a.m. to 9:45 a.m.'),
                leading: Radio<int>(
                  value: 1,
                  groupValue: selectedOption,
                  activeColor: Colors.red, // Change the active radio button color here
                  fillColor: MaterialStateProperty.all(Colors.red), // Change the fill color when selected
                  splashRadius: 20, // Change the splash radius when clicked
                  onChanged: (value) {
                    setState(() async {
                      selectedOption = value!;
                      print(selectedOption);
                      DateTime currentTime=DateTime.now();
                      DateTime startTime = DateTime(2023, 11, 2, 19, 44);
                      DateTime endTime = DateTime(2023, 11, 3, 00, 00);
                      bool isBeforeTime = currentTime.isBefore(endTime);
                      bool isAfterTime = currentTime.isAfter(startTime);
                      if(isBeforeTime==true && isAfterTime==true){
                        print('Attendance Marked for 8:45 a.m. to 9:45 a.m. lecture!!');
                        final user = {
                          UserFields.Date: '${DateTime.now()}',
                          UserFields.Name: 'Sam Saji',
                          UserFields.A845: 'P',
                        };
                        await UserSheetsApi2.insert([user]);
                      }
                      else{
                        print('Attendance cannot be marked as outside permissible limit!!');
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('9:45 a.m. to 10:45 a.m.'),
                leading: Radio<int>(
                  value: 2,
                  groupValue: selectedOption,
                  activeColor: Colors.blue, // Change the active radio button color here
                  fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                  splashRadius: 25, // Change the splash radius when clicked
                  onChanged: (value) {
                    setState(() async{
                      selectedOption = value!;
                      print(selectedOption);
                      DateTime currentTime=DateTime.now();
                      DateTime startTime = DateTime(2023, 11, 2, 19, 44);
                      DateTime endTime = DateTime(2023, 11, 3, 00, 00);
                      bool isBeforeTime = currentTime.isBefore(endTime);
                      bool isAfterTime = currentTime.isAfter(startTime);
                      if(isBeforeTime==true && isAfterTime==true){
                        print('Attendance Marked for 9:45 a.m. to 10:45 a.m. lecture!!');
                        final user = {
                          UserFields.Date: '${DateTime.now()}',
                          UserFields.Name: 'Sam Saji',
                          UserFields.A945: 'P',
                        };
                        await UserSheetsApi2.insert([user]);
                      }
                      else{
                        print('Attendance cannot be marked as outside permissible limit!!');
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('11:00 a.m to 12:00 pm'),
                leading: Radio<int>(
                  value: 3,
                  groupValue: selectedOption,
                  activeColor: Colors.blue, // Change the active radio button color here
                  fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                  splashRadius: 25, // Change the splash radius when clicked
                  onChanged: (value) {
                    setState(() async{
                      selectedOption = value!;
                      print(selectedOption);
                      DateTime currentTime=DateTime.now();
                      DateTime startTime = DateTime(2023, 10, 25, 11, 00);
                      DateTime endTime = DateTime(2023, 10, 25, 12, 00);
                      bool isBeforeTime = currentTime.isBefore(endTime);
                      bool isAfterTime = currentTime.isAfter(startTime);
                      if(isBeforeTime==true && isAfterTime==true){
                        print('Attendance Marked for 11:00 a.m. to 12:0 p.m. lecture!!');
                        final user = {
                          UserFields.Date: '${DateTime.now()}',
                          UserFields.Name: 'Sam Saji',
                          UserFields.A1100: 'P',
                        };
                        await UserSheetsApi2.insert([user]);
                      }
                      else{
                        print('Attendance cannot be marked as outside permissible limit!!');
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('12:00 p.m. to 1:00 p.m.'),
                leading: Radio<int>(
                  value: 4,
                  groupValue: selectedOption,
                  activeColor: Colors.blue, // Change the active radio button color here
                  fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                  splashRadius: 25, // Change the splash radius when clicked
                  onChanged: (value) {
                    setState(() async{
                      selectedOption = value!;
                      print(selectedOption);
                      DateTime currentTime=DateTime.now();
                      DateTime startTime = DateTime(2023, 10, 25, 12, 00);
                      DateTime endTime = DateTime(2023, 10, 25, 13, 00);
                      bool isBeforeTime = currentTime.isBefore(endTime);
                      bool isAfterTime = currentTime.isAfter(startTime);
                      if(isBeforeTime==true && isAfterTime==true){
                        print('Attendance Marked for 12:0 p.m. to 1:00 p.m. lecture!!');
                        final user = {
                          UserFields.Date: '${DateTime.now()}',
                          UserFields.Name: 'Sam Saji',
                          UserFields.A1200: 'P',
                        };
                        await UserSheetsApi2.insert([user]);
                      }
                      else{
                        print('Attendance cannot be marked as outside permissible limit!!');
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('1:30 p.m. to 2:30 p.m.'),
                leading: Radio<int>(
                  value: 5,
                  groupValue: selectedOption,
                  activeColor: Colors.blue, // Change the active radio button color here
                  fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                  splashRadius: 25, // Change the splash radius when clicked
                  onChanged: (value) {
                    setState(() async{
                      selectedOption = value!;
                      print(selectedOption);
                      DateTime currentTime=DateTime.now();
                      DateTime startTime = DateTime(2023, 10, 25, 13, 30);
                      DateTime endTime = DateTime(2023, 10, 25, 14, 30);
                      bool isBeforeTime = currentTime.isBefore(endTime);
                      bool isAfterTime = currentTime.isAfter(startTime);
                      if(isBeforeTime==true && isAfterTime==true){
                        print('Attendance Marked for 1:30 p.m. to 2:30 p.m. lecture!!');
                        final user = {
                          UserFields.Date: '${DateTime.now()}',
                          UserFields.Name: 'Sam Saji',
                          UserFields.A130: 'P',
                        };
                        await UserSheetsApi2.insert([user]);
                      }
                      else{
                        print('Attendance cannot be marked as outside permissible limit!!');
                      }
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('2:30 p.m. to 3:30 p.m.'),
                leading: Radio<int>(
                  value: 6,
                  groupValue: selectedOption,
                  activeColor: Colors.blue, // Change the active radio button color here
                  fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
                  splashRadius: 25, // Change the splash radius when clicked
                  onChanged: (value) {
                    setState(() async{
                      selectedOption = value!;
                      print(selectedOption);
                      DateTime currentTime=DateTime.now();
                      DateTime startTime = DateTime(2023, 10, 25, 14, 30);
                      DateTime endTime = DateTime(2023, 10, 25, 15,30);
                      bool isBeforeTime = currentTime.isBefore(endTime);
                      bool isAfterTime = currentTime.isAfter(startTime);
                      if(isBeforeTime==true && isAfterTime==true){
                        print('Attendance Marked for 2:30 p.m. to 3:30 p.m. lecture!!');
                        final user = {
                          UserFields.Date: '${DateTime.now()}',
                          UserFields.Name: 'Sam Saji',
                          UserFields.A230: 'P',
                        };
                        await UserSheetsApi2.insert([user]);
                      }
                      else{
                        print('Attendance cannot be marked as outside permissible limit!!');
                      }
                    });
                  },
                ),
              ),
              if(selectedOption!=0)
              ElevatedButton(onPressed: ()async{
                print("OK!");



              }, child: Text("Submit Attendance"))
            ],
          ),
        ),
      ),
    );
  }
}