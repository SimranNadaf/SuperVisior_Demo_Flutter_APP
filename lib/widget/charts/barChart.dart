import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatelessWidget{
  const BarChart({super.key});
  @override
  Widget build(BuildContext context) {
    List<ChartData> data = [
      ChartData("Jan", 30, const Color.fromARGB(255, 158, 203, 240)),
      ChartData("Feb", 25, const Color.fromARGB(255, 127, 193, 247)),
      ChartData("Mar", 20, const Color.fromARGB(255, 70, 163, 240)),
      ChartData("Apr", 23, const Color.fromARGB(255, 58, 158, 240)),
      ChartData("May", 28, const Color.fromARGB(255, 37, 150, 243)),
      ChartData("Jun", 18, const Color.fromARGB(255, 22, 146, 247)),
      ChartData("Jul", 19, const Color.fromARGB(255, 3, 135, 243)),
      ChartData("Aug", 28, const Color.fromARGB(255, 2, 119, 214)),
      ChartData("Sep", 30, const Color.fromARGB(255, 2, 95, 172)),
      ChartData("Oct", 26, const Color.fromARGB(255, 1, 63, 114)),
      ChartData("Nov", 28, const Color.fromARGB(255, 1, 53, 95)),
      ChartData("Dec", 22, const Color.fromARGB(255, 2, 46, 82)),
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
            tooltipBehavior:TooltipBehavior(enable: true),
            series: <CartesianSeries<ChartData, String>>[
              BarSeries<ChartData, String>(
                name: "Workdays",
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  pointColorMapper: (ChartData data, _) => data.color,
                  )
            ]);
  }
}

 
class ChartData {
  ChartData(this.x, this.y, this.color);
 
  final String x;
  final double y;
  final Color? color;
}