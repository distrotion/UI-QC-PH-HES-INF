import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P3HS-EWB-008/HSEWB008main.dart';
import '../../page/P3HS-EWB-008/HSEWB008var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHSEWB008 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HSEWB008geteachITEM extends TRICKER_Event {}

class TRICKER_HSEWB008geteachGRAPH extends TRICKER_Event {}

class TRICKER_HSEWB008confirmdata extends TRICKER_Event {}

class TRICKER_HSEWB008CLEAR extends TRICKER_Event {}

class TRICKER_HSEWB008RESETVALUE extends TRICKER_Event {}

class TRICKER_HSEWB008SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HSEWB008REFER extends TRICKER_Event {}

class TRICKER_HSEWB008FINISH extends TRICKER_Event {}

class TRICKER_HSEWB008AEAR extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HSEWB008_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HSEWB008_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHSEWB008>((event, emit) {
      return _TRICKER_GETINtoHSEWB008('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HSEWB008geteachITEM>((event, emit) {
      return _TRICKER_HSEWB008geteachITEM('', emit);
    });

    on<TRICKER_HSEWB008geteachGRAPH>((event, emit) {
      return _TRICKER_HSEWB008geteachGRAPH('', emit);
    });

    on<TRICKER_HSEWB008confirmdata>((event, emit) {
      return _TRICKER_HSEWB008confirmdata('', emit);
    });

    on<TRICKER_HSEWB008CLEAR>((event, emit) {
      return _TRICKER_HSEWB008CLEAR('', emit);
    });

    on<TRICKER_HSEWB008RESETVALUE>((event, emit) {
      return _TRICKER_HSEWB008RESETVALUE('', emit);
    });

    on<TRICKER_HSEWB008SETZERO>((event, emit) {
      return _TRICKER_HSEWB008SETZERO('', emit);
    });

    on<TRICKER_HSEWB008AEAR>((event, emit) {
      return _TRICKER_HSEWB008AEAR('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HSEWB008REFER>((event, emit) {
      return _TRICKER_HSEWB008REFER('', emit);
    });

    on<TRICKER_HSEWB008FINISH>((event, emit) {
      return _TRICKER_HSEWB008FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHSEWB008(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoHSEWB008',
      data: {
        "PO": FIRSTUI.POACTIVE,
        "CP": FIRSTUI.CPACTIVE,
        "USER": USERDATA.NAME,
        "USERID": USERDATA.ID,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff.toString() == 'OK') {
        output = 'OK';
      } else {
        output = 'NOK';
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _TRICKER_HSEWB008geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-geteachITEM',
      data: {
        "ITEMs": HSEWB008var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HSEWB008geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-geteachGRAPH',
      data: {
        "GAPname": HSEWB008var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HSEWB008confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSEWB008CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSEWB008RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSEWB008SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HSEWB008FINISH

  Future<void> _TRICKER_HSEWB008REFER(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-REFLOT',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSEWB008FINISH(
      String toAdd, Emitter<String> emit) async {
    if (HSEWB008var.RESULTFORMAT == 'CAL1') {
      final response = await Dio().post(
        server + 'FINAL/HSEWB008-FINISH-CAL1',
        data: {},
      );
    } else if (HSEWB008var.RESULTFORMAT == 'CAL2') {
      final response = await Dio().post(
        server + 'FINAL/HSEWB008-FINISH-CAL2',
        data: {},
      );
    }

    emit('');
  }

  Future<void> _TRICKER_HSEWB008AEAR(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSEWB008-preview-aear',
      data: [
        {"AEAR": HSEWB008var.ARAE_ANS}
      ],
    );
    Navigator.pop(BALANCE_HSEWB008maincontext);
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
