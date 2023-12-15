import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/User.dart';

class UserAPI extends StatefulWidget {
  const UserAPI({super.key});

  @override
  State<UserAPI> createState() => _UserAPIState();
}

class _UserAPIState extends State<UserAPI> {
  Future<User> FetchCatDetails() async{
    var resp = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    return User.fromJson(jsonDecode(resp.body));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FetchCatDetails();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<User>(
            future: FetchCatDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.userId.toString()),
                    Text(snapshot.data!.id.toString()),
                    Text(snapshot.data!.title.toString()),
                    Text(snapshot.data!.completed.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
