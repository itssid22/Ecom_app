import 'package:f_2_app/utils/themes.dart';
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
        backgroundColor: MyTheme.creamColor,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          // buttonPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Buy".text.white.make(),
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
                    color: Colors.white,
                    width: context.screenWidth, //it does full width of image
                    child: Column(
                      children: [
                        catalog.name.text.xl3
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        10.heightBox,
                      ],
                    ).py64(),
                  )))
        ],
      )),
    );
  }
}
