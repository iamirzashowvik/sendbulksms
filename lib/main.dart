import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final _loginForm = GlobalKey<FormState>();
 SmsSender sender = new SmsSender();
  TextEditingController numbers = TextEditingController();
  List<String> x=[];
  TextEditingController code = TextEditingController();
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          body: SafeArea(
                      child: Center(
              child: Form(  key: _loginForm,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
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
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200], width: 0.0),
                                                borderRadius: BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300], width: 0.0),
                                                borderRadius: BorderRadius.circular(10)),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300], width: 0.0),
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
                                              return 'code';
                                            }

                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.white, width: 0.0),
                                                borderRadius: BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200], width: 0.0),
                                                borderRadius: BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300], width: 0.0),
                                                borderRadius: BorderRadius.circular(10)),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300], width: 0.0),
                                                borderRadius: BorderRadius.circular(10)),
                                            filled: true,
                                            border: InputBorder.none,
                                            hintText:'code',
                                          ),
                                        ),
                                      ),
                                    ),
                           Padding(
                             padding: const EdgeInsets.all(30.0),
                             child: GestureDetector(
                                    onTap: () async {
                                      if (_loginForm.currentState.validate()) {
                                        
print(numbers.text.split(' '));
print(numbers.text.length);
// int i=11;
// print('object ${numbers.text.substring(i,i+11)}');
// code.text.split(' ')
print(code.text.split(' ').length);


for(int i=0;i<numbers.text.length;i=i+11){
setState(() {
  x.add(numbers.text.substring(i,i+11));
});

}
 


                                      }}
                                      ,child: Container(color: Colors.amber,child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('do it'),
                                        ),
                                      )),),
                           ),
                                      GestureDetector(
                                  onTap: () async {
                                    if (_loginForm.currentState.validate()) {
                                      

for(int i=0;i<340;i++){
  
// String ok=numbers.text.substring(i,i+11);
  String address = x[i];
  sender.sendSms(new SmsMessage(address, 'Dear MedXYour access code for General Anatomy is ${code.text.split(' ')[i]}'));
}
 


                                    }}
                                    ,child: Container(color: Colors.amber,child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('send'),
                                      ),
                                    )),),
                 
                  ],
                ),
              ),
            ),
          ),
    )
;
  }
}
extension on String {
  // ignore: unused_element
  List<String> splitByLength(int length) =>
      [substring(0, length), substring(length)];
}