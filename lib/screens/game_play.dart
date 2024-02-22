import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:runner/pixel_adventure.dart';

PixelAdventure _pixelAdventure = PixelAdventure();
class GamePlay extends StatelessWidget{
  const GamePlay({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _pixelAdventure,
      );
  }
}