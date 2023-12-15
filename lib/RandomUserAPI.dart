import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'model/RandomUsermodel.dart';

class RandomUserAPI extends StatefulWidget {
  const RandomUserAPI({super.key});

  @override
  State<RandomUserAPI> createState() => _RandomUserAPIState();
}

class _RandomUserAPIState extends State<RandomUserAPI> {
  Future<List<Results>> GetEntriesList() async{
    var resp = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    var data = jsonDecode(resp.body)["random"];
    // List<Entries> entries = [];
    // print(data);
    //  (data as List).forEach((obj) {
    //   entries.add(Entries.fromJson(obj));
    // });
    //  return entries;


    return (data as List).map((e) => Results.fromJson(e)).toList();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetEntriesList();
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
          child: FutureBuilder<List<Results>>(
            future:GetEntriesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Results> a = snapshot.data!;
                return  ListView.builder(
                  itemCount: a.length,
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(a[index].login.toString()),
                    );
                  },
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
    );;
  }
}
