import 'package:flutter/material.dart';
import 'package:runner/screens/game_play.dart';

class MainMenu extends StatelessWidget{
  const MainMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:50.0),
              child: Text(
                'PixelGame',
                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 50.0,
                  shadows: [const Shadow(
                    blurRadius: 20.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  )] ),
                
                ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const GamePlay(),
                    ),
                );
              }, 
              child: const Text('Play'))
          ],
        ),
      ),
    );
  }
  
}