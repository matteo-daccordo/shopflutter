import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_flutter/model/product.dart';
import 'package:shop_flutter/styles.dart';
import 'package:shop_flutter/views/profile_tab.dart';
import 'package:shop_flutter/views/search_tab.dart';
import 'package:shop_flutter/views/shopping_cart_tab.dart';
import 'package:shop_flutter/widgets/preferred_carousel.dart';

class StoreHomePage extends StatefulWidget{
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHomePage> {
  List<Widget> _pages;
  Widget _currentPage;

  List<IconData> _icons = [
      FontAwesomeIcons.coffee,
      FontAwesomeIcons.bed,
      FontAwesomeIcons.socks,
      FontAwesomeIcons.book,
    ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _currentTab;
  Widget homeTab;
  Widget searchTab;
  Widget cartTab;
  Widget profileTab;

  @override
  void initState(){
    super.initState();

    homeTab = homePage();
    searchTab = SearchTab();
    cartTab = ShoppingCartTab();
    profileTab = ProfileTab();
    _pages = [homeTab, searchTab, cartTab, profileTab];

    _currentPage = homeTab;
    _currentTab = 0;

  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print(index);
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: Styles.accentColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: Styles.primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
            _currentPage = _pages[value];
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: Colors.grey,),
            label: '',
            activeIcon: Icon(Icons.home, size: 30, color: Styles.primaryColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30, color: Colors.grey,),
            label: '',
            activeIcon: Icon(Icons.search, size: 30, color: Styles.primaryColor,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30, color: Colors.grey),
            label: '',
            activeIcon: Icon(Icons.shopping_cart, size: 30, color: Styles.primaryColor,),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
          ),
        ],
      )
    );
  }

  Widget homePage(){
    return SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'What would you buy today?',
                style: Styles.title,
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 24.0),
            PreferredCarousel(category: Category.all, title: 'Preferred items',),
            SizedBox(height: 24.0),
            PreferredCarousel(category: Category.home, title: 'Most sold items',),
          ],
        ),
      );
  }
}
