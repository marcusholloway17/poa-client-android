import 'package:flutter/material.dart';

import '../utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming; //initial status
  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedules = [
    {
      "doctor_name": "Dr Auxillia",
      "categories": "Pharmaciene",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Dr Dhiki",
      "categories": "Docteur love",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Dr Paul",
      "categories": "Chirugien",
      "status": FilterStatus.cancel
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch ( schedule['status'])
      //     {
      //   case 'Rendez vous a venir':
      //     schedules['status']=  FilterStatus.upcoming;
      //     break;
      //
      //   case 'Passés':
      //     schedules['status']=  FilterStatus.complete;
      //     break;
      //   case 'Annulésr':
      //     schedules['status']=  FilterStatus.cancel;
      //     break;
      return schedule['status'] == status;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Calendrier de rendez-vous',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //this is the filter tabs
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
                child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: ((context, index) {
                var schedule = filteredSchedules[index];
                bool isLastElement = filteredSchedules.length + 1 == index;
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: !isLastElement
                      ? const EdgeInsets.only(bottom: 20)
                      : EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(children: [
                            const CircleAvatar(),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  schedule['doctor_name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  schedule['categories'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ]),
                          const SizedBox(
                            height: 5,
                          ),
                          const ScheduleCard(),
                          const SizedBox(
                            height: 5,
                          ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {},
                                      child: const Text(
                                          'Annuler',
                                        style:
                                        TextStyle(color: Colors.green),
                                      ),
                                  ),
                              ),

                              const SizedBox(width:20),
                              Expanded(
                                child: OutlinedButton(
                                  style:OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reporter',
                                    style:
                                    TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                );
              }),
            )),
          ],
        ),
      ),
    );
  }
}
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Monday, 11/28/2023',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text('Time',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
