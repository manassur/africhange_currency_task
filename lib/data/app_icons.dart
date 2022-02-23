class AppIcons{
  static String menu ="assets/menu_icon.svg";
  static String convertIcon ="assets/convert_icon.svg";
  static String infoIcon ="assets/info_icon.svg";

  // pass in currency codes to this method and it suggests
  // a icon to be used to represent the currency
  static String getIconFromCurrencyCode(code){
    switch(code) {
      case "USD":
        return 'us_flag.png';
      case 'MXN':
        return 'mxn_flag.png';
      case 'PLN':
        return 'pln_flag.png';
      case 'AUD':
        return 'aud_flag.png';
      case 'CAD':
        return 'cad_flag.png';
      case 'EUR':
        return 'eur_flag.png';
      default: {
        return '';
      }
    }
  }

}