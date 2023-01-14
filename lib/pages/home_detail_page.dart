import 'package:f_2_app/utils/themes.dart';
import 'package:f_2_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage(
      {super.key,
      required this.catalog}); //watch video at 5:31:50 if any problem comes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          // buttonPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            // ElevatedButton(
            //   onPressed: () {
            //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         content: "Buying not supported yet !".text.make()));
            //   },
            //   style: ButtonStyle(
            //       backgroundColor:
            //           MaterialStateProperty.all(context.theme.buttonColor),
            //       shape: MaterialStateProperty.all(StadiumBorder())),
            //   child: "+cart".text.white.make(),
            // )//we are replacing the entire elevated button by AddToCart
            AddToCart(
              catalog: catalog,
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              // .p32(),
              .h32(context),
          Expanded(
              child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth, //it does full width of image
                    child: Column(
                      children: [
                        catalog.name.text.xl3
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        10.heightBox,
                        "Erat no amet dolor magna ipsum takimata no sea ipsum gubergren, sanctus ea sanctus sea ipsum et vero. Kasd dolor sit amet justo nonumy, aliquyam no eirmod stet magna elitr, kasd ea erat et tempor et sed vero."
                            .text
                            .textStyle(context.captionStyle)
                            .size(14)
                            .make()
                            .px16(),
                      ],
                    ).py64(),
                  )))
        ],
      )),
    );
  }
}
