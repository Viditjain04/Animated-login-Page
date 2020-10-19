import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      color: Colors.grey,
      theme: ThemeData(primaryColor: Colors.grey, accentColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.bounceInOut)));
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.easeInBack)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white60,
          body: Align(
            alignment: Alignment.center,
            child: Container(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(
                          animation.value * width, 0.0, 0.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20.0, bottom: 30.0, top: 10.0),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 50.0),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0.0, 0.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                              margin: EdgeInsets.all(10.0),
                              child: TextField(
                                obscureText: false,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.emailAddress,
                                maxLength: 15,
                                decoration: InputDecoration(
                                  hintText: "Email id",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                  isDense: true,
                                  suffixText: ".com",
                                  labelText: "Email",
                                  fillColor: Colors.deepPurple,
                                  icon: Icon(Icons.email),
                                ),
                              ),
                              color: Colors.deepPurpleAccent),
                          Card(
                            margin: EdgeInsets.all(10.0),
                            color: Colors.deepPurpleAccent,
                            child: TextField(
                              obscureText: true,
                              keyboardType: TextInputType.phone,
                              maxLength: 8,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                                labelText: "Password",
                                hintText: "password",
                                fillColor: Colors.deepPurple,
                                icon: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          animation.value * width, 0.0, 0.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 20.0, left: 250),
                            transform: Matrix4.translationValues(
                                animation.value * width, 0.0, 0.0),
                            child: InkWell(
                              enableFeedback: true,
                              splashFactory: InkSplash.splashFactory,
                              child: Text('forgot password'),
                              onTap: () {},
                            ),
                          ),
                          Container(
                              transform: Matrix4.translationValues(
                                  0.0, animation.value * width, 0.0),
                              child: FlatButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22.0),
                                ),
                                onPressed: () {},
                                splashColor: Colors.white,
                                colorBrightness: Brightness.dark,
                                color: Colors.yellowAccent,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
