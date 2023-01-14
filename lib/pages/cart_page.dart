import 'package:f_2_app/models/cart.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";
import '../utils/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:f_2_app/utils/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        leading: BackButton(color: context.accentColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: "         Cart"
            .text
            .xl4
            .color(context
                .accentColor) // cart page me cart ko dark theme me white color dene ke liye ek to yaha color de do, ya fir MyTheme ke dark theme mek jaake Theme.of(context).textTheme.copyWith(headline: contet.textTheme.headline6.copywith(color:Colors.whhite),)
            .make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            "\$${_cart.totalPrice}".text.xl4.make(),
            30.widthBox,
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Buying not supported yet !".text.make()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor)),
                    child: "Buy".text.white.make())
                .w32(context)
          ],
        ));
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(
                        () {}); //hum setState isliye likhte hai taki ye bata sake ki ui rebuil hona chahiye
                  },
                  icon: Icon(Icons.remove_circle)),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
