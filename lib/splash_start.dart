import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:delayed_display/delayed_display.dart';

import 'home.dart';

class SplashStart extends StatefulWidget {
  const SplashStart({Key? key}) : super(key: key);

  @override
  State<SplashStart> createState() => _SplashStartState();
}

class _SplashStartState extends State<SplashStart>
    with SingleTickerProviderStateMixin {
  static var myFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 15),
  );
  static var myWhiteFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 35),
  );

  static var mySmallWhiteFont = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 10));

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(30,30,30,1),
      body: Center(
        child: Column(
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: 1500),
              child: Padding(
                  padding: EdgeInsets.only(top: 120),
                child: Container(
                  child: Text("TIC TAC TOE",style: GoogleFonts.pressStart2p(
                    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 25),
                  ),),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              child: AvatarGlow(
                endRadius: 140,
                duration: Duration(milliseconds: 2000),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: Duration(milliseconds: 1),
                startDelay: Duration(seconds: 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.none),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(30, 30, 30, 1),
                    child: Container(
                      child: Image.asset("assets/images/1-removebg-preview.png",color: Colors.white,fit: BoxFit.scaleDown,),
                    ),
                    radius: 80,
                  ),
                ),

              ),
            ),
            SizedBox(
              height: 60,
            ),

            DelayedDisplay(
              delay: Duration(milliseconds: 2000),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToHomePageScreen(context);
                  },
                  child: Text("PLAY GAME",
                    style: myFont,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 2500),
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "MADE WITH ",
                      style: mySmallWhiteFont,
                    ),
                    GlowIcon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 25,
                    ),
                    Text(
                      " @SRIKRISHNA",
                      style: mySmallWhiteFont,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void _navigateToHomePageScreen(BuildContext context) {
  Navigator.push(
    context,
    PageTransition(
        alignment: Alignment.bottomCenter,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 600),
        reverseDuration: Duration(milliseconds: 600),
        type: PageTransitionType.bottomToTop,
        child: HomePage(),),
  );
}
