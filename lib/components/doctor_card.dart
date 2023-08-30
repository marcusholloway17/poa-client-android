import 'package:flutter/material.dart';

import '../screens/doctor_detail.dart';
import '../utils/config.dart';

class DoctorCard extends StatelessWidget {
  final Map<String, dynamic> user;

  const DoctorCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Naviguer vers la page de détail lorsqu'on clique sur la card
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetail(user: user),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: const CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.blueGrey,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['label'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user['slug'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
