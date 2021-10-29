import 'package:flutter/material.dart';
import 'package:phonecart/screens/Search.dart';

import '../../Constraints.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
     this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(


      height: size.height * 0.18,

      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.5 - 23,
            decoration: const BoxDecoration(
              color: primaryColor,

            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'PhoneCart',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){

                  },
                      icon: const Icon(Icons.notifications,color: Colors.white,)),


                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 42,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                },
                child: Row(
                  children: <Widget>[
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                    },
                        icon: const Icon(Icons.search,color: Colors.grey,)),


                    Expanded(
                      child: TextField(
                        enabled: false,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search Products",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,

                        ),
                      ),
                    ),
                    ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}