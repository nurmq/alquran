import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailAlQuran extends StatefulWidget {
  final String nomor;
  final String nama;
  
  DetailAlQuran({this.nomor,this.nama});
  @override
  _DetailAlQuranState createState() => _DetailAlQuranState();
}

class _DetailAlQuranState extends State<DetailAlQuran> {
  List detailAlQuranJSON;

  Future dataDetailAlQuran() async{
    http.Response hasilDetail = await http.get(
      Uri.encodeFull("https://al-quran-8d642.firebaseio.com/surat/${widget.nomor}.json?print=pretty"),
      headers:{"Accept":"application/json"}
    );

    this.setState(() {
      detailAlQuranJSON = json.decode(hasilDetail.body);
    });
  }

  @override
  void initState(){
    super.initState();
    this.dataDetailAlQuran();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.nama)),
      body: detailAlQuranJSON == null ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: detailAlQuranJSON.length,
        itemBuilder: (context, i){
          return ListTile(
            title: Container(
              padding: EdgeInsets.only(top:30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(detailAlQuranJSON[i]['ar']),
                  Text(detailAlQuranJSON[i]['id']),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}