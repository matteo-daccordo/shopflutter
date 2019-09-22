import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_diary/model/product.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';

class ProductInfo extends StatelessWidget {
  Product product;

  ProductInfo(Product product) {
    this.product = product;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
      ),
      body: Center(
        child: _getProductInfo(),
      ),
    );
  }

  Widget _getProductInfo() {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16),
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
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              'Name: ' + product.name,
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              product.category.toString(),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              'isFeature: ' + product.isFeatured.toString(),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              'Price:' + product.price.toString(),
            ),
          ],
        )
    );
  }
}
