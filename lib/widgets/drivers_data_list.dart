import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kp_admin_web/methods/common_methods.dart';

class DriversDataList extends StatefulWidget {
  const DriversDataList({super.key});

  @override
  State<DriversDataList> createState() => _DriversDataListState();
}

class _DriversDataListState extends State<DriversDataList> {
  final driversRecordsFromDatabase =
      FirebaseDatabase.instance.ref().child("drivers");


      CommonMethods cMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: driversRecordsFromDatabase.onValue,
        builder: (BuildContext context, snapshotData) {
          if (snapshotData.hasError) {
            return const Center(
              child: Text(
                "ERROR FETHING DATA TRY TO RELOAD",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            );
          }
          if (snapshotData.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          Map dataMap = snapshotData.data!.snapshot.value as Map;

          List itemList = [];

          dataMap.forEach((key, value) {
            itemList.add({"key": key, ...value});
          });

          return ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: ((context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   cMethods.data(2, itemList[index]["id"])
                ],
              );
            }),
          );
        });
  }
}
