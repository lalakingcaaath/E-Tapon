import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:clipboard/clipboard.dart';
import 'package:url_launcher/url_launcher.dart';

class Campus extends StatefulWidget {
  const Campus({Key? key}) : super(key: key);

  @override
  State<Campus> createState() => _CampusState();
}

class _CampusState extends State<Campus> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final databaseRef = FirebaseDatabase.instance.ref();
  final lastBinThreshold = 1;
  final batteryThreshold = 20;
  final batteryPartial = 75;
  final batteryFull = 100;
  bool BinThresholdReached = false;
  bool batteryThresholdReached = false;
  bool batteryPar = false;
  bool batteryFul = false;

  DatabaseReference ref = FirebaseDatabase.instance.ref("ITECH");
  double _batteryPercent1 = 0;
  String _batteryValue = '';
  double _bin1 = 0;
  double _bin2 = 0;
  String binDate1 = 'BinDate1';
  String binDate2 = 'BinDate2';
  String _token = '';
  int metalObjects = 0;
  int nonbioOjects = 0;
  String _binStatus1 = 'No';
  String _binStatus2 = 'No';

  final Uri _url = Uri.parse("https://etaponcloud.azurewebsites.net/download_pdf");

  Timer? _timer;

  Future<void> _launchUrl() async {
    if(!await launchUrl(_url,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(),
    )) {
      throw Exception("Could not launch $_url");
    }
  }

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.getToken().then((token) {
      print('onMessage: $token');
      setState(() {
        _token = token!;
      });
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageL $message");
    });

    _database.ref().child('ITECH/battery1').onValue.listen((event) {
      var value = event.snapshot.value;
      if(value != null) {
        setState(() {
          _batteryValue = value.toString();
        });
      }
      else{
        _batteryValue = '';
      }
    });

    _database.ref().child('ITECH/bin1').onValue.listen((event) {
      var value = event.snapshot.value;
      if(value != null){
        if(value == 0 || value == 1) {
          setState(() {
            _binStatus1 = value == 1 ? 'Yes' : 'No';
          });
        } else {
          setState(() {
            _binStatus1 = 'Invalid Value';
          });
        }
      } else {
        setState(() {
          _binStatus1 = 'No Data';
        });
      }
    });

    _database.ref().child('ITECH/bin2').onValue.listen((event) {
      var value = event.snapshot.value;
      if(value != null){
        if(value == 0 || value == 1) {
          setState(() {
            _binStatus2 = value == 1 ? 'Yes' : 'No';
          });
        } else {
          setState(() {
            _binStatus2 = 'Invalid Value';
          });
        }
      } else {
        setState(() {
          _binStatus2 = 'No Data';
        });
      }
    });

    _database.ref().child('ITECH/metalObjects').onValue.listen((event) {
      var value = event.snapshot.value;
      if(value != null) {
        setState(() {
          metalObjects = int.parse(value.toString());
        });
      } else {
        setState(() {
          metalObjects = 0;
        });
      }
    });

    _database.ref().child('ITECH/nonbioObjects').onValue.listen((event) {
      var value = event.snapshot.value;
      if(value != null) {
        setState(() {
          nonbioOjects = int.parse(value.toString());
        });
      } else {
        setState(() {
          nonbioOjects = 0;
        });
      }
    });

    var initializationSettingsAndroid =
    AndroidInitializationSettings("@drawable/ic_stat_logo");
    var initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      checkTreshold();
    });
  }

  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void checkTreshold() {
    if(_binStatus1 == 'Yes' && !BinThresholdReached){
      BinThresholdReached = true;
      _showNotification();
    }
    else if(_binStatus2 == 'Yes' && !BinThresholdReached){
      BinThresholdReached = true;
      _showNotification();
    }
  }

  void _showNotification() async {
    var message = '';
    if(_binStatus1 != null && _binStatus1 == 'Yes'){
      message = 'Garbage Bin 1 is now 100% full!';
    }
    else if(_binStatus2 != null && _binStatus2 == 'Yes'){
      message = 'Garbage Bin 2 is now 100% full!';
    }

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "Channel ID",
        "Channel Name",
        channelDescription: "Channel Description",
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker'
    );
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics
    );
    await flutterLocalNotificationsPlugin.show(
        0,
        'E-Tapon',
        message,
        platformChannelSpecifics,
        payload: 'item x'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: const Text('Metal Bin',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                        child: const Text('Non-Metal Bin',
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                        child: InkWell(
                          onTap: (){
                            var now = DateTime.now();
                            var formatter = new DateFormat('yyyy-MM-dd hh:mm:ss');
                            String formattedDate = formatter.format(now);
                            databaseRef.child(binDate1).push().set({
                              'Date': formattedDate,
                            });
                            databaseRef.child('ITECH').update({
                              'bin1': _bin1 = 0
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content:
                                Text('Bin 1 has been collected!'),
                                )
                            );
                          },
                          child: Center(
                            child: Image.asset('images/trash.png',
                              height: 70,
                            ),
                          ),
                        )
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: InkWell(
                          onTap: (){
                            var now = DateTime.now();
                            var formatter = new DateFormat('yyyy-MM-dd hh:mm:ss');
                            String formattedDate = formatter.format(now);
                            databaseRef.child(binDate2).push().set({
                              'Date': formattedDate,
                            });
                            databaseRef.child('ITECH').update({
                              'bin2': _bin2 = 0
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content:
                                Text('Bin 2 has been collected!'),
                                )
                            );
                          },
                          child: Center(
                            child: Image.asset('images/trash.png',
                              height: 70,
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('No. of objects: $metalObjects',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                        child: Text('No. of objects: $nonbioOjects',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('Is full: $_binStatus1',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                        child: Text('Is full: $_binStatus2',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Battery',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/battery1.png',
                    height: 70,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Battery Level: $_batteryValue%',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: _launchUrl,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  )
                              )
                          ),
                          child: Text("Generate Logs"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () async {
                            FlutterClipboard.copy(_token);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  )
                              )
                          ),
                          child: Text("Get Token"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
