import 'package:covid/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:covid/data/networking.dart';
import 'bottom_nav_screen.dart';
import 'package:covid/data/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var covidData = <String, int>{};
  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  void getCovidData() async {
    var covidData = await temporaryData().getData();
    print('Data COVID Provinsi');
    print(covidData['kalbar case']);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BottomNavScreen(
        DataCovid: covidData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
