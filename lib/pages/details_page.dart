import 'package:flutter/material.dart';
import 'package:student_attendance/custom_widgets/custom_text.dart';
import 'package:student_attendance/models/details_model.dart';

class DetailsPage extends StatelessWidget {
  final DetailsModel detailsModel;
  DetailsPage({Key? key, required this.detailsModel}) : super(key: key);

  final List title = ['Name', 'ID', 'Age', 'Birthday',
    'Gender', 'Year', 'Course'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Profile',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          CustomText(title: title[0], data: detailsModel.name.toString()),
          CustomText(title: title[1], data: detailsModel.id.toString()),
          CustomText(title: title[2], data: detailsModel.age.toString()),
          CustomText(title: title[3], data: detailsModel.birthday.toString()),
          CustomText(title: title[4], data: detailsModel.gender.toString()),
          CustomText(title: title[5], data: detailsModel.year.toString()),
          CustomText(title: title[6], data: detailsModel.course.toString()),
        ],
      )
    );
  }
}
