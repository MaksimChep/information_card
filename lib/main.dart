import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xffe1f4ff),
          body: SafeArea(
              child: Column(
            children: [
              const BackgroundStack(),
              const Spacer(),
              Container(
                  width: 219,
                  height: 219,
                  decoration: const BoxDecoration(
                      color: Color(0xff8bcff4),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Image(
                    image: AssetImage('assets/images/img_qrcode.png'),
                    alignment: Alignment.center,
                  )),
              const Spacer(flex: 4),
              Container(
                  height: 48,
                  width: 312,
                  decoration: BoxDecoration(
                      color: const Color(0xffc0fde7),
                      border:
                          Border.all(width: 2, color: const Color(0xff13c67b))),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Image(
                              image: AssetImage('assets/images/ic_phone.png')),
                          flex: 1),
                      const Expanded(
                          child: Text('+38 066 541 13 62',
                              style: TextStyle(
                                  color: Color(0xff139d64),
                                  fontSize: 22,
                                  fontFamily: 'Roboto')),
                          flex: 5)
                    ],
                  )),
              const Spacer(),
              Container(
                  height: 48,
                  width: 312,
                  decoration: BoxDecoration(
                      color: const Color(0xffffd7fb),
                      border:
                          Border.all(width: 2, color: const Color(0xffe0083c))),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Image(
                              image: AssetImage('assets/images/ic_email.png')),
                          flex: 1),
                      const Expanded(
                          child: Text('chepurnyh05@gmail.com',
                              style: TextStyle(
                                  color: Color(0xffc90938),
                                  fontSize: 22,
                                  fontFamily: 'Roboto')),
                          flex: 5)
                    ],
                  )),
              const Spacer(flex: 2)
            ],
          ))),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/images/bg_top_rectangle.png'),
              fit: BoxFit.fill,
            )),
        const Positioned(
            left: 30,
            top: 3,
            child: Text(
              'MyCard',
              style: TextStyle(
                  color: Color(0xff3b5ba4),
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Roboto'),
            )),
        const Positioned(
            left: 6,
            top: 32,
            child: Image(image: AssetImage('assets/images/bg_wave.png'))),
        const Positioned(
            top: 56,
            child: Image(image: AssetImage('assets/images/bg_top_line.png'))),
      ],
    );
  }
}
