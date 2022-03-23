import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onboarding_demo/models/home/banner/ARMY/MODEL_banner_ARMY.dart';
import 'package:onboarding_demo/views/danh-muc-san-pham/category_screen.dart';
import 'package:onboarding_demo/views/SearchScreen.dart';

import 'package:onboarding_demo/views/trang-san-pham/Army/ArmyScreen.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/MenScreen.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/components/body.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/components/title.dart';
import 'package:onboarding_demo/views/trang-san-pham/Women/WomenScreen.dart';
import 'package:onboarding_demo/views/loai-san-pham/Categoies_List_Army.dart';

import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/trang-san-pham/Army/components/item-card_Army.dart';
import 'package:onboarding_demo/views/trang-san-pham/Women/components/body.dart';

class BodyArmy extends StatefulWidget {
  BodyArmy({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<BodyArmy> {
  final _controller = TextEditingController();
  int _currentMen = 0;
  int _currentWomen = 0;
  int _currentArmy = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[1]));
    }
  }

  List<String> categories = [
    "Men",
    "Women",
    "Army",
  ];

  // first index will be selected

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            main(context, size),
            // bottom_bar(
            //   size,
            // )
          ],
        ),
      ),
    );
  }

  Positioned main(BuildContext context, Size size) {
    return Positioned(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KDefaultPadding),
              child: SizedBox(
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildTapBar(index),
                ),
              ),
            ),

            builBannerARMY(context),

            Categories_List_Army(size: size),

            title(), // You might also like

            item_card_Army(size: size),
          ],
        ),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: 70,
        width: size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    "New",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "RobotoMono",
                    ),
                  ),
                  Text(
                    "chic",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 250,
              height: 40,
              child: TextField(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Search',
                  prefixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTapBar(int index) {
    Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context).settings.arguments as int;
    int selectedIndex = args;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyMen(),
                settings: RouteSettings(
                  arguments: selectedIndex,
                ),
              ),
            );
          }
          if (selectedIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyWomen(),
                settings: RouteSettings(
                  arguments: selectedIndex,
                ),
              ),
            );
          }

          if (selectedIndex == 2) {
            print(index);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyArmy(),
                settings: RouteSettings(
                  arguments: selectedIndex,
                ),
              ),
            );
          }

          // if (selectedIndex == 3) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ArmyScreen(),
          //       settings: RouteSettings(
          //         arguments: selectedIndex,
          //       ),
          //     ),
          //   );
          // }
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.red : KTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: KDefaultPadding / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget builBannerARMY(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            child: Swiper(
              onIndexChanged: (index) {
                _currentArmy = index;
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              itemCount: bannersARMY.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(bannersARMY[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int selectedIndex = 0;
  Positioned bottom_bar(Size size) {
    return new Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenScreen(),
                    ),
                  );
                });
              },
              icon: Icon(Icons.home),
              iconSize: 30,
              color: selectedIndex == 0 ? Colors.pink : Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.category_outlined),
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(),
                      settings: RouteSettings(
                        arguments: selectedIndex,
                      ),
                    ),
                  );
                });
              },
              color: selectedIndex == 1 ? Colors.pink : Colors.black,
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              icon: Icon(Icons.whatshot_outlined),
              iconSize: 30,
              color: selectedIndex == 2 ? Colors.pink : Colors.black,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              icon: Icon(Icons.chat_bubble_outline),
              iconSize: 30,
              color: selectedIndex == 3 ? Colors.pink : Colors.black,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 4;
                });
              },
              icon: Icon(Icons.person_outline),
              iconSize: 30,
              color: selectedIndex == 4 ? Colors.pink : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
