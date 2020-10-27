import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetable/models/timetable_model.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/services/api_service.dart';

class WeekDayTT extends StatefulWidget {
  @override
  _WeekDayTTState createState() => _WeekDayTTState();
}

class _WeekDayTTState extends State<WeekDayTT> {
  ApiServices apiServices = ApiServices();
  Time time;
  bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // Future getData() async {
  //   isLoading = true;
  //   Time timetable = await apiServices.getTimeTable('sitrc', 'comp', 'se', 'b');
  //   setState(() {
  //     time = timetable;
  //   });
  //   isLoading = false;
  // }

  @override
  Widget build(BuildContext context) {
    final tt = Provider.of<TimeTableProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Timetable')),
        body: FutureBuilder(
          future: tt.getTodayTimeTable(),
          initialData: [],
          builder: (context, snapshot) {
            // var period = snapshot.data;
            if (snapshot.hasData) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('From'),
                      Text("To"),
                      Text('Lecture'),
                      Text('Teacher')
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(snapshot.data[index].timeFrom),
                          Text(snapshot.data[index].timeTo),
                          Text(snapshot.data[index].course),
                          Text(snapshot.data[index].teacher)
                        ],
                      );
                    },
                  ),
                ],
              );
            } else {
              return Text('Error Loading Data.');
            }
          },
        ));
  }
}
