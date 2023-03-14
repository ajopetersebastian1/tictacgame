import 'package:get/get.dart';

enum Player { O, X }

class GameController extends GetxController {
  var currPlayer = Player.X;
  int clickCount = 0;
  List<String> gameMatrix = ['', '', '', '', '', '', '', '', ''].obs;
  RxString winner = ''.obs;
  bool _gameOver = false;

  void handleTileClick(int index) {
    if (!_gameOver && gameMatrix[index] == '') {
      if (currPlayer == Player.O) {
        gameMatrix[index] = 'O';
        currPlayer = Player.X;
      } else if (currPlayer == Player.X) {
        gameMatrix[index] = 'X';
        currPlayer = Player.O;
      }
      computersMove();
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
    notifyChildrens();
  }

  void restart() {
    for (var i = 0; i < 9; i++) {
      gameMatrix[i] = '';
    }
    winner.value = '';
    _gameOver = false;
    currPlayer = Player.X;
    notifyChildrens();
  }

  void computersMove() {
    computerDiagMove();
    computerRowmove(0);
    computerRowmove(3);
    computerRowmove(6);
    computerColumMove(0);
    computerColumMove(1);
    computerColumMove(2);
  

    if (currPlayer==Player.O) {
      for (var i = 0; i < 9; i++) {
        if (gameMatrix[i] == '') {
          gameMatrix[i] = 'O';
          currPlayer = Player.X;
          break;
        }
      }
    }

    currPlayer = Player.X;
  }

  computerRowmove(int i) {
    if (gameMatrix[i] == gameMatrix[i + 1] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 2] == '' && currPlayer==Player.O) {
        gameMatrix[i + 2] = 'O';
        currPlayer = Player.X;
      }
    }

    if (gameMatrix[i] == gameMatrix[i + 2] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 1] == '' && currPlayer==Player.O) {
        gameMatrix[i + 1] = 'O';
        currPlayer = Player.X;
      }
    }
    if (gameMatrix[i + 1] == gameMatrix[i + 2] && gameMatrix[i + 1] == 'X') {
      if (gameMatrix[i] == '' && currPlayer==Player.O) {
        gameMatrix[i] = 'O';
        currPlayer = Player.X;
      }
    }
  }

  computerColumMove(int i) {
    if (gameMatrix[i] == gameMatrix[i + 3] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 6] == '' && currPlayer==Player.O) {
        gameMatrix[i + 6] = 'O';
        currPlayer = Player.X;
      }
    }

    if (gameMatrix[i] == gameMatrix[i + 6] && gameMatrix[i] == 'X') {
      if (gameMatrix[i + 3] == '' && currPlayer==Player.O) {
        gameMatrix[i + 3] = 'O';
        currPlayer = Player.X;
      }
    }
    if (gameMatrix[i + 3] == gameMatrix[i + 6] && gameMatrix[i + 3] == 'X') {
      if (gameMatrix[i] == '' && currPlayer==Player.O) {
        gameMatrix[i] = 'O';
        currPlayer = Player.X;
      }
    }
  }

  computerDiagMove() {
    if (gameMatrix[0] == gameMatrix[4] && gameMatrix[0] == 'X') {
      if (gameMatrix[8] == ''&& currPlayer==Player.O) {
        gameMatrix[8] = 'O';
        currPlayer = Player.X;
      }
    }

    if (gameMatrix[4] == gameMatrix[8] && gameMatrix[4] == 'X') {
      if (gameMatrix[0] == ''&& currPlayer==Player.O) {
        gameMatrix[0] = 'O';
        currPlayer = Player.X;
      }
    }

    if (gameMatrix[0] == gameMatrix[8] && gameMatrix[0] == 'X') {
      if (gameMatrix[4] == ''&& currPlayer==Player.O) {
        gameMatrix[4] = 'O';
        currPlayer = Player.X;
      }
    }

    if (gameMatrix[2] == gameMatrix[4] && gameMatrix[2] == 'X') {
      if (gameMatrix[6] == ''&& currPlayer==Player.O) {
        gameMatrix[6] = 'O';
        currPlayer = Player.X;
      }
    }

    if (gameMatrix[2] == gameMatrix[6] && gameMatrix[2] == 'X') {
      if (gameMatrix[4] == ''&& currPlayer==Player.O) {
        gameMatrix[4] = 'O';
        currPlayer = Player.X;
      }
    }

    if (gameMatrix[4] == gameMatrix[6] && gameMatrix[4] == 'X') {
      if (gameMatrix[2] == ''&& currPlayer==Player.O) {
        gameMatrix[2] = 'O';
        currPlayer = Player.X;
      }
    }
  }
}
