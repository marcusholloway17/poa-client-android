import 'package:hdl/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/Button.dart';
import '../utils/config.dart';
class DoctorDetail extends StatefulWidget {
  final dynamic user;
  const DoctorDetail({required this.user}) ;

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar:  CustomAppBar(
         appTitle: ' Detail Spécialite ' ,
         icon: const FaIcon(Icons.arrow_left_outlined),
          actions: [
            IconButton(onPressed:() {
               setState(() {
                 isFav = !isFav;
               });
            },
                icon: FaIcon(
                  isFav ? Icons.favorite_rounded : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
            )
          ],
       ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const AboutDoctor(),
            Spacer(),
            Padding(
                padding: const EdgeInsets.all(20),
            child: Button(
              width: double.infinity,
              title: 'Prendre Rendez-vous',
              onPressed: ()
              {
                Navigator.of(context).pushNamed('/booking_page');
              },
              disable: false,
            ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 65.0,

            backgroundColor: Colors.blueGrey,
          ),
          Config.spaceMedium,
           Text(
            ''
            ,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians, United Kingdom)',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Hopital Dogta lafiè',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          DoctorInfo(),
          Config.spaceMedium,
          const Text(
            'A propos',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Config.spaceSmall,
          const Text(
            'Dr big Specialist at HDL, graduated since 2008, and completed his/her training at HDL.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}


class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[



      ],
    );
  }
}

