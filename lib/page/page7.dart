import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/07-01-HSMCS001.dart';
import '../model/model.dart';

import 'P7HS-MCS-001/HSMCS001main.dart';
import 'P7HS-MCS-001/HSMCS001var.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocTableBody();
  }
}

class Page7BlocTableBody extends StatelessWidget {
  const Page7BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HSMCS001_Bloc(),
        child: BlocBuilder<HSMCS001_Bloc, HSMCS001SCHEMA>(
          builder: (context, data) {
            return Page7Body(
              data: data,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({Key? key, this.data}) : super(key: key);

  HSMCS001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return MICROSCOPE_HSMCS001main(
      data: data,
    );
  }
}
