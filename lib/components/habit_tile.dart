import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/data/habit_data.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool isCompleted;
  final void Function(bool?)? onCheckboxChanged;

 
  const HabitTile({required this.habitName, required this.isCompleted, required this.onCheckboxChanged, super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HabitData>(builder: (context, value, child) => Container(
      color: isCompleted ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.tertiary,
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: (context){
                value.editHabit(habitName, context);
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icons.edit,
              foregroundColor: Theme.of(context).colorScheme.surface,
            ),
            SlidableAction(
              onPressed: (context){
                value.deleteHabit(habitName, context);
              },
              backgroundColor: Theme.of(context).colorScheme.surfaceDim,
              icon: Icons.delete,
              foregroundColor: Theme.of(context).colorScheme.surface,
            )
          ]
        ),
        child: ListTile(
            title: Text(habitName),
            onTap: () => onCheckboxChanged!(isCompleted)
          ),
        )
      )
    );
  }
}