import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";
import '../utils/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: "         Cart".text.xl4.color(context.accentColor).make(),
      ),
    );
  }
}
