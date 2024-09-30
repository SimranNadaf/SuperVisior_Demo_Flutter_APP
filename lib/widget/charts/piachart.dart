import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PiaChart extends StatelessWidget {
  const PiaChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Workdays', 85, const Color.fromARGB(255, 135, 76, 204)),
      ChartData('Holidays', 12.5, const Color.fromARGB(255, 198, 91, 207)),
      ChartData('Leaves', 7.5, const Color.fromARGB(255, 242, 123, 189)),
    ];
    return SfCircularChart(
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
        series: <CircularSeries>[
          // Render pie chart
          PieSeries<ChartData, String>(
            dataSource: chartData,
            pointColorMapper: (ChartData data, _) => data.color,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelMapper: (ChartData data, _) => data.x,
            radius: '70%',
            startAngle: 0,
            endAngle: 360,
            animationDuration: 1500,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              useSeriesColor: true,
              labelIntersectAction: LabelIntersectAction.shift,
              connectorLineSettings: ConnectorLineSettings(
                  type: ConnectorType.curve, length: '7%'),
              overflowMode: OverflowMode.trim,
            ),
          )
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
