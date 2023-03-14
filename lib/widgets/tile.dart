import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac/screen/home_screen/controller/game_controller.dart';

class Tile extends StatelessWidget {

  final int index;
  final GameController controller;
  const Tile({super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
          return InkWell(
            onTap: ()=>controller.handleTileClick(index),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),
              color: Colors.blue),
              child:Center(
                child: Text(controller.gameMatrix[index],
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.red,
                ),),
              ),
            ),
          );
        }
      ),
    );
  }


  // String updatePlayer(){
  //   if(controller.gameMatrix[index]=='X'){
  //     return 'X';
  //   }else if(controller.gameMatrix[index]=='O'){
  //     return 'O';
  //   }
  //   return '';

  // }
}