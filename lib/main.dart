import 'package:flutter/material.dart';
import 'detailAlquran.dart';
import 'package:alquranxirpl/viewModel/listSuratViewModel.dart';

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

  void listSurat(){
    ListSuratViewModel().ambilData().then((value){
      setState(() {
        dataDariJSON = value;
      });
    });
  }

  @override
  void initState(){
    super.initState();
    listSurat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Al Quran XI RPL")),
      body: dataDariJSON == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: dataDariJSON.length,
          itemBuilder: (context, i){
            return ListTile(
              title: Text(dataDariJSON[i].nama),
              subtitle: Text("${dataDariJSON[i].type} | ${dataDariJSON[i].ayat} ayat"),
              trailing: Text(dataDariJSON[i].asma),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailAlQuran(
                    nomor: dataDariJSON[i].nomor,
                    nama: dataDariJSON[i].nama
                  );
                }));
              },
            );
          }
        ),
     );
  }
}