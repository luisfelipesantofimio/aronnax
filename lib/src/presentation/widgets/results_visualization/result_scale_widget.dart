import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultScaleItem extends StatelessWidget {
  const ResultScaleItem({
    Key? key,
    required this.resultData,
  }) : super(key: key);
  final TreatmentPlanResultValue resultData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          resultData.componentTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        SizedBox(
          height: 300,
          width: 400,
          child: BarChart(
            BarChartData(
              baselineY: double.parse(
                resultData.value.toString(),
              ),
              maxY: double.parse(resultData.optionsSize.toString()),
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 38,
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(resultData.alias ?? resultData.value);
                    },
                  ),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 55, 55, 54),
              barGroups: [
                BarChartGroupData(
                  x: resultData.value!,
                  groupVertically: true,
                  barRods: [
                    BarChartRodData(
                      color: const Color.fromARGB(255, 227, 142, 136),
                      width: 30,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(2),
                      ),
                      toY: double.parse(
                        resultData.value.toString(),
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
