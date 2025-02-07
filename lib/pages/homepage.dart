import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_tile.dart';
import 'package:habit_tracker/data/habit_data.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //Initalize app data on startup
  void initState(){
    super.initState();

    Provider.of<HabitData>(context, listen: false).initalizeHabitList();
  }

  //Add new habit to list
  void createNewHabit(){
    final newHabitController = TextEditingController();
    showDialog(context: context, builder: (context) => AlertDialog(
      shape: LinearBorder(),
      title: Text("Create a new habit"),
      content: TextField(
        controller: newHabitController,
      ),
      actions: [
        MaterialButton(
          onPressed: (){
            Provider.of<HabitData>(context, listen: false).addHabit(newHabitController.text);
            newHabitController.clear();
            Navigator.pop(context);
          },
          child: Text("Save"), 
        ),
        MaterialButton(
          onPressed: (){
            newHabitController.clear();
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
      ],
    ));
  }

  void onCheckboxChanged(habitName, context){
    Provider.of<HabitData>(context, listen: false).checkOffHabit(habitName);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<HabitData>(builder: (context, value, child) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        shape: LinearBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
      ),
      body: ListView(
        children: [
          //List of habit tiles printed
           ListView.builder(
            shrinkWrap: true,
            itemCount: value.getHabitList().length,
            itemBuilder: (context, index) => HabitTile(
              habitName: value.getHabitList()[index].name, 
              isCompleted: value.getHabitList()[index].isCompleted,
              onCheckboxChanged: (val) => onCheckboxChanged(value.getHabitList()[index].name, context),
            )
          )
        ],
      ),
    ),);
  }
}