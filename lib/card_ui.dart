import 'package:card_play/models/card_play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CardUi extends StatefulWidget {
  const CardUi({super.key});

  @override
  State<CardUi> createState() => _CardUiState();
}

CardPlay cardPlay = CardPlay(0, 0, 0, 2, 2, 0);

class _CardUiState extends State<CardUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',
                  scale: 4,
                ),
                Text('Magic Game!',style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                        Flexible(
                          child: Image.asset('assets/images/card_${cardPlay.leftCardNumber}.png',
                            scale: 4,
                          ),
                        ),
                        Flexible(
                          child: Image.asset('assets/images/card_${cardPlay.rightCardNumber}.png',
                            scale: 4,
                          ),
                        ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                CupertinoButton(
                  onPressed: (){
                    setState(() {
                      cardPlay.changeCardNumber();
                      cardPlay.updateResult();

                      if(cardPlay.totalPlayed == 20) {
                        if(cardPlay.playerScore > cardPlay.computerScore) {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'Player is win!',
                              btnOkOnPress: () {
                                setState(() {});
                                cardPlay.playAgain();
                              },
                          )..show();
                        }
                        else if(cardPlay.playerScore < cardPlay.computerScore) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Computer is win!',
                            btnOkOnPress: () {
                              setState(() {});
                              cardPlay.playAgain();
                            },
                          )..show();
                        }
                        else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Match is drawn!',
                            btnOkOnPress: () {
                              setState(() {});
                              cardPlay.playAgain();
                            },
                          )..show();
                        }
                      }
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red.shade800,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text('Deal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Player Score',style: TextStyle(
                            fontSize: 18,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold
                        ),),
                        Text('${cardPlay.playerScore}',style: TextStyle(
                            fontSize: 18,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Tie Score',style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey.shade800,
                            fontWeight: FontWeight.bold
                        ),),
                        Text('${cardPlay.tieScore}',style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey.shade800,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Computer Score',style: TextStyle(
                            fontSize: 18,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold
                        ),),
                        Text('${cardPlay.computerScore}',style: TextStyle(
                            fontSize: 18,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                Text('How many times are magic game played = ${cardPlay.totalPlayed}',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),),
                SizedBox(
                  height: 24,
                ),
                CupertinoButton(
                  onPressed: (){
                    setState(() {});
                    cardPlay.playAgain();
                  },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text('Restart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
