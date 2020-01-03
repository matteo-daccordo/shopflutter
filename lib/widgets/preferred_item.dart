import 'package:flutter/material.dart';
import 'package:shop_flutter/model/product.dart';
import 'package:shop_flutter/styles.dart';
import 'package:shop_flutter/widgets/product_info.dart';

class PreferredItem extends StatefulWidget {
  final Product product;

  PreferredItem({this.product});

  @override
  _PreferredItemState createState() => _PreferredItemState();
}

class _PreferredItemState extends State<PreferredItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ProductInfo(
                    product: widget.product,
                  ))),
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 210.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 10.0,
              child: Container(
                height: 120.0,
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Styles.accentColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget.product.name} is here',
                        style: TextStyle(
                          fontSize: 22.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                        height: 180.0,
                        width: 180.0,
                        image: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    left: 15.0,
                    bottom: 20.0,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Uno',
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                        Text('Due',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
