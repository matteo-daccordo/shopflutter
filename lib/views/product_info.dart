import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter/model/product.dart';

class ProductInfo extends StatelessWidget {
  Product product;

  ProductInfo(Product product) {
    this.product = product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product'),
        ),
        body: Center(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 350,
                height: 500,
                child: Center(
                  child: _getProductInfo(),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _getProductInfo() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.cover,
                width: 250,
                height: 250,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 64)),
            Text(
              'Name: ' + product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              product.category.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              'isFeature: ' + product.isFeatured.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              'Price: ' + product.price.toString() +  " Euros",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ));
  }
}
