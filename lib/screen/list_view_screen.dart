import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ListViewScreen',
        body: renderSeperated(),
    );
  }

  // 한번에 모든 리스트를 그려준다.
  // 메모리 낭비가 심함
  Widget renderDefault() {
    return ListView(
      children: numbers.map((e) =>
          renderContainer(color: rainbowColors[e % rainbowColors.length], index: e,
          ),
      ).toList(),
    );
  }

  // 화면에 보이지는 것(아니면 다음 리스트 조금)만 보여준다.
  // 메모리가 효율적이다.
  Widget renderBuilder(){
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index){
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index);
      },
    );
  }


  // builder와 똑같은데, 중간에 다른 리스트르 보여줄 수 있다.
  Widget renderSeperated() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index){
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index);
      },
      // 광고를 넣을때 유용하다.
      separatorBuilder: (context, index){
        // 5개 일때 마다 검은색 박스 보여주기 예제
        index += 1;
        if(index % 5 == 0) {
          return renderContainer(
            color: Colors.black,
            index: index,
            height: 100,
          );
        }
        return Container();
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
