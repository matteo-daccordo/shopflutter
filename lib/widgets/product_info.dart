import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter/model/product.dart';
import 'package:shop_flutter/styles.dart';

class ProductInfo extends StatefulWidget {
  final Product product;

  ProductInfo({this.product});

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 30.0,
                        onPressed: () => Navigator.pop(context),
                        color: Colors.white38,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.product.name,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        '${widget.product.price} \$',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 450,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Styles.accentColor),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}
