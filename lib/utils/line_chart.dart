import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartData mainLineChartData() {
  return LineChartData(
    lineBarsData: [
      LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 6,
              color: Colors.blue,
              strokeWidth: 1,
              strokeColor: Colors.white,
            );
          },
        ),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.blue.withOpacity(0.3),
        ),
        spots: [
          FlSpot(0, 100000),
          FlSpot(1, 30000),
          FlSpot(2, 200000),
          FlSpot(3, 400000),
          FlSpot(4, 500000),
          FlSpot(5, 500000),
          FlSpot(6, 40000),
        ],
      ),
    ],
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((spot) {
            return LineTooltipItem(
              '+Rp${spot.y}',
              const TextStyle(color: Colors.white),
            );
          }).toList();
        },
      ),
      touchCallback: (event, response) {},
      handleBuiltInTouches: true,
    ),

    titlesData: FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 50),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (value, meta) {
            const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            if (value.toInt() < labels.length) {
              return Transform.rotate(
                angle: -0.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    labels[value.toInt()],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }
            return Text('');
          },
        ),
      ),
    ),
    gridData: FlGridData(show: false),
    borderData: FlBorderData(show: false),
    minY: 10000,
  );
}
