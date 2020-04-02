import 'package:flutter/material.dart';
import 'package:screen1/FadeAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:screen1/HomePage.dart';

class StarterPage extends StatefulWidget {
  StarterPage({Key key}) : super(key: key);

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then((f) => {
          Navigator.push(
              context,
              PageTransition(
                child: HomePage(),
                type: PageTransitionType.fade,
              ))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/one.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ], begin: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  0.5,
                  Text(
                    'Taking Order For Deloivery',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  0.8,
                  Text(
                    'Discover the most beautiful \ncostumes in the world',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  1.4,
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.yellow,
                          Colors.orange,
                        ]),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 50),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () => _onTap(),
                          child: Text(
                            'Start',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  1.6,
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 50),
                    opacity: _textVisible ? 1.0 : 0.0,
                    child: Align(
                      child: Text(
                        'Now Deliver To Your Door 24/7',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
