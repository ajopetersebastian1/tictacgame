import 'dart:ffi';

import 'package:get/get.dart';

enum Player { O, X }

class GameController extends GetxController {
  var currPlayer = Player.X;
  int clickCount = 0;
  List<String> gameMatrix = ['', '', '', '', '', '', '', '', ''].obs;
  RxString winner = ''.obs;
  bool _gameOver = false;
      bool isComputerMoved=false;

  void handleTileClick(int index) {
    if (!_gameOver && gameMatrix[index] == '') {
      if (currPlayer == Player.O) {
        gameMatrix[index] = 'O';
        currPlayer = Player.X;
      } else if (currPlayer == Player.X) {
        gameMatrix[index] = 'X';
        currPlayer = Player.O;
      }

      if (checkWinner('O')) {
        winner.value = "player O Win";
        _gameOver = true;
        //clearMatrix();
      }
      if (checkWinner('X')) {
        winner.value = "player X Win";
        _gameOver = true;
        //clearMatrix();
      }
      if (!_gameOver) {
        print("Computer move");
      }
      computersMove();
      notifyChildrens();
    }
  }

  bool checkWinner(String char) {
    if ((gameMatrix[0] == gameMatrix[1] &&
        gameMatrix[1] == gameMatrix[2] &&
        gameMatrix[0] == char)) {
      return true;
    }

    if (gameMatrix[3] == gameMatrix[4] &&
        gameMatrix[4] == gameMatrix[5] &&
        gameMatrix[3] == char) {
      return true;
    }
    if (gameMatrix[6] == gameMatrix[7] &&
        gameMatrix[7] == gameMatrix[8] &&
        gameMatrix[6] == char) {
      return true;
    }

    if ((gameMatrix[0] == gameMatrix[3] &&
        gameMatrix[3] == gameMatrix[6] &&
        gameMatrix[0] == char)) {
      return true;
    }

    if (gameMatrix[1] == gameMatrix[4] &&
        gameMatrix[4] == gameMatrix[7] &&
        gameMatrix[1] == char) {
      return true;
    }
    if (gameMatrix[2] == gameMatrix[5] &&
        gameMatrix[5] == gameMatrix[8] &&
        gameMatrix[2] == char) {
      return true;
    }

    if ((gameMatrix[0] == gameMatrix[4] &&
        gameMatrix[4] == gameMatrix[8] &&
        gameMatrix[0] == char)) {
      return true;
    }

    if (gameMatrix[2] == gameMatrix[4] &&
        gameMatrix[4] == gameMatrix[6] &&
        gameMatrix[2] == char) {
      return true;
    }

    return false;
  }

  void clearMatrix() {
    if (_gameOver) {
      for (var i = 0; i < 9; i++) {
        gameMatrix[i] = '';
      }
    }
    _gameOver = false;
    winner.value = '';
    currPlayer = Player.X;
    isComputerMoved=false;
    notifyChildrens();
  }

  void restart() {
    for (var i = 0; i < 9; i++) {
      gameMatrix[i] = '';
    }
    winner.value = '';
    _gameOver = false;
    currPlayer = Player.X;isComputerMoved=false;
    notifyChildrens();
  }

  void computersMove() {
    // if (gameMatrix[0] == gameMatrix[1] && gameMatrix[0] == 'X') {
    //   if (gameMatrix[2] == '') {
    //     gameMatrix[2] = 'O';
    //   }
    // }

    computerRowmove(0);
    computerRowmove(3);
    computerRowmove(6);
    computerColumMove(0);
    computerColumMove(1);
    computerColumMove(2);
    computerDiagMove();


    
if(!isComputerMoved){
      for(var i=0;i<9;i++){
      if(gameMatrix[i]==''){
        gameMatrix[i]='O';
        isComputerMoved=true;
        currPlayer=Player.X;
        break;
      }
    }
}

    // for(var i=0;i<9;i++){
    //   gameMatrix[i]==
    // }


    currPlayer=Player.X;
  }

  computerRowmove(int i) {
    if (gameMatrix[i] == gameMatrix[i + 1] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 2] == ''&&gameMatrix[i + 2] != 'O') {
        gameMatrix[i + 2] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }

    if (gameMatrix[i] == gameMatrix[i + 2] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 1] == ''&&gameMatrix[i + 1] != 'O') {
        gameMatrix[i + 1] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }
     if (gameMatrix[i + 1] == gameMatrix[i + 2] && gameMatrix[i + 1] == 'X') {
        if (gameMatrix[i] == ''&&gameMatrix[i] != 'O') {
          gameMatrix[i] = 'O';
          currPlayer = Player.X;
           isComputerMoved=true;
        }
        
      }
  }

  computerColumMove(int i) {
    if (gameMatrix[i] == gameMatrix[i + 3] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 6] == ''&&gameMatrix[i + 6] != 'O') {
        gameMatrix[i + 6] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }

      if (gameMatrix[i] == gameMatrix[i + 6] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 3] == ''&&gameMatrix[i + 3] != 'O') {
        gameMatrix[i + 3] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }
      if (gameMatrix[i+3] == gameMatrix[i + 6] && gameMatrix[i+3] == 'X') {
      if (gameMatrix[i] == ''&&gameMatrix[i] != 'O') {
        gameMatrix[i] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }
  }
computerDiagMove(){

        if (gameMatrix[0] == gameMatrix[4] && gameMatrix[0] == 'X') {
      if (gameMatrix[8] == '') {
        gameMatrix[8] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }

    
        if (gameMatrix[4] == gameMatrix[8] && gameMatrix[4] == 'X') {
      if (gameMatrix[0] == '') {
        gameMatrix[0] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }

            if (gameMatrix[0] == gameMatrix[8] && gameMatrix[0] == 'X') {
      if (gameMatrix[4] == '') {
        gameMatrix[4] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }



            if (gameMatrix[2] == gameMatrix[4] && gameMatrix[2] == 'X') {
      if (gameMatrix[6] == '') {
        gameMatrix[6] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }

    
        if (gameMatrix[2] == gameMatrix[6] && gameMatrix[2] == 'X') {
      if (gameMatrix[4] == '') {
        gameMatrix[4] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }

            if (gameMatrix[4] == gameMatrix[6] && gameMatrix[4] == 'X') {
      if (gameMatrix[2] == '') {
        gameMatrix[2] = 'O';
        currPlayer = Player.X;
         isComputerMoved=true;
      }
    }

}


  
}
