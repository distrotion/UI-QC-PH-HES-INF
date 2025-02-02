import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

import '../../page/P2APP-PHHES/APPPHHESvar.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoAPPPHHES extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_APPPHHESgeteachITEM extends TRICKER_Event {}

class TRICKER_APPPHHESconfirmdata extends TRICKER_Event {}

class TRICKER_APPPHHESCLEAR extends TRICKER_Event {}

class TRICKER_APPPHHESRESETVALUE extends TRICKER_Event {}

class TRICKER_APPPHHESSETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_APPPHHESFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_APPPHHES_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_APPPHHES_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoAPPPHHES>((event, emit) {
      return _TRICKER_GETINtoAPPPHHES('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_APPPHHESgeteachITEM>((event, emit) {
      return _TRICKER_APPPHHESgeteachITEM('', emit);
    });

    on<TRICKER_APPPHHESconfirmdata>((event, emit) {
      return _TRICKER_APPPHHESconfirmdata('', emit);
    });

    on<TRICKER_APPPHHESCLEAR>((event, emit) {
      return _TRICKER_APPPHHESCLEAR('', emit);
    });

    on<TRICKER_APPPHHESRESETVALUE>((event, emit) {
      return _TRICKER_APPPHHESRESETVALUE('', emit);
    });

    on<TRICKER_APPPHHESSETZERO>((event, emit) {
      return _TRICKER_APPPHHESSETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_APPPHHESFINISH>((event, emit) {
      return _TRICKER_APPPHHESFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoAPPPHHES(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoAPPPHHES',
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

  Future<void> _TRICKER_APPPHHESgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHHES-geteachITEM',
      data: {
        "ITEMs": APPPHHESvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHHESconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHHES-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHHESCLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHHES-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHHESRESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHHES-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHHESSETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHHES-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_APPPHHESFINISH

  Future<void> _TRICKER_APPPHHESFINISH(
      String toAdd, Emitter<String> emit) async {
    print("=============");
    final response = await Dio().post(
      server + 'FINAL/APPPHHES-FINISH-APR',
      data: {
        "APRitem": APPPHHESvar.ItemPickSELECT,
        "APRre": APPPHHESvar.APPEARANCE,
      },
    );
    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
