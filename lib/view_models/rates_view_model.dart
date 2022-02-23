
import 'package:africhange_currency_task/models/rates_model.dart';

class RatesViewModel {

  final Rates? rates;

  RatesViewModel({this.rates});

  double get usd {
    return rates!.uSD!;
  }

  double get aud {
    return rates!.aUD!;
  }

  double get cad {
    return rates!.cAD!;
  }

  double get mxn {
    return rates!.mXN!;
  }

  double get pln {
    return rates!.pLN!;
  }

}