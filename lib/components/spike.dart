import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:runner/components/custom_hitbox.dart';
import 'package:runner/pixel_adventure.dart';

class Spike extends SpriteAnimationComponent with HasGameRef<PixelAdventure>, CollisionCallbacks{
  Spike({position, size}) : super(position: position, size: size);

  final hitbox = CustomHitbox(offsetX: 1, offsetY: 8, width: 12, height: 12);
  bool collected = false;
  @override
  FutureOr<void> onLoad() {
    priority= -1;
    
    add(RectangleHitbox(
      position: Vector2(hitbox.offsetX, hitbox.offsetY),
      size: Vector2(hitbox.width, hitbox.height),
      collisionType: CollisionType.passive,
    ));

    animation = SpriteAnimation.fromFrameData(game.images.fromCache('Traps/Spikes/Idle.png'),
     SpriteAnimationData.sequenced(amount: 1, stepTime: 1, textureSize: Vector2.all(16)));
    return super.onLoad();
  }
  
  void collidedWithPlayer() async{
    if(!collected){
    collected = true;
    if(game.playSounds) FlameAudio.play('hit.wav', volume: game.soundVolume);

    }
  }

}