import 'package:grocery_app/backbone/dependency_injection.dart' as di;
import 'package:grocery_app/presentation/bloc/chart/bloc.dart';
import 'package:grocery_app/theme/palette.dart';
import 'package:grocery_app/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../backbone/bloc_status.dart';
class RatingsPage extends StatefulWidget {
  @override
  _RatingsPageState createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsPage> {
  final ChartBloc _chartBloc = di.sl.get();

  generateSpots(ChartState state){
    List<FlSpot>? result = state.result?.response?.data.quotes.asMap().entries.map((e)
    => FlSpot(e.key.toDouble(), e.value.quote.close / 1000)).toList();
    return result;
  }

  @override
  void initState() {
    super.initState();
    _chartBloc.add(ChartEvent.getHistoryData(DateTime.now().subtract(const Duration(days: PeriodConstants.oneWeek)), DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Palette.chartBorder),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 32.0, left: 12.0, top: 24, bottom: 12),
                    child: BlocBuilder<ChartBloc, ChartState>(
                        bloc: _chartBloc,
                        builder: (_, ChartState state) {
                          if (state.status == BlocStatus.loading) {
                            return Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircularProgressIndicator(),
                                  SizedBox(width: 8),
                                  Text('loading'.tr(), style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            );
                          } else if (state.status == BlocStatus.loaded) {
                            return LineChart(mainData(_chartBloc,state));
                          }
                          return Container();
                        }),
                  ),
                ),
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                ElevatedButton (
                  child: Text('1_week'.tr()),
                  onPressed: () {
                    _chartBloc.add(ChartEvent.getHistoryData(DateTime.now().subtract(const Duration(days: PeriodConstants.oneWeek)), DateTime.now()));
                  },
                ),
                ElevatedButton (
                  child: Text('1_month'.tr()),
                  onPressed: () {
                    _chartBloc.add(ChartEvent.getHistoryData(DateTime.now().subtract(const Duration(days: PeriodConstants.oneMonth)), DateTime.now()));
                  },
                ),
                ElevatedButton (
                  child: Text('6_months'.tr()),
                  onPressed: () {
                    _chartBloc.add(ChartEvent.getHistoryData(DateTime.now().subtract(const Duration(days: PeriodConstants.sixMonths)), DateTime.now()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }




  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const Widget text = Text('');

    return const Padding(child: text, padding: EdgeInsets.only(top: 8.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Palette.leftTitle,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 25:
        text = '25K';
        break;
      case 30:
        text = '30K';
        break;
      case 35:
        text = '35K';
        break;
      case 40:
        text = '40K';
        break;
      case 45:
        text = '45K';
        break;
      case 50:
        text = '50K';
        break;
      case 55:
        text = '55K';
        break;
      case 60:
        text = '60K';
        break;
      case 65:
        text = '65K';
        break;
      case 70:
        text = '70K';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(ChartBloc chartBloc,ChartState state) {

    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (value) {
            return value.map((e) => LineTooltipItem("${(e.y * 1000).round()}",const TextStyle(
              color: Palette.popupTitle,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ))).toList();
          },
          tooltipBgColor: Colors.amber,
        )),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Palette.lineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Palette.lineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: Palette.chartBorder, width: 1)),
      minX: 0,
      maxX: chartBloc.getXNumbers(state).toDouble(),
      minY: 25,
      maxY: 70,
      lineBarsData: [
        LineChartBarData(
          spots: generateSpots(state),
          isCurved: true,
          gradient: const LinearGradient(
            colors: Palette.lineGradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: Palette.lineGradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
