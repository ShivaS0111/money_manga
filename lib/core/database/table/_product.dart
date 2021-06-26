import 'package:floor/floor.dart';

@entity
class Product {
  @primaryKey
  int product_id;
  String primary_image;
  String thumbnail_image;
  String product_title;
  int category_id;
  int brand_id;
  int manufacturer_id;
  int prod_inv;
  String esp;
  String mrp;
  String variant_value1;
  String variant_value2;
  String variant_value3;
  int is_parent;
  String key_value_index;
  int parent_id;
  String meta_keywords;
  int esu;
  String star;
  String pack_type;
  int cashback_flag;
  int is_sponsered;
  String config_id;
  String categoryName;
  String product_point;
  String le_wh_id;
  int minimun_order_value;
  int minimun_order_count;

  Product.fromJson(Map<String, dynamic> map)
      : product_id = map["product_id"],
        primary_image = map["primary_image"],
        thumbnail_image = map["thumbnail_image"],
        product_title = map["product_title"],
        category_id = map["category_id"],
        brand_id = map["brand_id"],
        manufacturer_id = map["manufacturer_id"],
        prod_inv = map["prod_inv"],
        esp = map["esp"],
        mrp = map["mrp"],
        variant_value1 = map["variant_value1"],
        variant_value2 = map["variant_value2"],
        variant_value3 = map["variant_value3"],
        is_parent = map["is_parent"],
        key_value_index = map["key_value_index"],
        parent_id = map["parent_id"],
        meta_keywords = map["meta_keywords"],
        esu = map["esu"],
        star = map["star"],
        pack_type = map["pack_type"],
        cashback_flag = map["cashback_flag"],
        is_sponsered = map["is_sponsered"],
        config_id = map["config_id"],
        categoryName = map["categoryName"],
        product_point = map["product_point"],
        le_wh_id = map["le_wh_id"],
        minimun_order_value = map["minimun_order_value"],
        minimun_order_count = map["minimun_order_count"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = product_id;
    data['primary_image'] = primary_image;
    data['thumbnail_image'] = thumbnail_image;
    data['product_title'] = product_title;
    data['category_id'] = category_id;
    data['brand_id'] = brand_id;
    data['manufacturer_id'] = manufacturer_id;
    data['prod_inv'] = prod_inv;
    data['esp'] = esp;
    data['mrp'] = mrp;
    data['variant_value1'] = variant_value1;
    data['variant_value2'] = variant_value2;
    data['variant_value3'] = variant_value3;
    data['is_parent'] = is_parent;
    data['key_value_index'] = key_value_index;
    data['parent_id'] = parent_id;
    data['meta_keywords'] = meta_keywords;
    data['esu'] = esu;
    data['star'] = star;
    data['pack_type'] = pack_type;
    data['cashback_flag'] = cashback_flag;
    data['is_sponsered'] = is_sponsered;
    data['config_id'] = config_id;
    data['categoryName'] = categoryName;
    data['product_point'] = product_point;
    data['le_wh_id'] = le_wh_id;
    data['minimun_order_value'] = minimun_order_value;
    data['minimun_order_count'] = minimun_order_count;
    return data;
  }

  Product(
      this.product_id,
      this.primary_image,
      this.thumbnail_image,
      this.product_title,
      this.category_id,
      this.brand_id,
      this.manufacturer_id,
      this.prod_inv,
      this.esp,
      this.mrp,
      this.variant_value1,
      this.variant_value2,
      this.variant_value3,
      this.is_parent,
      this.key_value_index,
      this.parent_id,
      this.meta_keywords,
      this.esu,
      this.star,
      this.pack_type,
      this.cashback_flag,
      this.is_sponsered,
      this.config_id,
      this.categoryName,
      this.product_point,
      this.le_wh_id,
      this.minimun_order_value,
      this.minimun_order_count);
}
