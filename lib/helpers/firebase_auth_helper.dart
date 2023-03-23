import 'package:cloud_firestore/cloud_firestore.dart';

class  FirestoreDBHelper {
  FirestoreDBHelper._();
  static final FirestoreDBHelper firestoreDBHelper = FirestoreDBHelper._();

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> insert({required Map<String,dynamic> data}) async {
    //feach student_counter val
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await db.collection("counter").doc("note_counter").get();


    int  count = documentSnapshot.data()!['count'];
    int  id = documentSnapshot.data()!['id'];

    //increment student_counter val
    await db.collection("notes").doc("${++id}").set(data);

    //update student_counter val
    // await db.collection("counter").doc("student_counter").set({"count": count});
    await db.collection("counter").doc("note_counter").update({"id": id});
    await db.collection("counter").doc("note_counter").update({"count": ++count});


    // Map<String,dynamic> data ={
    //   "name" : "Kesha",
    //   "age" : 20,
    //   "course" : "Flutter",
    // };
    //
    // await  db.collection("students").doc("1").set(data);

    // await db.collection("student").add(data);
  }




  //TODO: fetchAllRecords()


  Future<void> delete({required String id}) async {
    await db.collection("notes").doc(id).delete();

    // fetch student_counter val
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await db.collection("counter").doc("note_counter").get();

    int count = documentSnapshot.data()!['count'];

    await db.collection("counter").doc("note_counter").update({"count": --count});
  }


  Future<void> update({required String id,required Map<String,dynamic> data}) async {
    await db.collection("notes").doc("id").update(data);
  }
}