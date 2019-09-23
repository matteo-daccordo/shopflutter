import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter/model/app_state_model.dart';
import 'package:provider/provider.dart';



class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() {
    return _ProfileTabState();
  }
}

class _ProfileTabState extends State<ProfileTab> {
  String email;
  String name;
  String location;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Your Profile'),
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

  Widget _buildIconField() {
    return CircleAvatar(
      child: Icon(
        CupertinoIcons.profile_circled,
        size: 100,
      ),
      radius: 100,
      backgroundColor: CupertinoColors.lightBackgroundGray,
    );
  }

  TextField _buildTextField(String label) {
    return TextField(
      scrollPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: (newName) {
        setState(() {
          name = newName;
        });
      },
    );
  }

  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(
      AppStateModel model) {
    return SliverChildBuilderDelegate(
      (context, index) {
        switch (index) {
          case 0:
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16),
              child: _buildIconField(),
            );case 1:
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16),
            child: _buildTextField("Name"),
          );
          case 2:
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16),
              child: _buildTextField("Email"),
            );
          case 3:
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16),
              child: _buildTextField("Location"),
            );
          default:
          // Do nothing. For now.
        }
        return null;
      },
    );
  }
}
