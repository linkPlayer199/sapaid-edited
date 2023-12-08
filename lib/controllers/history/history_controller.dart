import 'package:sapaid/constants/app_libraries.dart';

class HistoryController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();
  final List<Map<String, String>> mockTransactions = [
    {
      'title': 'Transaction 1',
      'amount': '100',
      'date': '2023-11-01',
      'type': 'In'
    },
    {
      'title': 'Transaction 2',
      'amount': '100',
      'date': '2023-11-01',
      'type': 'Out'
    },
    {
      'title': 'Transaction 3',
      'amount': '100',
      'date': '2023-11-01',
      'type': 'In'
    },
    {
      'title': 'Transaction 4',
      'amount': '100',
      'date': '2023-11-01',
      'type': 'Out'
    },
    // Add more mock transactions as needed
  ];

  @override
  void onReady() async {
    // await navigatetohome();
    isLoading = false;
    update();
    super.onReady();
  }
}
