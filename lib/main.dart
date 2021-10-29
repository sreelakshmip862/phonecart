import 'package:flutter/material.dart';
import 'package:phonecart/provider/CartProvider.dart';
import 'package:phonecart/screens/bottom_tab.dart';
import 'package:phonecart/screens/cart.dart';
import 'package:phonecart/screens/product_detail/product_details.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'phonecart',
        theme: ThemeData(

          primarySwatch: Colors.red,
        ),

        routes: {
          '/':(context)=>BottomNavBar(),
          '/product_detail':(context)=>ProductDetail(),
          '/my_cart':(context)=>Cart(),
        },
      ),
    );
  }
}

