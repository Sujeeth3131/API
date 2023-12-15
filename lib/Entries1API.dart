import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/Entries1model.dart';

import 'package:http/http.dart' as http;


class Entries1API extends StatefulWidget {
  const Entries1API({super.key});

  @override
  State<Entries1API> createState() => _Entries1APIState();
}

class _Entries1APIState extends State<Entries1API> {
  Future<List<Entries>> GetEntriesList() async{
    var resp = await http.get(Uri.parse("https://api.publicapis.org/entries"));
    var data = jsonDecode(resp.body)["entries"];
    // List<Entries> entries = [];
    // print(data);
    //  (data as List).forEach((obj) {
    //   entries.add(Entries.fromJson(obj));
    // });
    //  return entries;


    return (data as List).map((e) => Entries.fromJson(e)).toList();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
          child: FutureBuilder<List<Entries>>(
            future:GetEntriesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Entries> entriesList = snapshot.data!;
                return  ListView.builder(
                  itemCount: entriesList.length,
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(entriesList[index].aPI.toString()),
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
    );();
  }
}
