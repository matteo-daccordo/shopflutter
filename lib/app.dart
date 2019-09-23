import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter/views//profile_tab.dart';

import 'views/product_list_tab.dart';
import 'views/search_tab.dart';
import 'views/shopping_cart_tab.dart';

class StoreApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: StoreHomePage(),
		);
	}
}

class StoreHomePage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return CupertinoTabScaffold(
			tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
				BottomNavigationBarItem(
					icon: Icon(CupertinoIcons.home),
					title: Text('Home'),
				),
				BottomNavigationBarItem(
					icon: Icon(CupertinoIcons.search),
					title: Text('Search'),
				),
				BottomNavigationBarItem(
					icon: Icon(CupertinoIcons.shopping_cart),
					title: Text('Cart'),
				),
				BottomNavigationBarItem(
					icon: Icon(CupertinoIcons.profile_circled),
					title: Text('Profile'),
				)
			]),
			tabBuilder: (context, index) {
				CupertinoTabView returnValue;
				switch (index) {
					case 0:
						return CupertinoTabView(
							builder: (context) {
								return Scaffold(
									body: ProductListTab(),
								);
							});
						break;
					case 1:
						return CupertinoTabView(
							builder: (context) {
								return Scaffold(
									body: SearchTab(),
								);
							});
						break;
					case 2:
						return CupertinoTabView(
							builder: (context) {
								return Scaffold(
									body: ShoppingCartTab(),
								);
							});
						break;
					case 3:
						return CupertinoTabView(
							builder: (context){
								return Scaffold(
									body: ProfileTab(),
								);
							});
						break;
				}
				return returnValue;
			},
		);
	}
}
