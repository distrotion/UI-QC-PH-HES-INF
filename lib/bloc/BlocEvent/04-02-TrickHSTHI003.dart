import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P4HS-THI-003/HSTHI003var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHSTHI003 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HSTHI003geteachITEM extends TRICKER_Event {}

class TRICKER_HSTHI003geteachGRAPH extends TRICKER_Event {}

class TRICKER_HSTHI003confirmdata extends TRICKER_Event {}

class TRICKER_HSTHI003CLEAR extends TRICKER_Event {}

class TRICKER_HSTHI003RESETVALUE extends TRICKER_Event {}

class TRICKER_HSTHI003SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HSTHI003REFER extends TRICKER_Event {}

class TRICKER_HSTHI003FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HSTHI003_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HSTHI003_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHSTHI003>((event, emit) {
      return _TRICKER_GETINtoHSTHI003('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HSTHI003geteachITEM>((event, emit) {
      return _TRICKER_HSTHI003geteachITEM('', emit);
    });

    on<TRICKER_HSTHI003geteachGRAPH>((event, emit) {
      return _TRICKER_HSTHI003geteachGRAPH('', emit);
    });

    on<TRICKER_HSTHI003confirmdata>((event, emit) {
      return _TRICKER_HSTHI003confirmdata('', emit);
    });

    on<TRICKER_HSTHI003CLEAR>((event, emit) {
      return _TRICKER_HSTHI003CLEAR('', emit);
    });

    on<TRICKER_HSTHI003RESETVALUE>((event, emit) {
      return _TRICKER_HSTHI003RESETVALUE('', emit);
    });

    on<TRICKER_HSTHI003SETZERO>((event, emit) {
      return _TRICKER_HSTHI003SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HSTHI003REFER>((event, emit) {
      return _TRICKER_HSTHI003REFER('', emit);
    });

    on<TRICKER_HSTHI003FINISH>((event, emit) {
      return _TRICKER_HSTHI003FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHSTHI003(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoHSTHI003',
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

  Future<void> _TRICKER_HSTHI003geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-geteachITEM',
      data: {
        "ITEMs": HSTHI003var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HSTHI003geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-geteachGRAPH',
      data: {
        "GAPname": HSTHI003var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HSTHI003confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSTHI003CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSTHI003RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSTHI003SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HSTHI003FINISH

  Future<void> _TRICKER_HSTHI003REFER(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-REFLOT',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSTHI003FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSTHI003-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
