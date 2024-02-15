import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220; 

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
          return _buildPageItem(position);
        }),
    );
  }

  Widget _buildPageItem (int index){

    Matrix4 matrix = new Matrix4.identity();

    if (index == _currentPageValue.floor()){
      var currScale = 1 - (_currentPageValue-index) * (1 - _scaleFactor);
      var currTrans = _height * (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currentPageValue.floor()+1){
      var currScale = _scaleFactor + (_currentPageValue-index+1) * (1 - _scaleFactor);
      var currTrans = _height * (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currentPageValue.floor()-1){
      var currScale = 1 - (_currentPageValue-index) * (1 - _scaleFactor);
      var currTrans = _height * (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor)/2, 1);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?const Color(0xFF69c5df): const Color(0xFF9294cc),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/food0.png")
            ),
          ),
        ),
      
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  BigText(text: "Chinese Side"),
      
                  const SizedBox(height: 10,),
      
                  Row(
                    children: [
      
                      Wrap(
                        children: List.generate(5, (index) {
                          return const Icon(Icons.star, color: AppColors.mainColor, size: 15,);
                        }),
                      ),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "4.5"),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "123456"),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "comments"),
      
                    ],
                  ),
      
                  const SizedBox(height: 20,),
      
                  const Row(
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp, 
                        text: "Normal", 
                        iconColor: AppColors.iconColor1,
                      ),
      
                      IconAndTextWidget(
                        icon: Icons.location_on, 
                        text: "1.7km", 
                        iconColor: AppColors.iconColor1,
                      ),
      
                      IconAndTextWidget(
                        icon: Icons.access_time_outlined, 
                        text: "32min", 
                        iconColor: AppColors.iconColor1,
                      ),
      
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      
        ],
      ),
    );
  }
}