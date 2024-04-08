import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              _buildProfileHeader(context),
              _buildHighlightSection(context),
              _selectedIndex == 0
                  ? _buildPostSection()
                  : _selectedIndex == 1
                  ? _buildEducatorSection()
                  : _buildUserSection(),
            ],
          ),
        )
    );
  }
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.grey,
            // Normally you would use a NetworkImage here
            backgroundImage: AssetImage('assets/home/macFit.png'),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Activity', style: TextStyle(fontSize: 18)),
                  Text('9', style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text('Educators', style: TextStyle(fontSize: 18)),
                  Text('13', style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Text('Capacity', style: TextStyle(fontSize: 18)),
                  Text('126', style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,),



        ],
      ),
    );
  }

  Widget _buildHighlightSection(BuildContext context) {
    return Container(
      height: 70,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Düğmeler arasında eşit mesafe sağlar
          children: <Widget>[
            _buildIconButton(Icons.fitness_center, 'Activities', 0),
            _buildIconButton(Icons.school, 'Educator', 1),
            _buildIconButton(Icons.person, 'User', 2),
          ],
        )


        // Rest of your page content goes here
      ]),
    );
  }

  Widget _buildIconButton(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          icon: Icon(
            icon,
            color: _selectedIndex == index ? Colors.blue : Colors.black54,
          ),
        ),
        Container(
          height: 2,
          width: 30,
          color: _selectedIndex == index ? Colors.blue : Colors.transparent,
        ),
        Text(
          label, // Burada metin etiketini kullanıyoruz.
          style: TextStyle(
            color: _selectedIndex == index ? Colors.blue : Colors.black54,
          ),
        )
      ],
    );
  }

  Widget _buildPostSection() {
    return Expanded(
      child: GridView.builder(
        itemCount: 20, // Placeholder for the number of posts
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Image.network(
            "assets/home/macFit.png",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildEducatorSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/home/özgür.png'),
            ),
            title: Text('John Doe'),
            subtitle: Text('Customer'),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                // Telefon simgesine tıklandığında yapılacak işlem
                // Örneğin, eğitmenin telefon numarasını arayabilirsiniz
                // Bu örnekte yalnızca bir print fonksiyonu yer almakta
                print('Telefon simgesine tıklandı, index: $index');
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }


}