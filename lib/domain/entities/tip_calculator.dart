import 'package:tip_calculator/utils/number_format.dart';

class TipCalculator {

  double _totalAccount = 0.0;
  double _totalAccountWithTip = 0.0;
  double _totalAccountSplitBill = 0.0;
  int _tipPercent = 0;
  double _tipTotal = 0.0;
  //int _splitBill = 1;

  void showTotalAccount(double initialTotal){
    _totalAccount = initialTotal;
    calculateTipTotal();
  }

  void calculateTipTotal(){
    _tipTotal = _totalAccount * (_tipPercent / 100.0);
    _tipTotal = (_tipTotal * 100).round() / 100;

    _totalAccountWithTip = _totalAccount + _tipTotal;
  }

  void calculateSplitBill(int splitBill){
    _totalAccountSplitBill = _totalAccountWithTip / splitBill.toDouble();
  }

  set tipPercent(int value){
    _tipPercent = value;
  }
  
  num get tipTotal => formatDecimalNumber(_tipTotal);
  num get totalAccountWithTip => formatDecimalNumber(_totalAccountWithTip);
  num get totalAccountSplitBill => formatDecimalNumber(_totalAccountSplitBill);

  

}