import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../common/widget/w_image_button.dart';
import 'tab/f_my_stock.dart';
import 'tab/f_todays_discovery.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  late final TabController? tabController =
      TabController(length: 2, vsync: this);

  //  late: 변수의 초기화 과정을 생성자가 실행될 떄가 아니라 TabController가 필요할 때 생성된다.
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.appColors.roundedLayoutBackground,
          pinned: true,
          actions: [
            ImageButton(
              onTap: () {
                context.showSnackbar("검색");
              },
              imagePath: '$basePath/icon/stock_search.png',
            ),
            ImageButton(
              onTap: () {
                context.showSnackbar("캘린더");
              },
              imagePath: '$basePath/icon/stock_calendar.png',
            ),
            ImageButton(
              onTap: () {
                context.showSnackbar("설정");
              },
              imagePath: '$basePath/icon/stock_settings.png',
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabBar,
              if(currentIndex == 0)
                const MyStockFragment()
              else
                const TodaysDiscoveryFragment()
            ],
          ),
        )
      ],
    );
  }

  Widget get title => Container(
    color: context.appColors.roundedLayoutBackground,
    child: Row(
          children: [
            '토스증권'.text.size(24).bold.make(),
            width20,
            'S&P500'
                .text
                .size(13)
                .bold
                .color(context.appColors.lessImportant)
                .make(),
            width10,
            3919.29
                .toComma()
                .text
                .size(13)
                .bold
                .color(context.appColors.plus)
                .make(),
          ],
        ).pOnly(left: 20),
  );

  Widget get tabBar => Container(
    color: context.appColors.roundedLayoutBackground,
    child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  setState(() {
                    this.currentIndex = index;
                  });
                },
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelPadding: const EdgeInsets.symmetric(vertical: 20),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Colors.white,
                controller: tabController,
                tabs: ['내 주식'.text.make(), '오늘의 발견'.text.make()]),
            Line(),
          ],
        ),
  );
}
