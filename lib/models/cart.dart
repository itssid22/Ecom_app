// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html';

import 'package:vxstate/vxstate.dart';

import 'package:f_2_app/core/store.dart';
import 'package:f_2_app/models/catalog.dart';

class CartModel {
  //
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

//above is the example of the singleton class
//but we are commenting the whole above singleton code because , we have made code more efficient by writting efficient code in Mystore

  //catalog field
  late CatalogModel _catalog;

  // collection of IDs - store ids of each item

  final List<int> _itemIds = [];

  //get catalog

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // now we'll get items in the cart

  List<Item> get items => _itemIds.map(((id) => _catalog.getById(id))).toList();
//get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });
  @override
  perform() {
    // TODO: implement perform
    store?.cart._itemIds.add(item.id);
  }
}
