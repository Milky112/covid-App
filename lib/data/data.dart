import 'package:covid/data/networking.dart';

final prevention = [
  {'assets/images/distance.png': 'Avoid close\ncontact'},
  {'assets/images/wash_hands.png': 'Clean your\nhands often'},
  {'assets/images/mask.png': 'Wear a\nfacemask'},
];

final covidUSADailyNewCases = [11.3, 22.4, 21.2, 15.3, 19.5, 13.5, 15.4];

class temporaryData {
  var dataTemp;

  Future<dynamic> getData() async {
    NetworkHelper networkHelper = NetworkHelper();

    var JsonData = await networkHelper.getData();
    dataTemp = JsonData;
    return dataTemp;
  }
}
