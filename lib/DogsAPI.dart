import 'dart:convert';

import 'package:apiwork3/model/Dogsmodel.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ASDFGH extends StatefulWidget {
  const ASDFGH({super.key});

  @override
  State<ASDFGH> createState() => _ASDFGHState();
}

class _ASDFGHState extends State<ASDFGH> {
  late Future<Dogs> _future;

  Future<Dogs> GetDogsList() async{
    var resp = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    return Dogs.fromJson(jsonDecode(resp.body));
    // List<Entries> entries = [];
    // print(data);
    //  (data as List).forEach((obj) {
    //   entries.add(Entries.fromJson(obj));
    // });
    //  return entries;


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future=GetDogsList();
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
          child: FutureBuilder(
            future:_future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                

                return  Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(snapshot.data!.message.toString()))
                  ),
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
