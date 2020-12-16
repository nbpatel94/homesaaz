import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:homesaaz/app.dart';
import 'package:homesaaz/common/colorres.dart';
import 'package:homesaaz/common/common_widget.dart';
import 'package:homesaaz/model/cart_model.dart';
import 'package:homesaaz/screen/cart/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {

  CartViewModel model;

  @override
  Widget build(BuildContext context) {
    print("Current page --> $runtimeType");
    model ?? (model = CartViewModel(this));

    Size media = MediaQuery.of(context).size;
    double width = media.width;
    double height = media.height;

    return Scaffold(
      appBar: commonAppbar(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children : [
          ListView.builder(
            itemCount: model.newProductName.length,
            itemBuilder: (context, index) {
              CartModel cartItem = model.newProductName[index];
            return cartProductView(cartItem,this,model.newProductName);
          },),
          InkWell(
            onTap: () {

            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.07,
              width: width * 0.92,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: ColorRes.red,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Continue',
                style: new TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'NeueFrutigerWorld',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ]
      ),
    );
  }

}
