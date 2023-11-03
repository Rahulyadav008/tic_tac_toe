import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var myNewFontWhite=GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15));



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Colors.grey[900],
        body: Column(children: [
        Expanded(flex: 2,child: Center(child: Text('TIC TAC TOI',style: myNewFontWhite.copyWith(fontSize: 25),))),
          Expanded(flex:4,child: AvatarGlow(endRadius: 150,
          child: CircleAvatar(backgroundColor: Colors.red,radius: 90,child: ClipRRect(borderRadius: BorderRadius.circular(90),child: Image.asset('lib/images/tt.png',fit: BoxFit.scaleDown,)),))),
          Expanded(flex: 2,child: Column(
            children: [
              Text('DevelopedBy@TechTefo',style: myNewFontWhite.copyWith(fontSize: 14),),
              SizedBox(height: 60,),
              Center(child: InkWell(onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyHomePage()));
              } ,
                  child: Container(height: 50,width: MediaQuery.of(context).size.width/1.25,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),child: Center(child: Text('Start Game',style: myNewFontWhite.copyWith(fontSize: 15,color: Colors.black),))))),
            ],
          )),

        ],),

      ),
    );
  }
}
