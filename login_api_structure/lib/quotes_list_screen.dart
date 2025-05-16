import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/QuotesController.dart';

class QuotesListScreen extends StatelessWidget {
  final QuotesController controller = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quote")),
      body: Column(
        children: [
          // Display quote info (Title, Body)
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            final quote = controller.quote.value;

            if (quote == null) {
              return Center(child: Text("No quote available."));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title: ${quote.title}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Body: ${quote.body}", style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }),

          // Display list of posts
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  final post = controller.posts[index];
                  return ListTile(
                    title: Text(post.title.toString()),
                    subtitle: Text(post.body.toString()),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
