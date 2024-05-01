import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('CustomScrollViewScreen'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,index) {
                  return renderContainer(color: rainbowColors[index % rainbowColors.length], index: index);
                },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }

  SliverList rencerChildSilverList(){
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
            color: rainbowColors[e % rainbowColors.length],
            index: e,
          ),
        )
            .toList(),
      ),
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
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30.0),
        ),
      ),
    );
  }
}

// 예시
/*
Column(
children: [
// ListView는 무한히 늘어날 수 있기 때문에
// Column에 값까지만 늘릴 수 있는 Expanded를 써야함
Expanded(
child: ListView(
children: rainbowColors.map((e) =>
renderContainer(
color: e,
index: 1),
).toList(),
),
),
Expanded(
child: GridView.count(
crossAxisCount: 2,
children: rainbowColors.map((e) =>
renderContainer(
color: e,
index: 1),
).toList(),
),
)
],
)*/
