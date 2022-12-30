import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rest_api/model/posts_model.dart';

import '../client/client.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Welcome>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  var responce =
                      await MyClient().get('/posts').catchError((err) {});
                  if (responce == null) return;
                  data = welcomeFromJson(responce);
                  setState(() {});
                },
                child: const Text('Get'),
              ),
              if (data != null)
                ...data!
                    .map((e) => ListTile(
                          title: Text(e.title),
                          subtitle: Text(e.body),
                        ))
                    .toList(),
              ElevatedButton(
                onPressed: () async {
                  var responce =
                      await MyClient().get('/posts').catchError((err) {});
                  if (responce == null) return;
                  data = welcomeFromJson(responce);
                  setState(() {});
                },
                child: const Text('Get'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
