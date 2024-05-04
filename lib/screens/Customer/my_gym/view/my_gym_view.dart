import 'package:fitbull/screens/Customer/personal_settings/view/personal_settings_view.dart';
import 'package:fitbull/screens/Customer/personal_settings/view_model/personal_settings_view_model.dart';
import 'package:fitbull/screens/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class MyGymView extends StatefulWidget {
  @override
  _MyGymViewState createState() => _MyGymViewState();
}

class _MyGymViewState extends State<MyGymView> {
  final PersonalSettingsViewModel personalSettings = PersonalSettingsViewModel();
  @override
  Widget build(BuildContext context) {
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
      body: loginViewModel.findUser.entryId == 0 ?Center(child: Text("Please register gym",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17),)):SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Card(
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/home/teacher.png"),
                      ),
                      title: Text('Academy Fit', style: TextStyle(fontSize: 17),),
                      subtitle: Text('Kotekli Mah. Sitki Kocman Cad', style: TextStyle(fontSize: 15),),
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
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: LinearProgressIndicator(
                          value: 0.6,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.indigo.shade400),
                          minHeight: 10.0, // Kalınlık ayarı
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCard("Start Weight", "120"),
                      _buildCard("Goal Weight", "100"),
                      _buildCard("Total Days", personalSettings.selectedDays.length.toString()),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      headerVisible: true,
                      calendarStyle: CalendarStyle(
                        selectedTextStyle: TextStyle(fontSize: 12),
                        todayTextStyle: TextStyle(fontSize: 12),

                      ),
                      selectedDayPredicate: (day) {
                        print(personalSettings..runtimeType);
                        return personalSettings.selectedDays.contains(day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          if (personalSettings.selectedDays.contains(selectedDay)) {
                            personalSettings.selectedDays.remove(selectedDay);
                          } else {
                            personalSettings.selectedDays.add(selectedDay);
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16),

                ]
            )
        ),
      ),
    );
  }
  _buildCard(String title,String goal){
    return Container(
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
            SizedBox(height: 10,),
            Text(
              goal,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );

  }
}