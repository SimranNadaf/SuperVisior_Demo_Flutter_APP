import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({super.key});
  @override
  Widget build(BuildContext context) {
    List<ChartData> data = [
      ChartData(x: "Jan", y: 19, y2: 2),
      ChartData(x: "Feb", y: 20, y2: 2),
      ChartData(x: "Mar", y: 20, y2: 2),
      ChartData(x: "Apr", y: 17, y2: 4),
      ChartData(x: "May", y: 20, y2: 3),
      ChartData(x: "Jun", y: 20, y2: 2),
      // ChartData(x: "Jul", y: 18, y2: 2),
      // ChartData(x: "Aug", y: 20, y2: 2),
      // ChartData(x: "Sep", y: 23, y2: 2),
      // ChartData(x: "Oct", y: 20, y2: 2),
      // ChartData(x: "Nov", y: 21, y2: 2),
      // ChartData(x: "Dec", y: 20, y2: 3),
    ];

    return SfCartesianChart(
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          isResponsive: true,
          itemPadding: 15,
          textStyle: TextStyle(
              color: Color.fromARGB(221, 34, 40, 49),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
       primaryXAxis: const CategoryAxis(),
            primaryYAxis: const NumericAxis(minimum: 0, maximum: 30, interval: 10),
        series: <CartesianSeries>[
          StackedColumnSeries<ChartData, String>(
              name: "WorkDays",
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              color: const Color.fromARGB(255, 53, 162, 159),
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
          StackedColumnSeries<ChartData, String>(
              name: "Leaves",
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              color: const Color.fromARGB(255, 151, 254, 237),
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2),
        ]);
  }
}

class ChartData {
  final String x;
  final int y;
  final int y2;

  ChartData({required this.x, required this.y, required this.y2});
}
