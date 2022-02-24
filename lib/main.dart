import 'package:africhange_currency_task/view_models/rates_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'view/home_screen.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: RateListViewModel(),
        ),
      ],child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:   ResponsiveSizer(
          builder: (context, orientation, deviceType) {

            return HomeView();
          }),
    );
  }
}

