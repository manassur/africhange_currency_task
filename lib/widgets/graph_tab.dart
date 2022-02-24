import 'package:africhange_currency_task/data/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'circle_tab_indicator.dart';

class GraphTabWidget extends StatefulWidget {
  const GraphTabWidget({Key? key}) : super(key: key);

  @override
  _GraphTabWidgetState createState() => _GraphTabWidgetState();
}

class _GraphTabWidgetState extends State<GraphTabWidget> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 350,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTabController(
                  length: 2,
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: CircleTabIndicator(color: AppColors.primaryColor, radius: 4),
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white38,
                    labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
                    tabs: <Widget>[
                      Tab(text: 'Past 30 days'),
                      Tab(text: 'Past 90 days'),
                    ],
                  ),
                ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(
                  height: 400,
                  padding: EdgeInsets.all(30),
                  width: double.infinity,
                  child: LineChart(
                    mainChart(Colors.white),
                    swapAnimationDuration:
                    Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  ),
                ),
                Text('90  days')
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainChart(Color color) {

    return LineChartData(

      gridData: FlGridData(


        horizontalInterval: 1,
        show: true,

        drawVerticalLine: false,
        drawHorizontalLine: false
      ),
      titlesData: FlTitlesData(
        show:   true,
        leftTitles:SideTitles(
          getTextStyles: (context,value){
            return TextStyle(
                fontSize: 13.sp,
                color: Colors.grey
            );
          } ,


        ),

        topTitles:SideTitles (
          showTitles: false,


        ),
        rightTitles:SideTitles (
          showTitles: false,

        ),

        bottomTitles:SideTitles(
          showTitles: true,
          getTextStyles: (context,value){
            return TextStyle(
                fontSize: 14.sp,
                color: Colors.white
            );
          } ,
          reservedSize: 10,

          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '01 Jun';
              case 2:
                return '07 June';
              case 4:
                return '15 Jun';
              case 6:
                return '23 Jun';
              case 8:
                return '30 Jun';
              default:
                return '';
            }},
        ),

      ),
      borderData: FlBorderData(
          show: false,
      ),

      minX: 0,
      maxX: 10,
      minY: 0,
      maxY:9,

      lineBarsData: [
        LineChartBarData(

          spots: [
            FlSpot(0, 4),
            FlSpot(1, 8),
            FlSpot(2, 9),
            FlSpot(3, 7),
            FlSpot(4, 4),
            FlSpot(5, 5),
            FlSpot(6, 5),
            FlSpot(7, 6),
            FlSpot(8, 7),
            FlSpot(9, 8),
            FlSpot(10, 9),

          ],
          isCurved: true,

          colors: [
            color,

          ],
          barWidth: 0,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:[
              Colors.white.withOpacity(0.3),

            ],

          ),
        ),
      ],
    );
  }

}
