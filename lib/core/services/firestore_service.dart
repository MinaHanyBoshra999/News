import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService  {
 static FirebaseFirestore firestore = FirebaseFirestore.instance;
 static Future<void> addData(
      {required String path, required Map<String, dynamic> data,required String docuementId}) async {
    await firestore.collection(path).doc(docuementId).set(data);
  }


 static Future<Map<String, dynamic>> getData(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.data() as Map<String, dynamic>;
  }
}