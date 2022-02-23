import 'package:africhange_currency_task/data/app_colors.dart';
import 'package:africhange_currency_task/data/app_enums.dart';
import 'package:flutter/material.dart';

import 'currency_tile.dart';

class SelectCurrencyWidget extends StatefulWidget {
  /* type represents if its a base selection or converting selection
   * pass false when it is a base selection
   * pass true when it is a converting selection
   */
  final CurrencySelectionType? type;
  const SelectCurrencyWidget({Key? key, this.type}) : super(key: key);

  @override
  _SelectCurrencyWidgetState createState() => _SelectCurrencyWidgetState();
}

class _SelectCurrencyWidgetState extends State<SelectCurrencyWidget> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
              widget.type==CurrencySelectionType.base?
              'Choose Base Currency':
              'Choose Converting Currency',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        CurrencyTileWidget(code:'USD',type: widget.type,),
        CurrencyTileWidget(code:'PLN',type: widget.type),
        CurrencyTileWidget(code:'MXN',type: widget.type),
        CurrencyTileWidget(code:'CAD',type: widget.type),
        CurrencyTileWidget(code:'AUD',type: widget.type),
        CurrencyTileWidget(code:'EUR',type: widget.type),

      ],
    );
  }


}
