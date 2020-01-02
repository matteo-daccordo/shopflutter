import 'package:flutter/material.dart';
import 'package:shop_flutter/model/product.dart';
import 'package:shop_flutter/model/product_repo.dart';
import 'package:shop_flutter/styles.dart';

class MostSoldCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Most Sold Products', style: Styles.subtitle),
              GestureDetector(
                onTap: () => print('See all'),
                child: Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ProductsRepository.loadProducts(Category.all).length,
            itemBuilder: (BuildContext context, int index ) {
              List<Product> list = ProductsRepository.loadProducts(Category.all);
              Product product = list[index];

            },
          ),
        ),
      ],
    );
  }
}
