import 'package:flutter/material.dart';

import 'package:onboarding_demo/models/home/categories/categories_model_WOMEN.dart';

class Categories_List_Women extends StatelessWidget {
  const Categories_List_Women({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: size.width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: categoriesWomen.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // số lượng hình ảnh muốn đẩy lên
          childAspectRatio: 0.75,
          mainAxisSpacing: 0, // khoảng cách trên dưới
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(categoriesWomen[index].image),
                    ),
                    Text(categoriesWomen[index].name),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
