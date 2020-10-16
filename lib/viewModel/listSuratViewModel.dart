import 'package:alquranxirpl/model/listSuratModel.dart';
import 'package:http/http.dart' as http;

class ListSuratViewModel {
  Future<List> ambilData() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull(
              "https://al-quran-8d642.firebaseio.com/data.json?print=pretty"),
          headers: {"Accept": "application/json"});
      
      if(hasil.statusCode == 200){
        print("Data List Surat Berhasil");
        final data = listSuratModelFromJson(hasil.body);
        return data;
      }else{
        print("Error Status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print('Error Cacth $e');
      return null;
    }
  }
}
