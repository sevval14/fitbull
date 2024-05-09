import 'package:fitbull/screens/Customer/my_gym/viewModel/my_gym_view_model.dart';
import 'package:fitbull/screens/Customer/personal_settings/view/personal_settings_view.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyGymView extends StatefulWidget {

  @override
  _MyGymViewState createState() => _MyGymViewState();
}

class _MyGymViewState extends State<MyGymView> {
  DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'");
  DateFormat outputFormat = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    myGymViewModel.getOneGymEntry(loginViewModel.userId);
    super.initState();
  }

  @override
  void dispose() {
    myGymViewModel.updateEntryGym(loginViewModel.findUser.entryId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myGymViewModel.getOneGymEntry(loginViewModel.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'My',
                      style: GoogleFonts.jua(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                        color: const Color.fromRGBO(0, 67, 168, 1),
                      ),
                      children: const [
                        TextSpan(
                          text: 'Gym',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              body: loginViewModel.findUser.entryId == 0
                  ? Center(
                      child: Text(
                      "Please register gym",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 17),
                    ))
                  : Observer(
                    builder: (BuildContext context) => SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Card(
                                    color: Colors.white,
                                    shadowColor: Colors.white,
                                    elevation: 0,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            AssetImage("assets/home/teacher.png"),
                                      ),
                                      title: Text(
                                        myGymViewModel.gymEntry.gymName,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      subtitle: Text(
                                        myGymViewModel.gymEntry.gymLocation,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      trailing: Icon(Icons.star_border),
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const Text(
                                        "60% - Full", // Değer
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 40, 0, 0),
                                        child: LinearProgressIndicator(
                                          value: 0.6,
                                          backgroundColor: Colors.grey[300],
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.indigo.shade400),
                                          minHeight: 10.0, // Kalınlık ayarı
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      _buildCard("Start Weight",
                                          myGymViewModel.gymEntry.startWeight),
                                      _buildCard("Goal Weight",
                                          myGymViewModel.gymEntry.goalWeight),
                                      _buildCard("Total Days",
                                          myGymViewModel.copySelected.length.toString()),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Center(
                                    child: Container(
                                      height: 350,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white, // Konteyner rengi
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5), // Gölge rengi
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // Gölge konumu
                                          ),
                                        ],
                                      ),
                                      child: TableCalendar(
                                         firstDay: DateTime(2010, 10, 16),
                                         lastDay: DateTime(2030, 3, 14),
                                         focusedDay: DateTime.now(),
                                        headerStyle: const HeaderStyle(

                                          formatButtonVisible: false,
                                          titleCentered: true,
                                        ),
                                         calendarStyle: const CalendarStyle(

                                           selectedTextStyle:
                                               TextStyle(fontSize: 12),
                                           todayTextStyle: TextStyle(fontSize: 12),
                                         ),
                                         selectedDayPredicate: (day) {
                                           List<DateTime> convertedDates = [];

                                           for (String dateString in myGymViewModel.copySelected) {
                                             DateTime dateTime = outputFormat.parse(dateString);

                                             String formattedDate = inputFormat.format(DateTime(dateTime.year, dateTime.month, dateTime.day));

                                             DateTime formattedDateTime = inputFormat.parse(formattedDate);

                                             convertedDates.add(formattedDateTime);
                                           }

                                           return convertedDates.contains(DateTime(day.year, day.month, day.day));
                                         },
                                         onDaySelected: (selectedDay, focusedDay) {
                                           myGymViewModel.addDate =true;
                                           var  convert = DateTime.parse(selectedDay.toString()).toUtc();
                                           DateTime dateTime = inputFormat.parse(convert.toString());
                                           String formattedDate = outputFormat.format(dateTime);
                                             if (myGymViewModel.copySelected
                                                 .contains(formattedDate)) {
                                               myGymViewModel.copySelected.remove(formattedDate);

                                             } else {
                                               myGymViewModel.copySelected.add(formattedDate);

                                             }



                                         },
                                       ),
                                    ),
                                  ),
                                ])),
                      ),
                  ),
            );
          }
        });
  }

  _buildCard(String title, String goal) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 120,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  goal,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
