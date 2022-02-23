class Rates {
  double? uSD;
  double? aUD;
  double? cAD;
  double? pLN;
  double? mXN;

  Rates({this.uSD, this.aUD, this.cAD, this.pLN, this.mXN});

  Rates.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'];
    aUD = json['AUD'];
    cAD = json['CAD'];
    pLN = json['PLN'];
    mXN = json['MXN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USD'] = this.uSD;
    data['AUD'] = this.aUD;
    data['CAD'] = this.cAD;
    data['PLN'] = this.pLN;
    data['MXN'] = this.mXN;
    return data;
  }
}