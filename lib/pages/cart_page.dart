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
    );
  }
}
