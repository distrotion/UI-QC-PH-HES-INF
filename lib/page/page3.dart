import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/03-01-HSEWB008.dart';
import '../model/model.dart';

import 'P3HS-EWB-008/HSEWB008main.dart';
import 'P3HS-EWB-008/HSEWB008var.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocTableBody();
  }
}

class Page3BlocTableBody extends StatelessWidget {
  const Page3BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HSEWB008_Bloc(),
        child: BlocBuilder<HSEWB008_Bloc, HSEWB008SCHEMA>(
          builder: (context, data) {
            return Page3Body(
              data: data,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({Key? key, this.data}) : super(key: key);

  HSEWB008SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BALANCE_HSEWB008main(
      data: data,
    );
  }
}
