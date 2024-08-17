import 'package:ecommerce_app/models/wishlist_model.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier{
  final Map<String,  WishlistModel> _wishlistitems = {};
  Map<String, WishlistModel>  get  getWishlist {
    return  _wishlistitems;
  }
  void addOrderRemoveWishlist({required String productId}) {
    if (_wishlistitems.containsKey(productId)){
      _wishlistitems.remove(productId);
    }
     else{
       _wishlistitems.putIfAbsent(productId, () => WishlistModel(
           wishlistId: const Uuid().v4(), productId: productId),);
    }
     notifyListeners();
  }
  bool isProdingWishlist({required String productId}){
    return _wishlistitems.containsKey(productId);
  }
  void clearLocalWishlist(){
    _wishlistitems.clear();
    notifyListeners();
  }


  }
