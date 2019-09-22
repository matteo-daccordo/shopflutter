import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:movies_diary/styles.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../model/app_state_model.dart';

class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  final _currencyFormat = NumberFormat.currency(symbol: '\$');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            ),
            SliverSafeArea(
                top: false,
                minimum: const EdgeInsets.only(top: 4),
                sliver: SliverList(
                  delegate: _buildSliverChildBuilderDelegate(model),
                )),
          ],
        );
      },
    );
  }

  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(
      AppStateModel model) {
    return SliverChildBuilderDelegate((context, index) {
      if (model.productsInCart.length > index) {
        return ShoppingCartItem(
          index: index,
          product:
              model.getProductById(model.productsInCart.keys.toList()[index]),
          quantity: model.productsInCart.values.toList()[index],
          lastItem: index == model.productsInCart.length - 1,
          formatter: _currencyFormat,
        );
      } else if (model.productsInCart.keys.length == index &&
          model.productsInCart.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Shipping '
                    '${_currencyFormat.format(model.shippingCost)}',
                    style: Styles.productRowItemPrice,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tax ${_currencyFormat.format(model.tax)}',
                    style: Styles.productRowItemPrice,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Total  ${_currencyFormat.format(model.totalCost)}',
                    style: Styles.productTotal,
                  ),
                ],
              )
            ],
          ),
        );
      } else if (model.productsInCart.keys.length == 0 && index == 0) {
        return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('No element in the cart',
                  style: Styles.productTotal,
                )],
            ));
      } else
        return null;
    });
  }
}

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    @required this.index,
    @required this.product,
    @required this.lastItem,
    @required this.quantity,
    @required this.formatter,
  });

  final Product product;
  final int index;
  final bool lastItem;
  final int quantity;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
          right: 8,
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: Styles.productRowItemName,
                        ),
                        Text(
                          '${formatter.format(quantity * product.price)}',
                          style: Styles.productRowItemName,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${quantity > 1 ? '$quantity x ' : ''}'
                      '${formatter.format(product.price)}',
                      style: Styles.productRowItemPrice,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return row;
  }
}
