import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ListViewScreen',
        body: renderDefault(),
    );
  }

  Widget renderDefault() {
    return ListView(
      children: numbers.map((e) =>
          renderContainer(color: rainbowColors[e % rainbowColors.length], index: e,
          ),
      ).toList(),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
  }) {
    print(index);

    return Container(
      height: 300,
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
