import 'package:flutter/material.dart';
import 'package:timetable/models/timetable_model.dart';

class TTList extends StatelessWidget {
  final BuildContext context;
  final AsyncSnapshot snapshot;
  TTList(this.context, this.snapshot);

  @override
  Widget build(BuildContext context) {
    List<Day> period = snapshot.data;
    return ListView.builder(
      itemCount: period.length,
      itemBuilder: (context, index){
        return Row(
          children: [
            Text(period[index].timeFrom),
            Text(period[index].timeTo),
            Text(period[index].course),
            Text(period[index].teacher)
          ],
        );
      },
    );
  }
}
