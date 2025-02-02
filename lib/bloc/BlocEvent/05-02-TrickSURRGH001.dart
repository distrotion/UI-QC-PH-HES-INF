import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P5HS-RGH-001/HSRGH001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHSRGH001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HSRGH001geteachITEM extends TRICKER_Event {}

class TRICKER_HSRGH001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HSRGH001confirmdata extends TRICKER_Event {}

class TRICKER_HSRGH001CLEAR extends TRICKER_Event {}

class TRICKER_HSRGH001RESETVALUE extends TRICKER_Event {}

class TRICKER_HSRGH001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HSRGH001REFER extends TRICKER_Event {}

class TRICKER_HSRGH001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HSRGH001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HSRGH001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHSRGH001>((event, emit) {
      return _TRICKER_GETINtoHSRGH001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HSRGH001geteachITEM>((event, emit) {
      return _TRICKER_HSRGH001geteachITEM('', emit);
    });

    on<TRICKER_HSRGH001geteachGRAPH>((event, emit) {
      return _TRICKER_HSRGH001geteachGRAPH('', emit);
    });

    on<TRICKER_HSRGH001confirmdata>((event, emit) {
      return _TRICKER_HSRGH001confirmdata('', emit);
    });

    on<TRICKER_HSRGH001CLEAR>((event, emit) {
      return _TRICKER_HSRGH001CLEAR('', emit);
    });

    on<TRICKER_HSRGH001RESETVALUE>((event, emit) {
      return _TRICKER_HSRGH001RESETVALUE('', emit);
    });

    on<TRICKER_HSRGH001SETZERO>((event, emit) {
      return _TRICKER_HSRGH001SETZERO('', emit);
    });

    //-------------------------------- FINISH
    on<TRICKER_HSRGH001REFER>((event, emit) {
      return _TRICKER_HSRGH001REFER('', emit);
    });

    on<TRICKER_HSRGH001FINISH>((event, emit) {
      return _TRICKER_HSRGH001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHSRGH001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoHSRGH001',
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

  Future<void> _TRICKER_HSRGH001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-geteachITEM',
      data: {
        "ITEMs": HSRGH001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HSRGH001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-geteachGRAPH',
      data: {
        "GAPname": HSRGH001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HSRGH001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSRGH001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSRGH001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSRGH001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HSRGH001FINISH

  Future<void> _TRICKER_HSRGH001REFER(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-REFLOT',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSRGH001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSRGH001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
