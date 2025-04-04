import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_o_c14/BoardArgs.dart';
import 'package:x_o_c14/BoardBtn.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = "board";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int player1Score = 0;

  int player2Score = 0;

  String message = "Player's 1 Turn";

  List<String> boardState = [
    "","","",
    "","","",
    "","",""
  ];
  late String selectedSymbol;
  late String player2Symbol;
  @override
  Widget build(BuildContext context) {
    BoardArgs args = ModalRoute.of(context)!.settings.arguments as BoardArgs;
    selectedSymbol = args.selectedSymbol;
    player2Symbol = selectedSymbol=="x"?"o":"x";
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff00D2FF),
                Color(0xff3A7BD5)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 16
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(args.player1Name,style: TextStyle(
                            fontSize: 20
                        )),
                        Text(player1Score.toString(),style: TextStyle(
                            fontSize: 20
                        )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(args.player2Name,style: TextStyle(
                          fontSize: 20
                        ),),
                        Text(player2Score.toString(),style: TextStyle(
                            fontSize: 20
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32,),
              Text(message,style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: Colors.white
              ),),
              SizedBox(height: 32,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 22
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44)
                  ),
                  child: Column(children: [
                    Expanded(
                      child: Row(
                        children: [
                          BoardBtn(
                            symbol: boardState[0],
                            onClick: onBoardBtnClick,
                            index: 0,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          BoardBtn(
                            symbol: boardState[1],
                            onClick: onBoardBtnClick,
                            index: 1,

                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          BoardBtn(
                            symbol: boardState[2],
                            onClick: onBoardBtnClick,
                            index: 2,

                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 0,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          BoardBtn(
                            symbol: boardState[3],
                            onClick: onBoardBtnClick,
                            index: 3,

                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          BoardBtn(
                            symbol: boardState[4],
                            onClick: onBoardBtnClick,
                            index: 4,

                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          BoardBtn(
                            symbol: boardState[5],
                            onClick: onBoardBtnClick,
                            index: 5,

                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 0,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          BoardBtn(
                            symbol: boardState[6],
                            onClick: onBoardBtnClick,
                            index: 6,

                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          BoardBtn(
                            symbol: boardState[7],
                            onClick: onBoardBtnClick,
                            index: 7,

                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          BoardBtn(
                            symbol: boardState[8],
                            onClick: onBoardBtnClick,
                            index: 8,
                          ),
                        ],
                      ),
                    ),
                  ],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // 1 3 5 7 9              x
  // 2 4 6 8
  int counter = 1;
  onBoardBtnClick(int index){
    setState(() {
      if(boardState[index].isNotEmpty){
        return;
      }
      if(counter.isOdd){
        boardState[index] = selectedSymbol;
        if(checkWinner(selectedSymbol)){
          player1Score+=10;
          message = "Player 1 win";
          resetGame();
          return ;
        }
        message = "Player's 2 Turn";
      }else{
        boardState[index] = player2Symbol;
        if(checkWinner(player2Symbol)){
          player2Score+=10;
          resetGame();
          message = "Player 2 win";
          return ;
        }
        message = "Player's 1 Turn";
      }
      if(counter==9){
        message = "Draw";
        resetGame();
        return;
      }
      counter++;

    });
  }
  bool checkWinner(String symbol){
    if(boardState[0]==symbol && boardState[1]==symbol && boardState[2]==symbol){
      return true;
    }
    if(boardState[3]==symbol && boardState[4]==symbol && boardState[5]==symbol){
      return true;
    }
    if(boardState[6]==symbol && boardState[7]==symbol && boardState[8]==symbol){
      return true;
    }
    if(boardState[0]==symbol && boardState[3]==symbol && boardState[6]==symbol){
      return true;
    }
    if(boardState[1]==symbol && boardState[4]==symbol && boardState[7]==symbol){
      return true;
    }
    if(boardState[2]==symbol && boardState[5]==symbol && boardState[8]==symbol){
      return true;
    }
    if(boardState[0]==symbol && boardState[4]==symbol && boardState[8]==symbol){
      return true;
    }
    if(boardState[2]==symbol && boardState[4]==symbol && boardState[6]==symbol){
      return true;
    }
    return false;
  }
  resetGame(){
    counter = 1;
    boardState = [
      "","","",
      "","","",
      "","",""
    ];
  }
}
