import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/widgets/product_row_item.dart';
import 'package:shop_flutter/widgets/search_bar.dart';
import '../model/app_state_model.dart';
import '../styles.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _terms = '';

  @override
  Widget build(BuildContext context) {
    return _buildSearch(context);
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearch(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final results = model.search(_terms);
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBox(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: results.length,
                itemBuilder: (context, index) => ProductRowItem(
                  index: index,
                  product: results[index],
                  lastItem: index == results.length - 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
}
