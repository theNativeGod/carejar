import 'package:carejar/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

class APIs {
  final dio = Dio();
  final firestore = FirebaseFirestore.instance;
  fetchCategories() async {
    final response = await dio.get('$URL/categories');
    print('response $response');
  }

  fetchDoctors() async {
    var response = await dio.get(
      'https://private-anon-7420a4240e-practoplatform.apiary-mock.com/doctors/',
      options: Options(
        headers: {
          'X-API-KEY': 'xxxxxxxxxxx',
          'X-CLIENT-ID': 'xxxxxxxxxxx',
        },
      ),
    );
    return response.data;
  }

  setDataInCloud(id, data) async {
    await firestore.collection('categories').doc(id.toString()).set(data);
  }
}
