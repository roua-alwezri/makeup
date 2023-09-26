import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:makeup/models/makeup_model.dart';
import 'package:http/http.dart' as http;

class MakeupProvider with ChangeNotifier {
  List<MakeupModel> makeup = [];
  MakeupModel? currentmakeup;
  bool isLoading = true;
  bool isFailed = false;

  setLoading(bool status) {
    Timer(const Duration(milliseconds: 50), () {
      isLoading = status;
      notifyListeners();
    });
  }

  setFailed(bool status) {
    Timer(const Duration(milliseconds: 50), () {
      isFailed = status;
      notifyListeners();
    });
  }

  fetchMakeup() async {
    setLoading(true);

    final response = await http.get(Uri.parse(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      for (var x in decodedData) {
        makeup.add(MakeupModel.fromJson(x));
      }
    } else {
      setFailed(true);
    }

    setLoading(false);
  }

  Future<Response> get(
    String url,
  ) async {
    // SharedPreferences prefc = await SharedPreferences.getInstance();

    final response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    if (kDebugMode) {
      print("RESPONSE STATUSCODE : ${response.statusCode}");
      print("RESPONSE BODEY : ${response.body}");
    }

    return response;
  }
}
