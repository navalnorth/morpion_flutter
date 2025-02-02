import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morpion/homepage.dart';



class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}



class _IntroScreenState extends State<IntroScreen> {
    static var myFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.black, letterSpacing: 3)
  );
  static var myFontWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text(
                  "LE MORPION",
                  style: myFontWhite.copyWith(fontSize: 30),
                ),
              )
            ),

            Expanded(
              flex: 2,
              child: AvatarGlow(
                duration: const Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                startDelay: const Duration(seconds: 1),
                glowCount: 1,
                
              
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.none
                    ),
                    shape: BoxShape.circle
                  ),
              
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    radius: 60,
                    child: Image.asset(
                      "assets/splash.png", 
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              )
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Crée par @navalnorth",
                  style: myFontWhite.copyWith(fontSize: 12),
                ),
              )
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 15, horizontal: 30))
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                }, 
                child: Text(
                  "JOUER",
                  style: myFont,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}