import 'package:flutter/material.dart';
import 'package:my_bqg_app/pages/home/nav_bottom_page/book_shelf.dart';
import 'package:my_bqg_app/pages/home/nav_bottom_page/book_town.dart';
import 'package:my_bqg_app/pages/home/nav_bottom_page/my_profile.dart';
import 'package:my_bqg_app/public.dart';
import 'package:my_bqg_app/utils/color_util.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

class HomePage extends StatefulWidget {
  Map? arguments;
  HomePage({Key? key, this.arguments}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _showBottomNav = true;
  //IndexedStackChild 懒加载包裹，底部tab切换时缓存tab状态,不重复请求接口
  final List<IndexedStackChild> _pageList = [
    IndexedStackChild(child: BookShelf()),
    IndexedStackChild(child: BookTown()),
    IndexedStackChild(child: MyProfile()),
  ];

  final List<dynamic> _navList = [
    {
      "label": '书架',
      "icon": Image.asset('assets/images/icons/home.png', width: 24, height: 24),
      "activeIcon": Image.asset(
          'assets/images/icons/home_active.png', width: 24, height: 24)
    },
    {
      "label": '书城',
      "icon": Image.asset('assets/images/icons/music.png', width: 24, height: 24),
      "activeIcon": Image.asset(
          'assets/images/icons/music_active.png', width: 24, height: 24)
    },
    {
      "label": '我的',
      "icon": Image.asset(
          'assets/images/icons/profile.png', width: 24, height: 24),
      "activeIcon": Image.asset(
          'assets/images/icons/profile_active.png', width: 24, height: 24)
    }
  ];

  _HomePageState();

  @override
  void initState() {
    super.initState();
    if (widget.arguments != null && widget.arguments!['selectIndex'] >= 0) {
      int selectIndex = widget.arguments!['selectIndex'] >= 0 ? widget.arguments!['selectIndex'] : 0;
      setState(() {
        _currentIndex = selectIndex;
      });
    }
    eventBus.on(EventMessage.eventHideBottomNav, _controlBottomNav);

  }

  @override
  void dispose() {
    super.dispose();
    eventBus.off(EventMessage.eventHideBottomNav, _controlBottomNav);
  }

  // 控制底部导航栏显示与隐藏
  _controlBottomNav(show) {
    _showBottomNav = show;
    setState(() {});
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProsteIndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
      bottomNavigationBar: _showBottomNav ? BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        fixedColor: ColorUtil.primary,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        // fixedColor: const Color.fromRGBO(255,195,0,1),
        type: BottomNavigationBarType.fixed,
        items: _navList.map((item) => BottomNavigationBarItem(label: item['label'], icon: item['icon'], activeIcon: item['activeIcon'])).toList(),
      ) : const SizedBox.shrink(),
    );
  }


}