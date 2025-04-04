import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoardBtn extends StatelessWidget {
  String symbol; // "" , "x" , "o"
  void Function(int) onClick;
  int index;
  BoardBtn({required this.symbol,required this.onClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          // change boardstate
          onClick(index);
        },
        child: Container(
          padding: EdgeInsets.all(18),
          child: symbol.isEmpty
              ?null
              :SvgPicture.asset(symbol=="x"
              ?"assets/images/x_icon.svg"
              :"assets/images/o_icon.svg"),
        ),
      ),
    );
  }
}
