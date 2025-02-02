import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool oTurn = true;
  List<String> displayGame = ['','','','','','','','',''];
  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  static var myFontWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildScoreColumn("Joueur O", oScore),
                _buildScoreColumn("Joueur X", xScore),
              ],
            )
          ),

          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    child: Center(
                      child: Text(
                        displayGame[index],
                        style: const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),

          Expanded(child: Container()),
        ],
      ),
    );
  }
  Widget _buildScoreColumn(String player, int score) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
      child: Column(
        children: [
          Text(player, style: myFontWhite,),
          const SizedBox(height: 10,),
          Text(score.toString(), style: myFontWhite,)
        ],
      ),
    );
  }

  void _tapped (int index) {    
    if (displayGame[index] != '') return;

    setState(() {
      displayGame[index] = oTurn ? 'O' : 'X';
      filledBoxes += 1;

      oTurn = !oTurn;
      _checWinner();
    });
  }

  void _checWinner () {
    List<List<int>> winningPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], 
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ];

    // De chaque pattern gagnant d'au dessus, on fait une boucle et on regarde qu'il n'y a pas de case vide
    // et que la case 1 qui est first et les 2 autres cases de chaque pattern gagnant soit égaux
    for (var pattern in winningPatterns) {
      String first = displayGame[pattern[0]];
      if (first != '' && first == displayGame[pattern[1]] && first == displayGame[pattern[2]]) {
        _showWinnerDialog(first);
        return;
      }
    }

    if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }



  void _showWinnerDialog(String winner) {
    if (winner == 'O') {
      oScore += 1;
    } else {
      xScore += 1;
    }

    _showDialog("Le gagnant est : $winner");
  }

  void _showDrawDialog() {
    _showDialog("Égalité !");
  }



  void _showDialog (String message) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text(message, style: const TextStyle(fontSize: 20),),
            IconButton(
              onPressed: () {
                _cleanBoard();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.refresh)
            )
           ],
          ),
        );
    });
  }

  void _cleanBoard() {
    setState(() {
      displayGame = List.filled(9, '');
      filledBoxes = 0;
    });
  }
}