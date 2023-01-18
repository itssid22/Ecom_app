import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import 'package:f_2_app/core/store.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    // VxState.listen(context, to: [AddMutation]);
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;//the catalogModel doesn't matter so we are commenting

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        // toggle karne se jo bhi isInCart previous value ka opposite ho jata , yane ki true ho jayenge;

        if (!isInCart) {
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          // final _cart = CartModel();//humne ise uppar declare kkye hai
          // _cart.catalog = _catalog;
          // _cart.add(catalog);

          AddMutation(item: catalog);

          // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : "+cart".text.white.make(),
    );
  }
}
