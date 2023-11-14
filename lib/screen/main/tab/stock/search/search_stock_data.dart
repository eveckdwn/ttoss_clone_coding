import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../common/common.dart';
import '../../../../../common/util/local_json.dart';
import '../vo_simple_stock.dart';

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> searchResult = <SimpleStock>[].obs;

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

  Future<void> loadLocalStockJson() async{
    final jsonList = await LocalJson.getObjectList<SimpleStock>("stock_list.json");
    stocks.addAll(jsonList);
  }

  void search(String text) {
    if (isBlank(text)) {
      searchResult.clear();
      return;
    }
    searchResult.value = stocks.where((element) => element.stockName.contains(text)).toList();
  }

  void addSearchHistory(String stockName) {
    searchHistoryList.insert(0, stockName);
  }
}