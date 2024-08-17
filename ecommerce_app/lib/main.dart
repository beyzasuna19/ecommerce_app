import 'package:ecommerce_app/constans/theme.data.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:ecommerce_app/providers/viewed_recently_providers.dart';
import 'package:ecommerce_app/providers/wishlist_provider.dart';
import 'package:ecommerce_app/root_screen.dart';
import 'package:ecommerce_app/screens/auth/forgot_password.dart';
import 'package:ecommerce_app/screens/auth/login.dart';
import 'package:ecommerce_app/screens/auth/register.dart';
import 'package:ecommerce_app/screens/init_screen/viewed_recently.dart';
import 'package:ecommerce_app/screens/init_screen/wishlist.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/widgets/order/order_screen.dart';
import 'package:ecommerce_app/widgets/products/product_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>
      (future: Firebase.initializeApp(
      name: "ecommerce",
        options: const FirebaseOptions(
          apiKey: 'AIzaSyDBcPJzpzJaD7DcynHXpfpcbIVkVTX3Xms',
          appId: '1:346709932222:web:593c0ae84cf2bc5e09c6ef',
          messagingSenderId: '346709932222',
          projectId: 'ecommerce-d61aa',
          storageBucket: 'ecommerce-d61aa.appspot.com',
        )
    ),
        builder: (context, snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home:Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            );
          }
          else if(snapshot.hasError){
            return  MaterialApp(
                debugShowCheckedModeBanner: false,
                home:Scaffold(
                  body: Center(
                    child: SelectableText(snapshot.error.toString()),
                  ),
                )
            );

          }




          return MultiProvider(providers: [
            ChangeNotifierProvider(create: (_){
              return ThemeProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return ProductProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return CartProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return WishlistProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return ViewedProdProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return UserProvider();
            }),

          ],
            child: Consumer<ThemeProvider>(builder: (context, themeProvider, child){
              return MaterialApp(
                title: 'Eccomerce Ap ',
                theme: Styles.themeData(isDarkTheme: themeProvider.getIsDarkTheme, context: context),

                home:const LoginScreen(),
               // home:const RootScreen(),
                routes: {
                  ProductDetailScreen.routName : (context)=> const ProductDetailScreen(),
                  RootScreen.routName : (context)=> const RootScreen(),
                  WishlistScreen.routName : (context)=> const WishlistScreen(),
                  ViewedRecentlyScreen.routName : (context)=> const ViewedRecentlyScreen(),
                  RegisterScreen.routName : (context)=> const RegisterScreen(),
                  OrderScreen.routName : (context)=> const OrderScreen(),
                  ForgotPassword.routName : (context)=> const ForgotPassword(),
                  SearchScreen.routName : (context)=> const SearchScreen(),
                  LoginScreen.routName : (context)=> const LoginScreen(),


                },
              );


            }),

          );
        }
    );
  }
}
