import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model.dart';

class bored extends StatefulWidget {
  const bored({super.key});

  @override
  State<bored> createState() => _boredState();
}

class _boredState extends State<bored> {
  late Future<Bored> _future;

  Future<Bored> FetchCatdetails() async{
    var resp=await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    return Bored.fromJson(jsonDecode(resp.body));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = FetchCatdetails();
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Bored>(
            future:_future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.activity.toString()),
                    Text(snapshot.data!.type.toString()),
                    Text(snapshot.data!.participants.toString()),
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
