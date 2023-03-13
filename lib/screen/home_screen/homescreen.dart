import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac/screen/home_screen/controller/game_controller.dart';
import 'package:tic_tac/widgets/tile.dart';

class HomeScreen extends StatelessWidget {
  final GameController _controller=Get.put(GameController());
 HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Column(
        children: [

  
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return Tile(index: index, FunClick: () {},controller: _controller,);
              },
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () { _controller.clearMatrix();},
                child: Text('start Again'),
              ), SizedBox(width: 30),
                            ElevatedButton(
                onPressed: () { _controller.restart();},
                child: Text('Restart'),
              ),
            ],
          ),
                  Obx(() {
              return Text("${_controller.winner.value}", style: TextStyle(fontSize: 24,color: Colors.red,fontWeight: FontWeight.bold),);
            }
          ),
        ],
      ),
    );
  }
}
