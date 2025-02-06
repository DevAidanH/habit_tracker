import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/homepage.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.all(30),
            child: Image.asset("lib/images/welcomeScreen.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("HABIT TRACKER", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 48, color: Theme.of(context).colorScheme.primary),),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text("Simple steps for big goals", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),)
          ),
          MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Text("GET STARTED", style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 32, fontWeight: FontWeight.w900)),
            ),  
          )

        ],
      ) 
    );
  }
}