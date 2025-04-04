import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_o_c14/BoardArgs.dart';
import 'package:x_o_c14/board_screen.dart';
// untracked
// tracked (inside local repo)
// ignored

// commit
class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedSymbol = "x";
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/images/game.png",fit: BoxFit.cover,
                  width: double.infinity,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text("Tic-Tac-Toe",style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                    ),),
                  )

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16,left: 16,right: 16
              ),
              child: Column(
                children: [
                  TextField(
                    controller:player1Controller ,
                    decoration: InputDecoration(
                      hintText: "Player 1 name",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: player2Controller,
                    decoration: InputDecoration(
                      labelText: "Player 2 name",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Pick who goes first?",style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedSymbol = "x";
                          });
                        },

                        child: Container(
                          padding: EdgeInsets.all(29),
                          decoration: BoxDecoration(
                            color: selectedSymbol=="x"
                                ?Colors.white
                                :Colors.transparent,
                            borderRadius: BorderRadius.circular(32)
                          ),
                          child: SvgPicture.asset(
                            "assets/images/x_icon.svg"
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedSymbol = "o";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(29),
                          decoration: BoxDecoration(
                              color: selectedSymbol=="x"
                                  ?Colors.transparent
                                  :Colors.white,
                              borderRadius: BorderRadius.circular(32)
                          ),
                          child: SvgPicture.asset(
                              "assets/images/o_icon.svg"
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                      onPressed: (){
                        // navigate to board screen
                        Navigator.pushNamed(context, BoardScreen.routeName,
                            arguments: BoardArgs(
                                player1Name: player1Controller.text,
                                player2Name: player2Controller.text,
                                selectedSymbol: selectedSymbol
                            )
                        );
                      }, child: Text("Start Game"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
