import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/model/app_state_model.dart';
import 'package:shop_flutter/model/product.dart';

class ProductRowItem extends StatefulWidget {
  const ProductRowItem({
    this.index,
    this.product,
    this.lastItem,
  });

  final Product product;
  final int index;
  final bool lastItem;

  @override
  _ProductRowItemState createState() => _ProductRowItemState();
}

class _ProductRowItemState extends State<ProductRowItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          height: 170.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(120.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.widget.product.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 10.0),
                Text(
                  '${this.widget.product.price} \$',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        FontAwesomeIcons.plusCircle,
                        semanticLabel: 'Minus',
                      ),
                      onPressed: () {
                        Provider.of<AppStateModel>(context)
                            .addProductToCart(widget.product.id);
                      },
                    ),
                    Text(
                    Provider.of<AppStateModel>(context).quantityItemCart(widget.index),
                    textAlign: TextAlign.center,
                  ),
                    FlatButton(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        FontAwesomeIcons.minusCircle,
                        semanticLabel: 'Minus',
                      ),
                      onPressed: () {
                        Provider.of<AppStateModel>(context)
                            .removeItemFromCart(widget.product.id);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 110.0,
              image: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
