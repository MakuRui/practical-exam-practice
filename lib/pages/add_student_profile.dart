import 'package:flutter/material.dart';

class AddStudentProfile extends StatefulWidget {
  const AddStudentProfile({Key? key}) : super(key: key);

  @override
  State<AddStudentProfile> createState() => _AddStudentProfileState();
}

class _AddStudentProfileState extends State<AddStudentProfile> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController idCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();
  TextEditingController bdCon = TextEditingController();
  var genderVal = '';
  var yearVal = '';
  var courseVal = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Student Credentials',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                TextFormField(
                  controller: nameCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'ex: Mark Louie N. Bontia',
                      labelText: 'Enter your full name'
                  ),
                  validator: (nameValue) {
                    return nameValue == null
                        || nameValue.isEmpty ?
                    'Please enter correct full name' : null;
                  },
                ),
                TextFormField(
                  controller: idCon,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'ex: 2020300845',
                      labelText: 'Enter your id number'
                  ),
                  validator: (idValue) {
                    return idValue == null
                        || idValue.isEmpty ?
                    'Please enter correct id number' : null;
                  },
                ),
                TextFormField(
                  controller: ageCon,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'ex. 20',
                      labelText: 'Enter your age'
                  ),
                  validator: (ageValue) {
                    return ageValue == null
                        || ageValue.isEmpty ?
                    'Please enter correct age' : null;
                  },
                ),
                TextFormField(
                  controller: bdCon,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'ex: March 11, 2002 ; 03/11/2002',
                      labelText: 'Enter your birthdate'
                  ),
                  validator: (bdValue) {
                    return bdValue == null
                        || bdValue.isEmpty ?
                    'Please enter correct birthdate' : null;
                  },
                ),
                DropdownButtonFormField(
                  hint: const Text('Gender'),
                    items: const [
                      DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male')
                      ),
                      DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female')
                      ),
                      DropdownMenuItem(
                          value: 'Other',
                          child: Text('Other')
                      )
                    ],
                    onChanged: (genValue){
                      genderVal = genValue.toString();
                    },
                  validator: (genValue) =>
                      genValue == null ? 'Gender required' : null,
                ),
                DropdownButtonFormField(
                  hint: const Text('Year'),
                    items: const [
                      DropdownMenuItem(
                          value: '1st Year',
                          child: Text('1st Year')
                      ),
                      DropdownMenuItem(
                          value: '2nd Year',
                          child: Text('2nd Year')
                      ),
                      DropdownMenuItem(
                          value: '3rd Year',
                          child: Text('3rd Year')
                      ),
                      DropdownMenuItem(
                          value: '4th Year',
                          child: Text('4th Year')
                      ),
                    ],
                    onChanged: (yearValue){
                      yearVal = yearValue.toString();
                    },
                  validator: (yearValue) =>
                      yearValue == null ? 'Year required' : null,
                ),
                DropdownButtonFormField(
                  hint: const Text('Course'),
                    items: const [
                      DropdownMenuItem(
                          value: 'BSIT',
                          child: Text('BSIT')
                      ),
                      DropdownMenuItem(
                          value: 'CEA',
                          child: Text('BSCE')
                      ),
                      DropdownMenuItem(
                          value: 'BSME',
                          child: Text('BSME')
                      ),
                      DropdownMenuItem(
                          value: 'BSEE',
                          child: Text('BSEE')
                      ),
                    ],
                    onChanged: (courseValue) {
                      courseVal = courseValue.toString();
                    },
                  validator: (courseValue) =>
                      courseValue == null ? 'Course required' : null,
                ),
                const Divider(height: 40,),
                ElevatedButton(
                    onPressed: (){
                      if (formKey.currentState!.validate()){
                        List inputDetails = [
                          nameCon.text,
                          idCon.text,
                          ageCon.text,
                          bdCon.text,
                          genderVal,
                          yearVal,
                          courseVal,
                        ];
                        Navigator.pop(context, inputDetails);
                      }
                    }, 
                    child: const Text('Submit',
                      style: TextStyle(
                          fontSize: 20),
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}
