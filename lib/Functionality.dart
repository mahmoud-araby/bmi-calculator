import 'dart:math';

enum Gender {
  Male,
  Female,
}

class Functionality {
  Gender gender;
  int height = 160;
  int weight = 80;
  int age = 21;
  double _bmi;

  String calculate_bmi() {
    return _bmi.toStringAsFixed(1);
  }

  String Get_Result() {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String Get_speech() {
    if (_bmi >= 25) {
      return 'انت تخين خس شويه ';
    } else if (_bmi > 18.5) {
      return 'عادى ياسطى ';
    } else {
      return 'خلى امك تأكلك يا اسطى  ';
    }
  }
}
