// add http plugin

import 'dart:convert';

import 'package:hdl/screens/doctor_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../components/custom_appbar.dart';
import '../utils/config.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  bool _loading = true;
  List<dynamic> _users = [];

  @override
  void initState() {
    super.initState();
    loadUserList(); // Appeler directement la fonction au moment de la création du widget
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        appTitle: 'Liste Des Spécialistes',
        icon: const FaIcon(Icons.arrow_left_outlined),
      ),
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: ((context, index) {
          return InkWell( // Utilisation de InkWell pour détecter le tap
            onTap: () {
              // Naviguer vers la page de détail lorsqu'on clique sur la card
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetail(user: _users[index]),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: Config.widthSize * 0.33,
                      child:  const CircleAvatar(
                        radius: 45.0,

                        backgroundColor: Colors.blueGrey,
                      ),
                    ),
                      Flexible(
                      child: Padding(
                            padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                              _users[index]['label'],
                             style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                        Text(
                          _users[index]['slug'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                      ],
                    )
                      ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  loadUserList() async {
    setState(() {
      _loading = true;
    });

    var res = await http.get(Uri.https('api.vaccitest.lik.tg', '/api/points'));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      if (jsonData['items']['data'].isNotEmpty) {
        setState(() {
          _users = jsonData['items']['data'];
          _loading = false;
        });
      }
    }
  }

}
