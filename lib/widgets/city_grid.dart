import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class cityGrid extends StatelessWidget {
  var DataCovid = <String, int>{};

  cityGrid({@required this.DataCovid});

  String JakartaCase() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jakarta case'];
    return "${oCcy.format(a)}";
  }

  String JakartaRecovery() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jakarta recover'];
    return "${oCcy.format(a)}";
  }

  String JatimCase() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jatim case'];
    return "${oCcy.format(a)}";
  }

  String JatimRecovery() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jatim recover'];
    return "${oCcy.format(a)}";
  }

  String JatengCase() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jateng case'];
    return "${oCcy.format(a)}";
  }

  String JatengRecovery() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jateng recover'];
    return "${oCcy.format(a)}";
  }

  String JakbarCase() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jakbar case'];
    return "${oCcy.format(a)}";
  }

  String JakbarRecovery() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['jakbar recover'];
    return "${oCcy.format(a)}";
  }

  String KalbarCase() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['kalbar case'];
    return "${oCcy.format(a)}";
  }

  String KalbarRecovery() {
    final oCcy = new NumberFormat("#,##0", "en_US");
    int a = DataCovid['kalbar recover'];
    return "${oCcy.format(a)}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.orange,
                  title: 'Jakarta case',
                  count: JakartaCase(),
                ),
                _buildStatCard(
                  color: Colors.red,
                  title: 'Jakarta Recovery',
                  count: JakartaRecovery(),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.green,
                  title: 'Jatim Case',
                  count: JatimCase(),
                ),
                _buildStatCard(
                  color: Colors.lightBlue,
                  title: 'Jatim Recovery',
                  count: JatimRecovery(),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.green,
                  title: 'Jateng Case',
                  count: JatengCase(),
                ),
                _buildStatCard(
                  color: Colors.lightBlue,
                  title: 'Jateng Recovery',
                  count: JatengRecovery(),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.green,
                  title: 'Jakbar Case',
                  count: JakbarCase(),
                ),
                _buildStatCard(
                  color: Colors.lightBlue,
                  title: 'Jakbar Recovery',
                  count: JakbarRecovery(),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.green,
                  title: 'Kalbar Case',
                  count: KalbarCase(),
                ),
                _buildStatCard(
                  color: Colors.lightBlue,
                  title: 'Kalbar Recovery',
                  count: KalbarRecovery(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard({String title, String count, MaterialColor color}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
