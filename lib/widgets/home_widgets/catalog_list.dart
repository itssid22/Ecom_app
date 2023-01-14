// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:f_2_app/models/cart.dart';
import 'package:f_2_app/pages/home_detail_page.dart';
import 'package:f_2_app/widgets/home_widgets/catalog_image.dart';

import '../../models/catalog.dart';
import '../../pages/home_page.dart';
import '../../utils/themes.dart';
import 'package:f_2_app/widgets/home_widgets/add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: ((context, index) {
          final catalog = CatalogModel.items[
              index]; //is line ke badle niche wale methods bhi use kar sakte items ko accesss karne ke liye
          // final catalog = CatalogModel.getByPosition(index);
          // final catalog = CatalogModel.getById(index);

          return InkWell(
            child: CatalogItem(catalog: catalog),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => HomeDetailPage(catalog: catalog)))),
          );
        }));
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                // buttonPadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(
                  //           context.theme.buttonColor),
                  //       shape: MaterialStateProperty.all(StadiumBorder())),
                  //   child: "+cart".text.white.make(),
                  // )//is commented lines ke badle hum yaha _AddToCart class likh rahe hai , jisme humne pura elevatedButton likha hai
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        )
      ],
    )).color(context.cardColor).roundedSM.square(160).make().py16();
  }
}






//  Below code has been added to seperate file named as add_to_cart.dart
// class _AddToCart extends StatefulWidget {
//   final Item catalog;
//   const _AddToCart({
//     Key? key,
//     required this.catalog,
//   }) : super(key: key);

//   @override
//   State<_AddToCart> createState() => AddToCartState();
// }

// class AddToCartState extends State<_AddToCart> {
//   final _cart = CartModel();
//   @override
//   Widget build(BuildContext context) {
//     bool isInCart = _cart.items.contains(widget.catalog) ?? false;
//     return ElevatedButton(
//       onPressed: () {
//         // toggle karne se jo bhi isInCart previous value ka opposite ho jata , yane ki true ho jayenge;

//         if (!isInCart) {
//           isInCart = isInCart.toggle();
//           final _catalog = CatalogModel();
//           // final _cart = CartModel();//humne ise uppar declare kkye hai
//           _cart.Catalog = _catalog;
//           _cart.add(widget.catalog);

//           setState(() {});
//         }
//       },
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
//           shape: MaterialStateProperty.all(StadiumBorder())),
//       child: isInCart ? Icon(Icons.done) : "+cart".text.white.make(),
//     );
//   }
// }
