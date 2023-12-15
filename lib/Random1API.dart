import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'model/RandomUsermodel.dart';

class Random1API extends StatefulWidget {
  const Random1API({super.key});

  @override
  State<Random1API> createState() => _Random1APIState();
}

class _Random1APIState extends State<Random1API> {

  Future<List<RandomUser>> GetEntriesList() async{
    var resp = await http.get(Uri.parse("https://randomuser.me/api/"));
    var data = jsonDecode(resp.body)["RandomUser"];
    

    return (data as List).map((e) => RandomUser.fromJson(e)).toList();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetEntriesList();
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
          child: FutureBuilder<List<RandomUser>>(
            future:GetEntriesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RandomUser> a = snapshot.data!;
                return  ListView.builder(
                  itemCount: a.length,
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(a[index].results.toString()),
                        ),
                      ],
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
