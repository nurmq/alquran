import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detailAlquran.dart';

void main() {
  runApp(MaterialApp(
    title: 'Al Quran XI RPL',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _AlQuranState createState() => _AlQuranState();
}

class _AlQuranState extends State<MyApp> {
  List dataDariJSON;

  Future ambilData() async{
    http.Response hasil = await http.get(
      Uri.encodeFull("https://al-quran-8d642.firebaseio.com/data.json?print=pretty"),
      headers: {"Accept":"application/json"}
    );

    this.setState(() {
      dataDariJSON = json.decode(hasil.body);
    });
  }

  @override
  void initState(){
    super.initState();
    this.ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Al Quran XI RPL")),
      body: dataDariJSON == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: dataDariJSON.length,
          itemBuilder: (context, i){
            return ListTile(
              title: Text(dataDariJSON[i]['nama']),
              subtitle: Text("${dataDariJSON[i]['type']} | ${dataDariJSON[i]['ayat']} ayat"),
              trailing: Text(dataDariJSON[i]['asma']),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailAlQuran(
                    nomor: dataDariJSON[i]['nomor'],
                    nama: dataDariJSON[i]['nama']
                  );
                }));
              },
            );
          }
        ),
     );
  }
}