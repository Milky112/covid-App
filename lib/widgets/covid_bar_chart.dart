import 'package:covid/config/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  CovidBarChart({@required this.covidCases});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily New Cases',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 16.0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10,
                    showTitles: true,
                    textStyle: Styles.chartLabelsTextStyle,
                    rotateAngle: 35,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Sept 24';
                        case 1:
                          return 'Sept 25';
                        case 2:
                          return 'Sept 26';
                        case 3:
                          return 'Sept 27';
                        case 4:
                          return 'Sept 28';
                        case 5:
                          return 'Sept 29';
                        case 6:
                          return 'Sept 30';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    textStyle: Styles.chartLabelsTextStyle,
                    getTitles: (value) {
                      if (value == 0) {
                        return '0';
                      } else if (value % 3 == 0) {
                        return '${value ~/ 3 * 3}K';
                      }
                      return '';
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 3 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1.0,
                    dashArray: [5],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: covidCases
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        BarChartGroupData(x: key, barRods: [
                          BarChartRodData(
                            y: value * 0.25,
                            color: Colors.red,
                          ),
                        ]),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
