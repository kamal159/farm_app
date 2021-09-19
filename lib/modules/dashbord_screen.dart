import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app0/shared/components/components.dart';
import 'package:farm_app0/shared/cubit/cubit.dart';
import 'package:farm_app0/shared/cubit/states.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBordScreen extends StatefulWidget {
  @override
  _DashBordScreenState createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  bool check = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.getData();
          // cubit.setData();
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textFormView(
                  nameSensor: 'Temperature',
                  iconSensor: Icons.messenger_outline,
                  data: '${cubit.temperature}',
                ),
                textFormView(
                  nameSensor: 'Air Humidity',
                  iconSensor: Icons.messenger_outline,
                  data: '${cubit.airHumidity}',
                ),
                textFormView(
                  nameSensor: 'water Humidity',
                  iconSensor: Icons.messenger_outline,
                  data: '${cubit.waterHumidity}',
                ),
                textFormView(
                  nameSensor: 'Warning System',
                  iconSensor: Icons.messenger_outline,
                  data: '${cubit.warningSystem}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
