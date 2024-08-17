import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/widgets/subtitle_text.dart';
import 'package:flutter/cupertino.dart';

class CategoryRoundendWidget extends StatelessWidget {
  const CategoryRoundendWidget({
    super.key,
  required this.image,
  required this.name ,});

  final String image,name;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SearchScreen.routName, arguments: name);
      },
      child:   Column(
          children: [
            Image.asset(image, height: 50, width: 50,),
            const SizedBox(height: 5,),
            SubTitleTextWidget(label: name, fontSize: 13, fontWeight: FontWeight.w900,)
          ],
        ),
    );


      Column(
      children: [
        Image.asset(image, height: 50, width: 50,),
        const SizedBox(height: 5,),
        SubTitleTextWidget(label: name, fontSize: 13, fontWeight: FontWeight.w900,)
      ],
    );
  }
}
