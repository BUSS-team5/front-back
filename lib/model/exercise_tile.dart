import 'package:flutter/material.dart';
import 'package:async/async.dart';
class ExerciseTile extends StatelessWidget {
  final icon;
  final String exerciseName;
  final icon2;

  const ExerciseTile({
    Key? key,
    required this.icon,
    required this.exerciseName,
    required this.icon2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRect(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.yellow,
                    child: Icon(
                      icon,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  exerciseName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            ClipRect(
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    icon2,
                  )
              ),
            ),
          ]),
    );
  }
}