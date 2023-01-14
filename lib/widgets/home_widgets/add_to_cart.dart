import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        // toggle karne se jo bhi isInCart previous value ka opposite ho jata , yane ki true ho jayenge;

        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          // final _cart = CartModel();//humne ise uppar declare kkye hai
          _cart.Catalog = _catalog;
          _cart.add(widget.catalog);

          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : "+cart".text.white.make(),
    );
  }
}
