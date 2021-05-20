

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

Color kblue=Colors.blueAccent;
class Dev extends StatefulWidget { final ChromeSafariBrowser browser = new MyChromeSafariBrowser();


@override
_DevState createState() => _DevState();
}

class _DevState extends State<Dev> {

  @override
  void initState() {widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
      id: 1,
      label: 'Custom item menu 1',
      action: (url, title) {
        print('Custom item menu 1 clicked!');
      }));
  // TODO: implement initState
  super.initState();
  }Future<void> _launched;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'showvikmirza@gmail.com',
      queryParameters: {
        'subject': 'DevSupport'
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: NetworkImage('https://i.pinimg.com/originals/1b/8b/5e/1b8b5eb487350a6a547e4f3fe1ada0fc.jpg'),radius: 150,),
              // Image.network('https://i.pinimg.com/originals/1b/8b/5e/1b8b5eb487350a6a547e4f3fe1ada0fc.jpg',height: ,),
              Text('Mirza Showvik',
                  // minFontSize: 12,
                  // maxLines: 3,

                  style: TextStyle(
                    fontSize: 35,
                    color: kblue,
                    fontFamily: 'Gilroy',
                  )),
              Text('Software Developer',
                  // minFontSize: 12,
                  // maxLines: 3,

                  style: TextStyle(
                    fontSize: 25,
                    color: kblue,
                    fontFamily: 'Gilroy',
                  )),
              Text('Bangladesh University of Textiles',

                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    //  fontSize: 15,
                    color: kblue,
                    fontFamily: 'Gilroy',
                  )),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: ()async{
                        await widget.browser.open(
                            url: Uri.parse('https://www.facebook.com/mirzashowvik/'),
                            options: ChromeSafariBrowserClassOptions(
                                android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: false),
                                ios: IOSSafariOptions(
                                    barCollapsingEnabled: true)));

                      },
                      child: Container(
                        height:50,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: kblue.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Facebook'),
                              Icon(
                                FontAwesomeIcons.facebookSquare,
                                color: kblue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: ()async{
                        await widget.browser.open(
                            url: Uri.parse('https://github.com/iamirzashowvik'),
                            options: ChromeSafariBrowserClassOptions(
                                android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: false),
                                ios: IOSSafariOptions(
                                    barCollapsingEnabled: true)));

                      },
                      child: Container(
                        height:50,width: 120,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: kblue.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Github'),
                              Icon(
                                FontAwesomeIcons.github,
                                //color: kblue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: ()async{
                        launch(_emailLaunchUri.toString());
                      },
                      child: Container(
                        height:50,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: kblue.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Mail'),
                              Icon(
                                FontAwesomeIcons.mailBulk,
                                color: kblue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: ()async{
                        await widget.browser.open(
                            url: Uri.parse('https://t.me/mirzaShowvik'),
                            options: ChromeSafariBrowserClassOptions(
                                android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: false),
                                ios: IOSSafariOptions(
                                    barCollapsingEnabled: true)));

                      },
                      child: Container(
                        height:50,width: 120,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: kblue.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Telegram'),
                              Icon(
                                FontAwesomeIcons.telegram,
                                //color: kblue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _makePhoneCall('tel:+8801710427095');
                }),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('01710427095'),
                      Icon(
                        FontAwesomeIcons.phone,
                        //color: kblue,
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
