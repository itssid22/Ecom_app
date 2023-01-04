import 'package:f_2_app/models/catalog.dart';
import 'package:f_2_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/services/asset_bundle.dart';
import "dart:convert";
import "package:velocity_x/velocity_x.dart";

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_image.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 4));
    final catalogJason =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJason);
    final decodeData = jsonDecode(catalogJason);
    // print(decodeData);
    var productsData = decodeData["products"];
    print(productsData);

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(
        () {}); //jab tak set state nahi bolte tab tak use pata nahi chalega ki reload karna hai
  }

  @override
  Widget build(BuildContext context) {
    var name = "siddhant";
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        //     appBar: AppBar(title: Text("           Catalog App")),
        //     body: Padding(
        //         padding: const EdgeInsets.all(16.0),
        //         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //             ? GridView.builder(
        //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                     mainAxisSpacing: 16,
        //                     crossAxisSpacing: 16),
        //                 itemBuilder: ((context, index) {
        //                   final item = CatalogModel.items[index];
        //                   return Card(
        //                       clipBehavior: Clip.antiAlias,
        //                       shape: RoundedRectangleBorder(
        //                           borderRadius: BorderRadius.circular(10)),
        //                       child: GridTile(
        //                         header: Container(
        //                           child: Text(
        //                             item.name,
        //                             style: TextStyle(color: Colors.white),
        //                           ),
        //                           padding: const EdgeInsets.all(10),
        //                           decoration:
        //                               BoxDecoration(color: Colors.deepPurple),
        //                         ),
        //                         child: Image.network(item.image),
        //                         footer: Container(
        //                           child: Text(
        //                             item.name,
        //                             style: TextStyle(color: Colors.white),
        //                           ),
        //                           padding: const EdgeInsets.all(10),
        //                           decoration: BoxDecoration(color: Colors.black),
        //                         ),
        //                       ));
        //                 }),
        //                 itemCount: CatalogModel.items.length,
        //               )
        //             : Center(
        //                 child: CircularProgressIndicator(),
        //               )),
        //     drawer: MyDrawer()
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if ((CatalogModel.items != null) &&
                    (CatalogModel.items.isNotEmpty))
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
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
        // Image.network(catalog.image)
        //     .box
        //     .p8
        //     .color(MyTheme.creamColor)
        //     .make()
        //     .p16()
        //     .w40(context),

        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                // buttonPadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.white.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        )
      ],
    )).white.roundedSM.square(160).make().py16();
  }
}
