import 'dart:math';
import 'package:qr_flutter/qr_flutter.dart';
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
              FlipperWidget(),
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

class FlipperWidget extends StatefulWidget {
  @override
  _FlipperWidgetState createState() => _FlipperWidgetState();
}

class _FlipperWidgetState extends State<FlipperWidget>
    with SingleTickerProviderStateMixin {
  bool reversed = false;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -pi / 2), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: pi / 2, end: 0.0), weight: 0.5)
    ]).animate(_animationController);
  }

  _doAnim() {
    if (!mounted) return;
    if (reversed) {
      _animationController.reverse();
      reversed = false;
    } else {
      _animationController.forward();
      reversed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(_animation.value),
        child: GestureDetector(
          onTap: _doAnim,
          child: IndexedStack(
            children: <Widget>[CardOne(), CardTwo()],
            alignment: Alignment.center,
            index: _animationController.value < 0.5 ? 0 : 1,
          ),
        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 219,
      height: 219,
      decoration: const BoxDecoration(
          color: Color(0xff8bcff4),
          borderRadius: BorderRadius.all(Radius.circular(25))),
    );
  }
}

class CardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 219,
        height: 219,
        decoration: const BoxDecoration(
            color: Color(0xff8bcff4),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
            child: QrImage(
          data: "https://www.linkedin.com/in/максим-чепурных-84476b205/",
          version: QrVersions.auto,
          size: 190.0,
          backgroundColor: Colors.white,
        )));
  }
}
