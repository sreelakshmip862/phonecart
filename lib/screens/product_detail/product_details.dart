import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phonecart/Model/CartModel.dart';
import 'package:phonecart/provider/CartProvider.dart';

import 'package:provider/provider.dart';

import '../../constraints.dart';
import '../cart.dart';
class ProductDetail extends StatefulWidget {
  const ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductArguments productId;
  int quantity = 0;
  bool isAdded=false;
  @override
  Widget build(BuildContext context) {
    productId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title:  Text(
          "Product Details",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),

        actions: [
          Consumer<CartProvider>(builder: (context, cartProvider, child) {
            return  InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, "/my_cart");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Badge(
                  badgeColor: Colors.white,
                  position: BadgePosition.topEnd(top: 2),
                  badgeContent: Text(cartProvider.cartCount.toString(),style: TextStyle(color: primaryColor,fontSize: 13,fontWeight: FontWeight.w600),),
                  child: Icon(Icons.shopping_cart,color: Colors.white,size: 23,),
                ),
              ),
            );
          },),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 300,
                    width: 200,
                    color: Colors.white,
                    child: Image.network('https://omanphone.smsoman.com/pub/media/catalog/product/${productId
                        .image}'),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 25,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          //topLeft: Radius.circular(5),
                          topRight: Radius.circular(10),
                        )),
                    child: Center(
                      child: Text(
                        productId.storage,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Text(
              productId.name,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "OMR "+productId.price.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),

              ],
            ),
            SizedBox(height: 25,),
            SizedBox(
              height: 50,
              width: 450,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      elevation: 0
                  ),
                  onPressed: (){


                    setState(() {
                      isAdded=true;

                      addItem();
                    });

                  },
                  child:isAdded==true?Text("go to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0)
                  )
                      :Text("Add to Cart",
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

    );
  }
  void addItem()  {

    setState(() {

        CartModel item = new CartModel(
          id: productId.id,
          image: productId.image,
          name: productId.name,
          preorder: productId.preorder,
          price: productId.price,
          productTag: productId.productTag,
          rating: productId.rating,
          sku: productId.sku,
          storage: productId.storage,
          quantity: quantity,
          specialPrice: productId.specialPrice,

        );
        Provider.of<CartProvider>(context, listen: false).addToCart(item);

        quantity=0;
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            content: Container(
              //color: Colors.redAccent.shade100,
                height: 20,
                child: Text('Item Added',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),)),
            action: SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
          ),
        );


     // }

    });
  }


  void addQty() {
    setState(() {
      quantity += 1;
      Provider.of<CartProvider>(context,listen: false).addQuantity(productId.id);
    });
  }

  void removeItem() {
    setState(() {
      if (quantity != 0) {
        quantity -= 1;

        Provider.of<CartProvider>(context,listen: false).reduceQuantity(productId.id);

      }
    });
  }
}
class ProductArguments{
  String name;
  String id;
  String sku;
  String image;
  double price;
  int specialPrice;
  String rating;
  String storage;
  String productTag;
  String preorder;
  ProductArguments({
    this.name,
    this.id,
    this.sku,
    this.image,
    this.price,
    this.specialPrice,
    this.rating,
    this.storage,
    this.productTag,
    this.preorder,
  });
}