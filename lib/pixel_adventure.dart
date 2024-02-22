import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:runner/components/jump_button.dart';
import 'package:runner/components/player.dart';
import 'package:runner/components/level.dart';

class PixelAdventure extends FlameGame with HasKeyboardHandlerComponents, DragCallbacks,HasCollisionDetection,TapCallbacks{
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late CameraComponent cam;
  Player player = Player(character: 'Ninja Frog');
  late JoystickComponent joystick;
  bool showJoystick = true;
  bool playSounds = false;
  double soundVolume = 1.0;
  List<String> levelNames = ['Level_01','Level_02','Level_03','Level_04','Level_05'];
  int currentLevelIndex = 0;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    _loadLevel();
    if(showJoystick){
      addJoystick();  
      add(JumpButton());
    }
    
    return super.onLoad();
  }
  @override
  void update(double dt) {
    if(showJoystick){  
    updateJoystick();
    }
    super.update(dt);
  }

  void addJoystick(){
    joystick = JoystickComponent(
      priority: 10,
      knob: SpriteComponent(
        sprite: Sprite(images.fromCache('HUD/Knob.png'),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(images.fromCache('HUD/Joystick.png'),
        ),
      ),
      margin: const EdgeInsets.only(left: 22, bottom: 12)
    );
    add(joystick);
  }
  
  void updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        break;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }
  
  void loadNextLevel(){
    if(currentLevelIndex < levelNames.length-1){
      currentLevelIndex++;
      _loadLevel();
    }else{
      _resetGame();
    }
  }

  void _resetGame() {
  currentLevelIndex = 0;
  _loadLevel();
}

  void _loadLevel() {
    Future.delayed(const Duration(seconds: 1),(){
    Level world = Level(levelName: levelNames[currentLevelIndex], player: player);
    removeWhere((component) => component is Level);
    cam = CameraComponent.withFixedResolution(world: world ,width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]); 
    });
    
  }
}