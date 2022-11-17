import 'package:flutter/material.dart';
import 'package:student_attendance/models/details_model.dart';
import 'package:student_attendance/pages/add_student_profile.dart';
import 'package:student_attendance/pages/details_page.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late List detailsReceiver;
  //Storage
  late List name;
  late List id;
  late List age;
  late List birthday;
  late List gender;
  late List year;
  late List course;
  //Passing the DataReceived to all the storage
  late List passingData;
  //For the itemCount
  int count = 0;
  //Passing all the data to the Details Model
  late List detailsModel;

  @override
  void initState() {
    count = 0;
    detailsReceiver = [];
    name = [];
    id = [];
    age = [];
    birthday = [];
    gender = [];
    year = [];
    course = [];
    passingData = [];
    detailsModel = List.generate(count, (index)
    => DetailsModel(
        name[index],
        birthday[index],
        gender[index],
        year[index],
        course[index],
        id[index],
        age[index]
    )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: ListView.builder(
              itemCount: detailsModel.length,
                itemBuilder: (context, index) {
                return Card(
                  elevation: 15.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      child: ListTile(
                        leading: const Icon(Icons.account_circle),
                        contentPadding: const EdgeInsets.only(
                          left: 20, right: 20),
                        title: Text(name[index]),
                        subtitle: Text('${course[index]} - ${year[index]}'),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    detailsModel: detailsModel[index],)));
                        },
                      ),
                  ),
                );
              }
            )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
          onPressed: () async {
          detailsReceiver = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddStudentProfile()));
          setState(() {
            ++count;
            passingData = detailsReceiver;
            name.add(passingData[0]);
            id.add(passingData[1]);
            age.add(passingData[2]);
            birthday.add(passingData[3]);
            gender.add(passingData[4]);
            year.add(passingData[5]);
            course.add(passingData[6]);
            //List generator for all the storage
            detailsModel = List.generate(count, (index)
            => DetailsModel(
                name[index],
                birthday[index],
                gender[index],
                year[index],
                course[index],
                id[index],
                age[index]
            )
            );
          });
          }),
    );
  }
}

