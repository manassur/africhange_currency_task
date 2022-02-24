import 'package:africhange_currency_task/services/webservice.dart';
import 'package:africhange_currency_task/view_models/rates_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RateListViewModel extends ChangeNotifier {

  RatesViewModel? rates;

  bool _isLoading = true;
  bool _hasError = false;
  String errorText='';

  // the value that is inputed by the user for conversion
  double _query=1.0;

  // the converted value
  double _conversion=0.0;

  String _baseCurrency="EUR";
  String _convertingCurrency="USD";

  // set currencies to default
  void setDefaultBaseandConvertingCurrencies(){
    _baseCurrency="EUR";
    _convertingCurrency="PLN";
    notifyListeners();
  }

  /*
  * Fetch the rates from Fixer.io Api
  * Notify listeners of the update
  */
  Future<void> fetchRates() async {
    setHasError(false);
    setLoading(true);
    try{
    final results =  await Webservice().fetchRates();
    rates = RatesViewModel(rates: results.rates);
    print(rates!.usd);
    setLoading(false);
    convertCurrency();
    }catch(e){
      setHasError(true);
      setError(e.toString());
      print(e);
      setLoading(false);
    }

    notifyListeners();
  }

  // return the converted currency
  RatesViewModel  get  getRates{
    return rates!;
  }


  // return the base currency at anytime
  String  get  getBaseCurrency{
    return _baseCurrency;
  }

  // return the converting currency at anytime
  String  get  getConvertingCurrency{
    return _convertingCurrency;
  }


  // return the converted currency
  double  get  getConversionResult{
    return _conversion;
  }


  // return the query
  double  get  getConversionQuery{
    return _query;
  }
  // return the query
  bool  get  getLoading{
    return _isLoading;
  }
  // set the base currency code
  void  setLoading(value){
    _isLoading = value;
    notifyListeners();

  }

  // return if there is an error
  bool  get  getHasError{
    return _hasError;
  }
  // set a error boolean
  void  setHasError(value){
    _hasError = value;
    notifyListeners();

  }

  // return the error
  String  get  getErrorText{
    return errorText;
  }
  // set the base currency code
  void  setError(value){
    errorText = value;
    notifyListeners();

  }






  // set the base currency code
  void  setBaseCurrency(currency){
    _baseCurrency = currency;
    notifyListeners();

  }

  // set the converting currency code
  void  setConvertingCurrency(currency){
    _convertingCurrency = currency;
    notifyListeners();
  }

  // set how much is to be converted
  void setConversionQuery(amount){
    _query = double.parse(amount);
    notifyListeners();

  }
  /*
  * The ultimate method to do the conversions and trigger the views
  */
  void  convertCurrency(){
    // convert to euros
   var conversionToEuro =   getConversionRateByCurrency(_baseCurrency)*_query;
   _conversion = conversionToEuro / getConversionRateByCurrency(_convertingCurrency);

    notifyListeners();
  }




  // return conversion rate
  double  getConversionRateByCurrency(currency){
    switch(currency) {
      case "USD":
        return rates!.usd;
      case 'MXN':
        return rates!.mxn;
      case 'PLN':
        return rates!.pln;
      case 'AUD':
        return rates!.aud;
      case 'CAD':
        return rates!.cad;
      case 'EUR':
        return 1.0;
      default: {
        return 0;
      }
    }
  }










}