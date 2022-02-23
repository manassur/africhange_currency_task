import 'rates_model.dart';

class RateResponse {
  bool? success;
  int? timestamp;
  String? base;
  String? date;
  Rates? rates;

  RateResponse(
      {this.success, this.timestamp, this.base, this.date, this.rates});

  RateResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    timestamp = json['timestamp'];
    base = json['base'];
    date = json['date'];
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['timestamp'] = this.timestamp;
    data['base'] = this.base;
    data['date'] = this.date;
    if (this.rates != null) {
      data['rates'] = this.rates!.toJson();
    }
    return data;
  }
}


