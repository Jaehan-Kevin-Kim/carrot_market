import 'package:carrot_market/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Map<String, String>> data = [];
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        return Container();
        break;
    }
    return Container();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          "assets/svg/${iconName}_off.svg",
          width: 22,
          height: 22,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          "assets/svg/${iconName}_on.svg",
          width: 22,
          height: 22,
        ),
      ),
      label: label,
    );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          print(index);
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        // selectedLabelStyle: TextStyle(color: Colors.),
        items: [
          _bottomNavigationBarItem("home", "home"),
          _bottomNavigationBarItem("notes", "동네생활"),
          _bottomNavigationBarItem("location", "내 근처"),
          _bottomNavigationBarItem("chat", "채팅"),
          _bottomNavigationBarItem("user", "나의 당근"),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
