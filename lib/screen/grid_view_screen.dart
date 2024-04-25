import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'GridViewScreen',
        body: renderMaxExtent(),
    );
  }

  //1. 한번에 다 그려주는 리스트
  Widget renderCount() {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        children: numbers.map((e) => renderContainer(
          color: rainbowColors[e % rainbowColors.length], index: e,),).toList()
    );
  }

  //2. 보이는 것만 그려주는 리스트
  Widget renderBuilderCrossAxisCount(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index){
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index
        );
      },
    );
  }
  //3. 최대 사이즈를 그려주는 리스트
  Widget renderMaxExtent(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, index){
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index
        );
      },
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);

    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30.0
          ),
        ),
      ),
    );
  }
}
