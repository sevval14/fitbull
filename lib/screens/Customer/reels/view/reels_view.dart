import 'package:fitbull/screens/Customer/reels/viewModel/reels_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({Key? key}) : super(key: key);

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  final TextEditingController _commentController = TextEditingController();
  final ReelsViewModel reelsViewModel = ReelsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: reelsViewModel.fetchActivity(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: reelsViewModel.activityList.length,
              itemBuilder: (context, index) {
                final post = reelsViewModel.activityList[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        "assets/home/competition2.png",
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          post.name,
                          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          post.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1597466765990-64ad1c35dafc"),
                              child: ClipOval(
                                child: Image.asset("assets/home/teacher.png",
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.comment),
                              onPressed: () => _showCommentSheet(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Yorumunuz',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      print('Yorum gönderildi: ${_commentController.text}');
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(home: ReelsView()));
}