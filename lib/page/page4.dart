import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/04-01-HSTHI003.dart';
import '../model/model.dart';

import 'P4HS-THI-003/HSTHI003main.dart';
import 'P4HS-THI-003/HSTHI003var.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4BlocTableBody();
  }
}

class Page4BlocTableBody extends StatelessWidget {
  const Page4BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HSTHI003_Bloc(),
        child: BlocBuilder<HSTHI003_Bloc, HSTHI003SCHEMA>(
          builder: (context, data) {
            return Page4Body(
              data: data,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({Key? key, this.data}) : super(key: key);

  HSTHI003SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return THICKNESS_HSTHI003main(
      data: data,
    );
  }
}
