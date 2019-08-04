import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanage/providers/products_provider.dart';
import 'package:statemanage/screens/edit_product_screen.dart';
import 'package:statemanage/widgets/app_drawer.dart';
import 'package:statemanage/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeNamed = "/user-products";
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fatchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Products"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(
              children: <Widget>[
                UserProductItem(
                  productsData.items[i].title,
                  productsData.items[i].imageUrl,
                  productsData.items[i].id,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
