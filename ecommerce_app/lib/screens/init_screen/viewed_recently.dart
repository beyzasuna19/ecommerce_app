import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_app/providers/viewed_recently_providers.dart';
import 'package:ecommerce_app/providers/wishlist_provider.dart';
import 'package:ecommerce_app/screens/cart/cart_widget.dart';
import 'package:ecommerce_app/screens/cart/empty_bag.dart';
import 'package:ecommerce_app/services/assets_manages.dart';
import 'package:ecommerce_app/widgets/products/product_widget.dart';
import 'package:ecommerce_app/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";

  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = true;


  @override
  Widget build(BuildContext context) {
    final  viewedProProvider =  Provider.of<ViewedProdProvider>(context);
    return viewedProProvider.getViewedProds.isEmpty?
    Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                if(Navigator.canPop(context)){
                  Navigator.pop(context);
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
            title:  TitleTextWidget(label: "Wishlist    ${viewedProProvider.getViewedProds.length}")
        ),
        body: EmptyBagWidget(
            imagePath: AssetsManager.searchrecent,
            title: "Your Viewed Recently is empty",
            subtitle: "Like your Viewed Recently is empty",
            buttonText: "shop Now")
    )
        :Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              if(Navigator.canPop(context)){
                Navigator.pop(context);
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          title: const TitleTextWidget(label: "Viewed Recently")
      ),
        body: DynamicHeightGridView(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          builder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductWidget(
                productId: viewedProProvider.getViewedProds.values.toList()[index].productId,
              ),
            );

          },
          itemCount: viewedProProvider.getViewedProds.length,
          crossAxisCount: 2,
        )

    );
  }
}
