import 'package:flutter/material.dart';
import 'package:shop_flutter/model/product.dart';
import 'package:shop_flutter/model/product_repo.dart';
import 'package:shop_flutter/styles.dart';
import 'package:shop_flutter/widgets/preferred_item.dart';

class PreferredCarousel extends StatefulWidget {
  final Category category;
  final String title;

  PreferredCarousel({this.category, this.title});
  @override
  _PreferredCarouselState createState() => _PreferredCarouselState();
}

class _PreferredCarouselState extends State<PreferredCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(this.widget.title,
                  style: Styles.subtitle),
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
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  ProductsRepository.loadProducts(this.widget.category).length,
              itemBuilder: (BuildContext context, int index) {
                List<Product> list =
                    ProductsRepository.loadProducts(this.widget.category);
                Product product = list[index];
                return PreferredItem(product: product);
              }),
        ),
      ],
    );
  }
}
