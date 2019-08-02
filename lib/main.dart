import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanage/providers/cart.dart';
import 'package:statemanage/providers/orders.dart';
import 'package:statemanage/providers/products_provider.dart';
import 'package:statemanage/screens/cart_screen.dart';
import 'package:statemanage/screens/edit_product_screen.dart';
import 'package:statemanage/screens/foody_1.dart';
import 'package:statemanage/screens/orders_screen.dart';
import 'package:statemanage/screens/product_details_screen.dart';
import 'package:statemanage/screens/products_overview_screen.dart';
import 'package:statemanage/screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: "Lato"),
        title: 'My Shop App',
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx)=> OrdersScreen(),
          UserProductsScreen.routeNamed: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          Foody1Page1.routeName: (ctx) => Foody1Page1(),
        },
      ),
    );
  }
}
