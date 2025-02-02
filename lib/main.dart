import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Joueur O", style: myTextStyle,),
                      Text(oScore.toString(), style: myTextStyle,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Joueur X", style: myTextStyle,),
                      Text(xScore.toString(), style: myTextStyle,),
                    ],
                  ),
                ),
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

          Expanded(
            child: Container(
            )
          ),
        ],
      ),
    );
  }

  void _tapped (int index) {
    setState(() {
      if (displayGame[index] == '') {
        if (oTurn) {
        displayGame[index] = 'O';
        } else {
          displayGame[index] = 'X';
        }
      }

      oTurn = !oTurn;
      _checWinner();
    });
  }

  void _checWinner () {
    if (displayGame[0] == displayGame[1] && displayGame[0] == displayGame[2] && displayGame[0] != '') {
      _showDialog(displayGame[0]);
    }
    if (displayGame[3] == displayGame[4] && displayGame[3] == displayGame[5] && displayGame[3] != '') {
      _showDialog(displayGame[3]);
    }
    if (displayGame[6] == displayGame[7] && displayGame[6] == displayGame[8] && displayGame[6] != '') {
      _showDialog(displayGame[6]);
    }
    if (displayGame[0] == displayGame[3] && displayGame[0] == displayGame[6] && displayGame[0] != '') {
      _showDialog(displayGame[0]);
    }
    if (displayGame[1] == displayGame[4] && displayGame[1] == displayGame[7] && displayGame[1] != '') {
      _showDialog(displayGame[1]);
    }
    if (displayGame[2] == displayGame[5] && displayGame[2] == displayGame[8] && displayGame[2] != '') {
      _showDialog(displayGame[2]);
    }
    if (displayGame[0] == displayGame[4] && displayGame[0] == displayGame[8] && displayGame[0] != '') {
      _showDialog(displayGame[0]);
    }
    if (displayGame[2] == displayGame[4] && displayGame[2] == displayGame[6] && displayGame[2] != '') {
      _showDialog(displayGame[2]);
    }
  }

  void _showDialog (String winner) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text("Winner: $winner"),
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

    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _cleanBoard () {
    setState(() {
      for (int i = 0; i < 9; i++) {
      displayGame[i] = '';
      }
    });
  }
}