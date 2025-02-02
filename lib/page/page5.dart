import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/05-01-SURRGH001.dart';
import '../model/model.dart';

import 'P5HS-RGH-001/HSRGH001main.dart';
import 'P5HS-RGH-001/HSRGH001var.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocTableBody();
  }
}

class Page5BlocTableBody extends StatelessWidget {
  const Page5BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HSRGH001_Bloc(),
        child: BlocBuilder<HSRGH001_Bloc, HSRGH001SCHEMA>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);

  HSRGH001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return ROUGHNESS_HSRGH001main(
      data: data,
    );
  }
}
