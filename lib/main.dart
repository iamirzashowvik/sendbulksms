import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:sms/sms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _loginForm = GlobalKey<FormState>();
  SmsSender sender = new SmsSender();
  TextEditingController numbers = TextEditingController();
  List<String> x = [];
  TextEditingController code = TextEditingController();
  int count = 0;
  bool sendPermission=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _loginForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: numbers,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'numbers';
                        }

                        return null;
                      },
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[200], width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red[300], width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red[300], width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'numbers',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: code,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'message';
                        }

                        return null;
                      },
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[200], width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red[300], width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red[300], width: 0.0),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Message',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        numbers.clear();
                        code.clear();
                        count = 0;
                        sendPermission=false;
                      });
                    },
                    child: Text('Clear Text')),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (_loginForm.currentState.validate()) {
                        print(numbers.text.split(' '));
                        print(numbers.text.length);

                        //print(code.text.split(' ').length);
                        if (numbers.text.length % 11 != 0) {
                          print('ki');
                          Get.snackbar('Phone numbers are wrong',
                              'ex: 017104270950164481915701710000000');
                        } else {
                          setState(() {
                            sendPermission=true;
                          });
                          print('kok');
                          for (int i = 0; i < numbers.text.length; i = i + 11) {
                            setState(() {
                              x.add(numbers.text.substring(i, i + 11));
                              count++;
                            });
                          }
                        }
                      }
                    },
                    child: Container(
                        color: Colors.amber,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(sendPermission?'Accepted':'Analysis Numbers'),
                          ),
                        )),
                  ),
                ),
               sendPermission? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      int timer=code.text.split(' ').length;
                      if (_loginForm.currentState.validate()) {EasyLoading.show(status: 'Please wait $timer Seconds');
                        for (int i = 0; i < code.text.split(' ').length; i++) {
                          String address = x[i];
                          sender.sendSms(new SmsMessage(
                              address,
                              // 'Dear user,this is your code ${code.text.split(' ')[i]}')); //important for different text
                              'Dear user,this is your code ${code.text}'));
                          await Future.delayed(Duration(seconds: 1));

                        }
                      EasyLoading.dismiss();
                        Get.snackbar("Congratulations", "You have sent all the texts.");
                      }
                    },
                    child: Container(
                        color: Colors.amber,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Send Sms Now'),
                          ),
                        )),
                  ),
                ):Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on String {
  // ignore: unused_element
  List<String> splitByLength(int length) =>
      [substring(0, length), substring(length)];
}
