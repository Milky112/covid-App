import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatsGrid extends StatelessWidget {
  String Scope;
  String Date;
  var DataCovid = <String, int>{};

  StatsGrid({this.Scope, this.Date, this.DataCovid});

  String totalCase() {
    print(DataCovid['world case']);
    if (Scope == "My Country") {
      if (Date == "Total") {
        final oCcy = new NumberFormat("#,##0", "en_US");
        int a = DataCovid['indo case'];
        return "${oCcy.format(a)}";
      } else if (Date == "Today") {
        final oCcy = new NumberFormat("#,##0", "en_US");
        int a = DataCovid['daily case'];
        return "${oCcy.format(a)}";
      }
    } else {
      final oCcy = new NumberFormat("#,##0", "en_US");
      int a = DataCovid['world case'];
      return "${oCcy.format(a)}";
    }
  }

  String totalDeath() {
    if (Scope == "My Country") {
      if (Date == "Total") {
        final oCcy = new NumberFormat("#,##0", "en_US");
        int a = DataCovid['indo death'];
        return "${oCcy.format(a)}";
      } else if (Date == "Today") {
        final oCcy = new NumberFormat("#,##0", "en_US");
        int a = DataCovid['daily death'];
        return "${oCcy.format(a)}";
      }
    } else {
      final oCcy = new NumberFormat("#,##0", "en_US");
      int a = DataCovid['world death'];
      return "${oCcy.format(a)}";
    }
  }

  String totalRecovered() {
    if (Scope == "My Country") {
      final oCcy = new NumberFormat("#,##0", "en_US");
      int a = DataCovid['indo recover'];
      return "${oCcy.format(a)}";
    } else {
      final oCcy = new NumberFormat("#,##0", "en_US");
      int a = DataCovid['world recover'];
      return "${oCcy.format(a)}";
    }
  }

  String totalActive() {
    if (Scope == "My Country") {
      final oCcy = new NumberFormat("#,##0", "en_US");
      int a = DataCovid['indo active'];
      return "${oCcy.format(a)}";
    } else {
      final oCcy = new NumberFormat("#,##0", "en_US");
      int a = DataCovid['world active'];
      return "${oCcy.format(a)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.orange,
                  title: 'Total Cases',
                  count: totalCase(),
                ),
                _buildStatCard(
                  color: Colors.red,
                  title: 'Total Deaths',
                  count: totalDeath(),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard(
                  color: Colors.green,
                  title: 'Recovered',
                  count: totalRecovered(),
                ),
                _buildStatCard(
                  color: Colors.lightBlue,
                  title: 'Active',
                  count: totalActive(),
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
