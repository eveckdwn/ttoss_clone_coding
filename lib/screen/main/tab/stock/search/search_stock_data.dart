import 'package:get/get.dart';

import '../../../../../common/common.dart';
import '../../../../../common/util/local_json.dart';
import '../vo_simple_stock.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    //  getx가 처음 생성될 때 실행
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    loadLocalStockJson();
    /*
    () async {
      stocks.addAll(await LocalJson.getObjectList("json/stock_list.json"));
    }();
    */
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>(
        "stock_list.json");
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    if (isBlank(keyword)) {
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value = stocks.where((element) => element.name.contains(keyword)).toList();
  }

  void addSearchHistory(String stockName) {
    searchHistoryList.insert(0, stockName);
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  void removeHistory(String stockName) {
    searchHistoryList.remove(stockName);
  }

  /*
  파라미터를 객체로 받을 경우, 객체 자체를 remove하면 안된다.
  조건을 부여하여 해당 객체를 지울 수 있도록 한다.
  void removeHistory(Stock stock) {
    searchHistoryList.removeWhere((element) => element.id == stock.id);
  }
  */
}