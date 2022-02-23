import 'package:africhange_currency_task/data/app_colors.dart';
import 'package:flutter/material.dart';

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
      height: 200,
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
                Container(child: Center(child: Text('people'))),
                Text('Person')
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
