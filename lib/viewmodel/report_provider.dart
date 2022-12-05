import 'package:flutter/foundation.dart';

enum ReportState { initial, typeBiils, rangeTime }

class ReportProvider extends ChangeNotifier {
  /// STATE PAGE
  ReportState reportState = ReportState.initial;

  /// TYPE BILLS
  String typeBiils = "All";
  final List<String> listTypeBills = ["All", "Paid", "Unpaid"];

  /// RANGE TIME
  String rangeTime = "1 Week";
  final List<String> listRangeTime = ["1 Week", "1 Month", "3 Month", "1 Year"];

  List<Map<String, dynamic>> initialData = [
    {
      'id': 'Paid',
      'data': [
        {'domain': 0, 'measure': 5},
        {'domain': 1, 'measure': 14},
        {'domain': 2, 'measure': 6},
        {'domain': 3, 'measure': 5},
        {'domain': 4, 'measure': 5},
        {'domain': 5, 'measure': 10},
        {'domain': 6, 'measure': 8},
      ],
    },
    {
      'id': 'Unpaid',
      'data': [
        {'domain': 0, 'measure': 0},
        {'domain': 1, 'measure': 5},
        {'domain': 2, 'measure': 1},
        {'domain': 3, 'measure': 3},
        {'domain': 4, 'measure': 4},
        {'domain': 5, 'measure': 0},
        {'domain': 6, 'measure': 1},
      ],
    },
  ];

  List<Map<String, dynamic>> data = [];

  void changeState(ReportState state) {
    switch (state) {
      case ReportState.typeBiils:
        {
          reportState = ReportState.typeBiils;
        }
        break;
      case ReportState.rangeTime:
        {
          reportState = ReportState.rangeTime;
        }

        break;
      default:
        {
          reportState = ReportState.initial;
        }
    }

    notifyListeners();
  }

  void initData() {
    data.addAll(initialData);
  }

  void onFilter() {
    data.clear();
    if (typeBiils == "Paid") {
      // data.clear();
      data.add(initialData[0]);
    } else if (typeBiils == "Unpaid") {
      data.add(initialData[1]);
    } else {
      data.addAll(initialData);
    }

    notifyListeners();
  }

  void changeTypeBiils(value) {
    typeBiils = value;
    notifyListeners();
  }

  void changeRangeTime(value) {
    rangeTime = value;
    notifyListeners();
  }

  void resetFilterAll() {
    typeBiils = "All";
    rangeTime = "1 Week";
    notifyListeners();
  }

  void resetTypeBiils() {
    typeBiils = "All";
    notifyListeners();
  }

  void resetRangeTime() {
    rangeTime = "1 Week";
    notifyListeners();
  }
}
