import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';

class HabitData extends ChangeNotifier {
  //Default habit list if this is the user's first time. 
  List<Habit> habitList = [
    Habit(name: "Run"),
    Habit(name: "Read"),
    Habit(name: "10 Push ups")
  ];

  //Initalize Habit list
  void initalizeHabitList(){
    habitList = habitList;
  }

  //Get habits
  List<Habit> getHabitList(){
    return habitList;
  }

  //Add habit to list
  void addHabit (String name){
    habitList.add(Habit(name: name));
    notifyListeners();
    //Save to database here
  }

  //Delete habit
  void deleteHabit(String name, context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Are you sure you want to delete this habit?"),
      actions: [
        MaterialButton(
          onPressed: (){
            habitList.remove(getRelevantHabit(name));
            notifyListeners();
            //Update database here
            //Update heatmap here
            Navigator.pop(context);
          },
          child: Text("Delete"),
        ),
        MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
      ],
    ));
  }

  //Edit Habit
  void editHabit(String name, context){
    final editHabitController = TextEditingController(text: name);
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Edit Habit"),
      content: TextField(controller: editHabitController,),
      actions: [
        MaterialButton(
          onPressed: (){
            getRelevantHabit(name).name = editHabitController.text;
            notifyListeners();
            //Update database here
            //Update heatmap here
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
        MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
      ],
    ));
  }

  //Get relevant hablit
  Habit getRelevantHabit(name){
    Habit releveantHabit = habitList.firstWhere((habit) => habit.name == name);
    return releveantHabit;
  }

  //Tick off habit as completed for the day
  void checkOffHabit(String habitName){
    Habit relevantHabit = getRelevantHabit(habitName);
    relevantHabit.isCompleted = !relevantHabit.isCompleted;
    notifyListeners();
    //Save to database/
    //Update heatmap
  }
}