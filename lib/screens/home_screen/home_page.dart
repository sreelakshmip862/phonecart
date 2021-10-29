import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'mobile_phone.dart';
import 'featured_items.dart';
import 'package:phonecart/screens/Viewall.dart';

import 'package:provider/provider.dart';
import '../../constraints.dart';

import 'header_with_search.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithSearchBox(size: size),
            SizedBox(
              height: 170,
              width: double.infinity,
              child: Image.asset("assets/images/banner.jpg",
                fit: BoxFit.cover,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Mobile Phones",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 135,),

                  SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            elevation: 0
                        ),
                        onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Viewall()));




                        },
                        child:Text("View All",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0)
                        )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(

                  height: 250,


                  child:MobilePhones()
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Featured Items",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 130,),

                  SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            elevation: 0
                        ),
                        onPressed: (){


                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewall()));


                        },
                        child:Text("View All",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0)
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(

                  height: 250,


                  child:FeaturedItem()
              ),
            ),
          ],
        ),
      ),
    );
  }


}
