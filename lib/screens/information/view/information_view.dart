import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final TextEditingController _commentController = TextEditingController();

  // Dummy data listesi
  final List<Map<String, String>> posts = [
    {
      "imageUrl":
      "https://blog.sporcard.com/wp-content/uploads/2019/07/1200x700-blog.jpg",
      "description": "Bu bir Instagram tarzı post örneğidir.",
      "profileImageUrl": "https://static-prod.adweek.com/wp-content/uploads/2023/01/WhatsApp-Avatar-Profile-Photo-Hero-652x367.png",
      "gymName": "Gym A"
    },
    {
      "imageUrl":
      "https://www.darussafaka.org//uploads/articles/61794e381a3dc02ef54517a5/content-original-f6de56b6b51ddbaa01d64520c782ec25.jpg",
      "description": "Bu bir Instagram tarzı post örneğidir.",
      "profileImageUrl": "https://static-prod.adweek.com/wp-content/uploads/2023/01/WhatsApp-Avatar-Profile-Photo-Hero-652x367.png",
      "gymName": "Gym A"
    },
    // Daha fazla post ekleyebilirsiniz...
  ];

  @override
  Widget build(BuildContext context) {
    void _showCommentSheet() {
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
                        // Burada yorumu gönderme işlemini yapabilirsiniz.
                        // Örneğin, bir backend servisine istek atabilirsiniz.
                        print('Yorum gönderildi: ${_commentController.text}');
                        Navigator.pop(context); // BottomSheet'i kapat
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts',textAlign:TextAlign.center,style: TextStyle(fontSize: 25),),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  post["imageUrl"]!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    post["description"]!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(post["profileImageUrl"]!),
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment),
                        onPressed: _showCommentSheet,

                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ActivityView()));
}
