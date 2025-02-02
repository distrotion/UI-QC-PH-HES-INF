import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P7HS-MCS-001/HSMCS001main.dart';
import '../../page/P7HS-MCS-001/HSMCS001var.dart';
import '07-01-HSMCS001.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHSMCS001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HSMCS001geteachITEM extends TRICKER_Event {}

class TRICKER_HSMCS001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HSMCS001confirmdata extends TRICKER_Event {}

class TRICKER_HSMCS001CLEAR extends TRICKER_Event {}

class TRICKER_HSMCS001RESETVALUE extends TRICKER_Event {}

class TRICKER_HSMCS001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HSMCS001REFER extends TRICKER_Event {}

class TRICKER_HSMCS001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HSMCS001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HSMCS001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHSMCS001>((event, emit) {
      return _TRICKER_GETINtoHSMCS001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HSMCS001geteachITEM>((event, emit) {
      return _TRICKER_HSMCS001geteachITEM('', emit);
    });

    on<TRICKER_HSMCS001confirmdata>((event, emit) {
      return _TRICKER_HSMCS001confirmdata('', emit);
    });

    on<TRICKER_HSMCS001CLEAR>((event, emit) {
      return _TRICKER_HSMCS001CLEAR('', emit);
    });

    on<TRICKER_HSMCS001RESETVALUE>((event, emit) {
      return _TRICKER_HSMCS001RESETVALUE('', emit);
    });

    on<TRICKER_HSMCS001SETZERO>((event, emit) {
      return _TRICKER_HSMCS001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HSMCS001REFER>((event, emit) {
      return _TRICKER_HSMCS001REFER('', emit);
    });

    on<TRICKER_HSMCS001FINISH>((event, emit) {
      return _TRICKER_HSMCS001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHSMCS001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoHSMCS001',
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
    MICROSCOPEHSMCS001_CONTEXT.read<HSMCS001_Bloc>().add(HSMCS001_READ());
    emit(output);
  }

  Future<void> _TRICKER_HSMCS001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSMCS001-geteachITEM',
      data: {
        "ITEMs": HSMCS001var.ItemPickSELECT,
      },
    );
    MICROSCOPEHSMCS001_CONTEXT.read<HSMCS001_Bloc>().add(HSMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_HSMCS001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSMCS001-confirmdata',
      data: {},
    );
    MICROSCOPEHSMCS001_CONTEXT.read<HSMCS001_Bloc>().add(HSMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_HSMCS001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSMCS001-CLEAR',
      data: {},
    );
    MICROSCOPEHSMCS001_CONTEXT.read<HSMCS001_Bloc>().add(HSMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_HSMCS001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSMCS001-RESETVALUE',
      data: {},
    );
    MICROSCOPEHSMCS001_CONTEXT.read<HSMCS001_Bloc>().add(HSMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_HSMCS001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSMCS001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HSMCS001FINISH

  Future<void> _TRICKER_HSMCS001REFER(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSMCS001-REFLOT',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HSMCS001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/HSMCS001-FINISH-IMG',
      data: {
        "IMG01": HSMCS001var.base64pic01,
        "IMG02": HSMCS001var.base64pic02,
        "IMG03": HSMCS001var.base64pic03,
        "IMG04": HSMCS001var.base64pic04,
        "IMG01data": HSMCS001var.base64pic01data,
        "IMG02data": HSMCS001var.base64pic02data,
        "IMG03data": HSMCS001var.base64pic03data,
        "IMG04data": HSMCS001var.base64pic04data,
      },
    );
    if (response.statusCode == 200) {
      MICROSCOPEHSMCS001_CONTEXT.read<HSMCS001_Bloc>().add(HSMCS001_READ());
    }

    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    MICROSCOPEHSMCS001_CONTEXT.read<HSMCS001_Bloc>().add(HSMCS001_READ());
    emit('');
  }
}
