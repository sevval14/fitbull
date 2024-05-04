import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Gym_owner/create_gym/model/create_gym_model.dart';
import '../../detail_gym/view/detail_gym_view.dart';
import '../viewModel/dashboard_view_model.dart';
class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}
class _DashboardViewState extends State<DashboardView> {
  final DashboardViewModel dashboardViewModel = DashboardViewModel();
  String searchQuery = '';

  List<Gym> filteredGyms = [];
  FocusNode _focusNode = FocusNode();

  @override
  void initState()  {
    super.initState();
    dashboardViewModel.fetchGym().then((gyms) {
      setState(() {
        filteredGyms = dashboardViewModel.gymList;
      });
    });
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery.toLowerCase();
      filteredGyms = dashboardViewModel.gymList
          .where((gym) =>
      gym.name.toLowerCase().contains(searchQuery) ||
          gym.location.toLowerCase().contains(searchQuery))
          .toList();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: 'Fit',
              style: GoogleFonts.jua(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
                color: const Color.fromRGBO(0, 67, 168, 1),
              ),
              children: const [
                TextSpan(
                  text: 'Bull',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300), // İkinci kısımın rengi
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: updateSearchQuery,
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0), // Çerçeve kalınlığı
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // İçerik dolgusu
              ),
              autofocus: false,
              focusNode: _focusNode,
            ),

          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredGyms.length,
              itemBuilder: (context, index) {
                final item = filteredGyms[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailGymView(id: item.id)),
                    );
                  },
                  child: buildGymCard(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGymCard(Gym gym) {
    // Kart görünümünü oluşturma metodu
    return Card(
      shadowColor: Colors.white,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.all(10.0),
      elevation: 5.0,
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Gym bilgilerinin olduğu bölüm
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left:30, right:5, top:15, bottom:2),
                        child: Text(gym.name, style: TextStyle(color: Colors.black, fontSize: 18))
                    ),
                    Container(
                      margin: EdgeInsets.only(left:30, right:5, top:5, bottom: 2),
                      child: Text(gym.location, style: TextStyle(color: Colors.black54, fontSize: 14)),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star, color: Colors.yellow), padding:  EdgeInsets.only(left:25, right: 5)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 2),
                            child: Text(
                              "4.3",
                              style: TextStyle(color: Colors.black54, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Resim kısmı
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: 70,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/home/macFit.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}