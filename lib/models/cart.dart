import 'package:f_2_app/models/catalog.dart';

class CartModel {
  //
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

//above is the example of the singleton class
//

  //catalog field
  late CatalogModel _catalog;

  // collection of IDs - store ids of each item

  final List<int> _itemIds = [];

  //get catalog

  CatalogModel get catalog => _catalog;

  set Catalog(CatalogModel newCatalog) {
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
