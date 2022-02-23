import 'package:africhange_currency_task/data/app_enums.dart';
import 'package:africhange_currency_task/data/app_icons.dart';
import 'package:africhange_currency_task/view_models/rates_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyTileWidget extends StatefulWidget {
  final String? code;
  final CurrencySelectionType? type;
  const CurrencyTileWidget({Key? key,this.code,this.type}) : super(key: key);

  @override
  _CurrencyTileWidgetState createState() => _CurrencyTileWidgetState();
}

class _CurrencyTileWidgetState extends State<CurrencyTileWidget> {
String? logo;
  @override
  void initState() {
    super.initState();
    // suggest a country logo from the code
    logo = AppIcons.getIconFromCurrencyCode(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RateListViewModel>(context);

    return ListTile(
        onTap: (){
          // depending on the type of selection, set base or converting currencies
        widget.type==CurrencySelectionType.base?
          vm.setBaseCurrency(widget.code):vm.setConvertingCurrency(widget.code);
        Navigator.pop(context);
        },
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        leading: CircleAvatar(radius: 30,
          backgroundColor: Colors.white38,
          backgroundImage: AssetImage('assets/${logo}',),
        ),
        title: Text(widget.code!,style: TextStyle(fontSize:20,fontWeight: FontWeight.w600),));

  }
}
