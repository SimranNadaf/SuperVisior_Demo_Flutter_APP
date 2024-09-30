import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Cartesianchart extends StatelessWidget {
  const Cartesianchart({super.key});
  @override
  Widget build(BuildContext context) {
    List<SalesData> data = [
      SalesData(1, 2, "Jan"),
      SalesData(2, 2, "Feb"),
      SalesData(3, 1, "Mar"),
      SalesData(4, 2, "Apr"),
      SalesData(5, 5, "May"),
      SalesData(6, 2, "Jun"),
      SalesData(7, 2, "Jul"),
      SalesData(8, 2, "Aug"),
      SalesData(9, 3, "Spt"),
      SalesData(10, 2, "Oct"),
      SalesData(11, 0, "Nov"),
      SalesData(12, 2, "Dec"),
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
        primaryXAxis: const NumericAxis(minimum: 0, maximum: 12, interval: 1),
        series: <LineSeries<SalesData, num>>[
          LineSeries<SalesData, num>(
            name: "Holidays",
            animationDuration: 2000,
            dataSource: data,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.offs,
            dataLabelMapper: (SalesData sales, _) => sales.title,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
            ),
            color: const Color.fromARGB(255, 117, 164, 127),
            markerSettings: const MarkerSettings(
                isVisible: true, shape: DataMarkerType.diamond),
          )
        ]);
  }
}

class SalesData {
  final int month;
  final int offs;
  final String title;
  SalesData(this.month, this.offs, this.title);
}
