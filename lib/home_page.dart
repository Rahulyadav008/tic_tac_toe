import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///variable Declaration///

  List listDisplayOandX = ['', '', '', '', '', '', '', '', ''];
  bool xTurn = true;
  int boxFilledCount = 0;
  bool winner=false;
  int xScore=0;
  int oScore=0;

  var myNewFontWhite=GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15));

  ///methods and functions///

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  taped(inx) {
    setState(() {
      if (xTurn && listDisplayOandX[inx] == '') {
        listDisplayOandX[inx] = 'X';
        xTurn = false;
        boxFilledCount += 1;
      } else if (!xTurn && listDisplayOandX[inx] == '') {
        listDisplayOandX[inx] = 'O';
        xTurn = true;
        boxFilledCount += 1;
      }
    });
    checkWinner(inx);
  }

  ////check winner method to find the winner player//
  checkWinner(inx) {
    setState(() {
      ////1st Row condition for winning
      if (listDisplayOandX[0] == listDisplayOandX[1] &&
          listDisplayOandX[0] == listDisplayOandX[2] &&
          listDisplayOandX[0] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[0]);
      }

      ////2nd Row condition for winning
      if (listDisplayOandX[3] == listDisplayOandX[4] &&
          listDisplayOandX[3] == listDisplayOandX[5] &&
          listDisplayOandX[3] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[3]);
      }

      ////3rd Row condition for winning
      if (listDisplayOandX[6] == listDisplayOandX[7] &&
          listDisplayOandX[6] == listDisplayOandX[8] &&
          listDisplayOandX[6] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[6]);
      }

      ////1st Column condition for winning
      if (listDisplayOandX[0] == listDisplayOandX[3] &&
          listDisplayOandX[0] == listDisplayOandX[6] &&
          listDisplayOandX[0] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[0]);
      }

      ////2nd Column condition for winning
      if (listDisplayOandX[1] == listDisplayOandX[4] &&
          listDisplayOandX[1] == listDisplayOandX[7] &&
          listDisplayOandX[1] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[1]);
      }

      ////3rd Column condition for winning
      if (listDisplayOandX[2] == listDisplayOandX[5] &&
          listDisplayOandX[2] == listDisplayOandX[8] &&
          listDisplayOandX[2] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[2]);
      }

      ////1st Diagonal condition for winning
      if (listDisplayOandX[0] == listDisplayOandX[4] &&
          listDisplayOandX[0] == listDisplayOandX[8] &&
          listDisplayOandX[0] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[0]);
      }

      ////2nd Diagonal condition for winning
      if (listDisplayOandX[2] == listDisplayOandX[4] &&
          listDisplayOandX[2] == listDisplayOandX[6] &&
          listDisplayOandX[2] != '') {
        winner=true;
        _showWinDialog(listDisplayOandX[2]);
      }
      else {
        checkDrow();
      }
    });
  }

  ///User Interface///

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Score of X',style: myNewFontWhite,),
                            SizedBox(height: 16,),
                            Text(xScore.toString(),style: myNewFontWhite,)
                          ],
                        ),
                        Divider(),
                        Column(
                          children: [
                            Text('Score of O',style:myNewFontWhite),
                            SizedBox(height: 16,),
                            Text(oScore.toString(),style:myNewFontWhite)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 6,
                  child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 9,
                      shrinkWrap: true,
                      itemBuilder: (context, inx) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                taped(inx);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              height: 200,
                              width: 200,
                              child: Center(
                                  child: Text(
                                    '${listDisplayOandX[inx]}',
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ));
                      }),
                ),
                Expanded(flex: 2,child: Center(child: Column(
                  children: [
                    Text('TIC TAC TOI',style: myNewFontWhite,),
                    SizedBox(height: 30,),
                    Text('DevelopedBy@TechTefo',style: myNewFontWhite.copyWith(fontSize: 14),),
                  ],
                )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showWinDialog(String winnerPlayer) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Winner is Player :- $winnerPlayer',
          ),
          actions: <Widget>[
            TextButton(onPressed: () {
              boxFilledCount=0;
              winner=false;
              setState(() {
                if(winnerPlayer=='X'){
                  xScore+=1;
                }else{
                  oScore+=1;
                }
                for(int i=0;i<=8;i++){
                  listDisplayOandX[i]='';
                }
                Navigator.pop(context);
              });
            }, child: Text('play Again'))
          ],

        );
      },);
  }

  void _showDrowDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Mach Drow'),
            actions: [TextButton(onPressed: (){
              setState(() {
                boxFilledCount=0;
                winner=false;
              });
              Navigator.pop(context);
            }, child: Text('Play Again'))],
          );
        });
  }

  void checkDrow() {
    if(boxFilledCount==listDisplayOandX.length && winner==false){
      _showDrowDialog();
    }
  }
}