# Pixel Game

### Introduction
PixelGame is a game created in Flutter using the Flame game engine.
In this pixel-art game, players take control of a character equipped with the agility of a ninja frog. 
Your mission is to navigate through levels, collecting various types of fruits while avoiding obstacles such as spikes and saws.
The gameplay combines precision jumping, strategic movements, and quick reflexes to conquer each level.


# Key Features

* Pixel Art Graphics: Experience the charm of classic pixel art, bringing a nostalgic feel to the game world.

* Fruit Collection: Gather an assortment of delicious fruits scattered throughout the levels.

* Jump and Move: Harness the ninja frog's jumping prowess and navigate through the dynamic environment, showcasing your platforming skills.

* Hazard Avoidance: Dodge menacing spikes and saws strategically placed to challenge your reflexes and precision.

* Level Progression: Conquer each level by reaching the designated checkpoints, unlocking new challenges, and progressing through an array of exciting environments.

# How to Play

1. **Controls:** Utilize the intuitive on-screen controls for seamless navigation.

   ![Controls](https://github.com/AdoCaice/MIS/assets/63158828/8b58e830-82e4-4476-aa13-cce019c4989c)

   - **Joystick:** Use the knob of the joystick to move left and right, providing precise control over your ninja frog's horizontal movement.

   - **Jump Button:** Tap the jump button to propel your character into the air, allowing you to overcome obstacles and reach new heights.

2. **Fruit Collection:** Collect as many fruits as you can to maximize your score. Different fruits may offer unique bonuses, so keep an eye out for rare varieties.

3. **Avoid Hazards:** Watch out for spikes and saws that can impede your progress. Navigate skillfully to overcome these obstacles.

4. **Level Completion:** Reach the checkpoint to successfully complete each level and unlock the next stage of your adventure.

## Level Design with Tiled

The captivating levels in the Pixel Game were meticulously crafted using the powerful Tiled Map Editor.

![GamePlay](https://github.com/AdoCaice/MIS/assets/63158828/0b6e14fd-6cae-44e6-96a8-b1eee3af330d)


*Above: A snapshot of a meticulously designed level using Tiled.*

## Object Spawning in Code

To bring the Pixel Adventure Game to life, objects within the game world are dynamically spawned using carefully crafted code. The `_spawningObjects` method is responsible for initializing various game elements based on the information provided by the Tiled Map Editor. Here's a glimpse into the code:

```dart
void _spawningObjects() {
  final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Player');

  if (spawnPointsLayer != null) {
    for (final spawnPoint in spawnPointsLayer.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          // Code to spawn the player character
          // ...
          break;
        case 'Fruit':
          // Code to spawn fruits
          // ...
          break;
        case 'Saw':
          // Code to spawn saw obstacles
          // ...
          break;
        case 'Checkpoint':
          // Code to spawn checkpoint objects
          // ...
          break;
        case 'Spike':
          // Code to spawn spike obstacles
          // ...
          break;
        default:
          // Additional handling for other object types
      }
    }
  }
}
```
## Sprite Animation

The Pixel Adventure Game brings characters to life through sprite animations. The `_spriteAnimation` and `_specialSpriteAnimation` methods play a crucial role in defining dynamic animations based on different character states.

### Running Animation

The running animation is a prime example of sprite animation in action. The character's state is represented by a sequence of frames, creating a fluid and visually appealing running effect. Here's an example of how the running animation looks:

![Run (32x32)](https://github.com/AdoCaice/MIS/assets/63158828/dba69046-c56f-48a7-bdd0-dcb2bd1233cc)

```dart
SpriteAnimation _spriteAnimation(String state, int amount) {
  return SpriteAnimation.fromFrameData(
    game.images.fromCache('Main Characters/$character/$state (32x32).png'),
    SpriteAnimationData.sequenced(
      amount: amount, 
      stepTime: stepTime, 
      textureSize: Vector2.all(32)
    ),
  );
}
```
## Sound Design

In the Pixel Adventure Game, sound plays a crucial role in enhancing the gaming experience. Every jump, collectible pickup, and in-game event is accompanied by carefully crafted audio. Here's a glimpse into how sounds were integrated into the game:

### Sound Integration

The FlameAudio library in Flutter facilitates seamless sound integration. The `FlameAudio.play` method is employed to play sounds at specific events. For instance, the following code snippet demonstrates how the 'jump.wav' sound is played when the player character jumps:

```dart
FlameAudio.play('jump.wav', volume: game.soundVolume);
```
## References

### Game Assets

The visual charm of Pixel Game is powered by the pixel art assets provided by [PixelFrog](https://pixelfrog-assets.itch.io/pixel-adventure-1). Their incredible work contributes to the vibrant and nostalgic atmosphere of the game.

### Sound Creation

The delightful sounds in Pixel Game were crafted using [sfxr.me](https://sfxr.me/), a tool dedicated to generating retro-style sound effects. Each jump, collectible pickup, and in-game event has been tuned to enhance the overall gaming experience.

### Level Creation

The intricate levels within Pixel Adventure were designed and brought to life using [Tiled](https://www.mapeditor.org/), a versatile map editor. Tiled played a pivotal role in creating captivating landscapes and challenges for players to explore.

### Mobile Controls Design

The intuitive and visually appealing mobile controls were designed using [Figma](https://www.figma.com/). Figma's powerful design tools were instrumental in creating a seamless and user-friendly control interface for the game.




