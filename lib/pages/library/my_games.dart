import 'package:flutter/material.dart';

import '../../entities/game.dart';
import 'my_game_info.dart';

class MyGames extends StatefulWidget {
  const MyGames();

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, in pretium orci vestibulum eget.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma bibliothèque"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyGameInfo(Game("assets/images/dmc5.jpg", "Devil May Cry", _description, 200, 3000)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [MyGameInfo(Game("assets/images/re8.jpg", "Resident Evil VIII", _description, 200, 3000))],
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          MyGameInfo(Game("assets/images/nfs.jpg", "Need For Speed Heat", _description, 100, 1500))
        ],
      ),
    );
  }
}
