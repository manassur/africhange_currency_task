import 'package:africhange_currency_task/data/app_enums.dart';
import 'package:africhange_currency_task/data/app_icons.dart';
import 'package:africhange_currency_task/view_models/rates_list_view_model.dart';
import 'package:africhange_currency_task/widgets/select_currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyBoxWidget extends StatefulWidget {
  final CurrencySelectionType? type;
  const CurrencyBoxWidget({Key? key,this.type}) : super(key: key);

  @override
  _CurrencyBoxWidgetState createState() => _CurrencyBoxWidgetState();
}

class _CurrencyBoxWidgetState extends State<CurrencyBoxWidget> {

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RateListViewModel>(context);
    var logo = widget.type==CurrencySelectionType.base?
    AppIcons.getIconFromCurrencyCode(vm.getBaseCurrency):
    AppIcons.getIconFromCurrencyCode(vm.getConvertingCurrency);

    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SelectCurrencyWidget(type: widget.type,);
            });
      },
      child: Container(
        height: 50,
        padding:EdgeInsets.all(10),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
             CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white38,
              backgroundImage:AssetImage('assets/'+logo),
            ),
            Text(widget.type==CurrencySelectionType.base?vm.getBaseCurrency:vm.getConvertingCurrency,style:TextStyle(color: Colors.grey.shade500,fontSize:20,fontWeight: FontWeight.w500)),
            Icon(Icons.keyboard_arrow_down_outlined,color:Colors.grey.shade500)

          ],
        ),

      ),
    );
  }
}
