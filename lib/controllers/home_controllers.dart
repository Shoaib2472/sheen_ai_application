import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sheen_ai_application/models/categories_model.dart';
import 'package:sheen_ai_application/utils/fetch.dart';

class HomeController extends GetxController {
  final Fetch fetch = Fetch(); //instance of Fetch
  final searchQuery = TextEditingController().obs;
  late Map<String, dynamic> decodedTokenPayload;
  var categoriesModel = CategoriesModel();
  RxList<Record> recordList = RxList();
  RxString currFilter = 'Prices Low to High'.obs;
  RxBool isChecked = false.obs;
  List<String> list = <String>[
    'Prices Low To High',
    'Prices High To Low',
    'Gld Wt. Low To High',
    'Gld Wt. High To Low',
  ];
  RxInt selectedCount = 0.obs;
  final path = '/data-engine/products/paginate/';
  final token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY1Mzc5NDllNTZhMmQyMDAwYjBhNDJmNCIsInN0YXR1cyI6dHJ1ZSwibXVzdFNpZ25vdXQiOmZhbHNlLCJpc0xvZ2luIjp0cnVlLCJjaGFuZ2VQYXNzd29yZEZsYWciOmZhbHNlLCJyb2xlIjoiQWRtaW4iLCJmaXJzdE5hbWUiOiJWaXR0YWwiLCJsYXN0TmFtZSI6IldoaXRlZmlyZSBBZG1pbiIsInBob25lIjoiNzk5OSIsImNsaWVudCI6eyJfaWQiOiI2NTM3OTQzNjU2YTJkMjAwMGIwYTQyZDgiLCJwcmVtaXVtQ2xpZW50Ijp7InVubGltaXRlZEJ1Y2tldFN0b3JhZ2UiOmZhbHNlLCJkaXZpc2lvbkNvbnRyb2wiOmZhbHNlfSwiY29kZSI6IjMzNmM3ZmE4LTQzZTctNDk2YS04ZWU4LTk2YWI5OTg5MjY3OCIsIm5hbWUiOiJXaGl0ZWZpcmUiLCJzdWJEb21haW4iOiJ3aGl0ZWZpcmUiLCJidXNpbmVzc1R5cGUiOiJDYXRhbG9naXN0IiwiYXBwTW9kdWxlcyI6W3siX2lkIjoiNjM2Mzk2NDhkMTRjOGI0ZjEwY2MyZjUyIiwia2V5IjoiZS1jcmVhdGl2ZXMifSx7Il9pZCI6IjY0MWViNjllMTFmYWExNjdjYzgwYTQ4NiIsImtleSI6ImRhdGEtZW5naW5lIn0seyJfaWQiOiI2NDYxZjcyMTY3NGUyYjc0YjgzYjg4NDUiLCJrZXkiOiJzaGVlbi1vcCJ9LHsiX2lkIjoiNjM5ODVkZTIwYTU1NTMwMDBhMThiODFlIiwia2V5IjoidmVuZG9yLXBvcnRhbCJ9LHsiX2lkIjoiNjNmMWY0MzEwODAxODMwMDBiMWUxZTU3Iiwia2V5IjoiY2hpdHRoaSJ9XX19LCJpYXQiOjE2OTg5OTMxMzUsImV4cCI6MzYwMDAwMDAwMDAxNjk5MDAwMDAwfQ.yUyrr1FXzChHICV5BmAGJYXyP7Obz9jWEikfzeYklJo";
  @override
  void onInit() {
    //print(Get.height);
    decodedTokenPayload = JwtDecoder.decode(token);
    print(decodedTokenPayload);
    // TODO: implement onInit
    super.onInit();
  }

  reorderPriceAsc() {
    recordList.sort((a, b) => a.jewelPrice!.compareTo(b.jewelPrice!));
    recordList.forEach((record) {
      print('name - ${record.jewelPrice}');
    });
  }

  reorderPriceDes() {
    recordList.sort((a, b) => b.jewelPrice!.compareTo(a.jewelPrice!));
    recordList.forEach((record) {
      print('name - ${record.jewelPrice}');
    });
  }

  reorderGoldWeightAsc() {
    recordList.sort((a, b) => a.grossWeight!.compareTo(b.grossWeight!));
    recordList.forEach((record) {
      print('name - ${record.grossWeight}');
    });
  }

  reorderGoldWeightDes() {
    recordList.sort((a, b) => b.grossWeight!.compareTo(a.grossWeight!));
    recordList.forEach((record) {
      print('name - ${record.grossWeight}');
    });
  }

  fetchData() async {
    final String? response = await fetch.post(
        path: path,
        queryParameters: {"priceAfterDiscount": "true"},
        token: token,
        data: decodedTokenPayload);
    print(response);
    if (response == null) {
      return;
    }

    if (jsonDecode(response)['data'] != null) {
      print(' not null');
      var responseData = jsonDecode(response)['data'];

      // Extract records from the response and store them in recordList
      if (responseData['records'] != null) {
        List<dynamic> recordsData = responseData['records'];
        recordList.value = List<Record>.from(recordsData.map((recordJson) {
          return Record.fromJson(recordJson);
        }));
        print(recordList.length);
        // categoriesModel = CategoriesModel.fromJson(jsonDecode(response));
        // print('fgf');
        // print(categoriesModel.data!.records![0].code);
        // recordModel = Record.fromJson(jsonDecode(response)['data']['records']);
        // print(recordModel.grossWeight);
      }
    }
  }
  //Sorting Data For API Calling
  // sortData({required String sortMethod}) async {
  //   final String? response = await fetch.post(
  //       path: path,
  //       queryParameters: ({"sort": "$sortMethod"}),
  //       token: token,
  //       data: decodedTokenPayload);
  //   print(response);
  //   if (response == null) {
  //     return;
  //   }

  //   if (jsonDecode(response)['data'] != null) {
  //     print(' not null');
  //     var responseData = jsonDecode(response)['data'];

  //     // Extract records from the response and store them in recordList
  //     if (responseData['records'] != null) {
  //       List<dynamic> recordsData = responseData['records'];
  //       recordList.value = [];
  //       recordList.value = List<Record>.from(recordsData.map((recordJson) {
  //         return Record.fromJson(recordJson);
  //       }));
  //       print(recordList.length);
  //       // categoriesModel = CategoriesModel.fromJson(jsonDecode(response));
  //       // print('fgf');
  //       // print(categoriesModel.data!.records![0].code);
  //       // recordModel = Record.fromJson(jsonDecode(response)['data']['records']);
  //       // print(recordModel.grossWeight);
  //     }
  //   }
  // }
}
