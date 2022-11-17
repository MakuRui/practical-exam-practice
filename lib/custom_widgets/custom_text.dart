import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final title;
  final data;
  const CustomText({Key? key, required this.title,
    required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width:  150,
            child: Text(title),
          ),
          const VerticalDivider(width: 30,),
          SizedBox(
            height: 20,
            width: 150,
            child: Text(data),
          )
        ],
      ),
    );
  }
}
