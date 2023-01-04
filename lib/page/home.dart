import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> data = [];
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex=0;
    data = [
      {
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      },
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
          onTap: () {
            print('click');
          },
          child: Row(
            children: [Text('아라동'), Icon(Icons.arrow_drop_down)],
          )),
      elevation: 1,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg/bell.svg",
              width: 22,
            )),
      ],
    );
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return '${oCcy.format(int.parse(priceString))}원';
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      data[index]["image"].toString(),
                      width: 100,
                      height: 100,
                    )),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 5),
                    // width: 300,

                    width: MediaQuery.of(context).size.width - 100,
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]["title"]!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data[index]["location"]!,
                          style: TextStyle(
                              fontSize: (12),
                              color: Colors.black.withOpacity((0.5))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          calcStringToWon(data[index]["price"]!),

                          // data[index]["price"]!,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Container(
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/heart_off.svg",
                                  width: 12,
                                  height: 12,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(data[index]["likes"]!),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
      separatorBuilder: (BuildContext _context, int index) {
        // return Container(height: 1, color: Color(0xff999999));
        return Container(height: 1, color: Colors.black.withOpacity(0.4));
      },
      itemCount: 10,
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName, String label){
    return  BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset(
            "assets/svg/${iconName}_off.svg",
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
        onTap: (int index){
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
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
