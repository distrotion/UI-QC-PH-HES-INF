import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoAPPPHHES extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHSEWB008 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHSTHI003 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHSRGH001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoSURMIC001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHSMCS001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoCTCSEM001 extends TRICKERMASTER_Event {}

//

class TRICKERMASTER_GETINtoHGMCS001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHGHRC002 extends TRICKERMASTER_Event {}

class TRICKERMASTER_FLUSH extends TRICKERMASTER_Event {}

class TRICKERMASTER_Bloc extends Bloc<TRICKERMASTER_Event, String> {
  TRICKERMASTER_Bloc() : super('') {
    on<TRICKERMASTER_GETINtoAPPPHHES>((event, emit) {
      return _TRICKERMASTER_GETINtoAPPPHHES('', emit);
    });

    on<TRICKERMASTER_GETINtoHSEWB008>((event, emit) {
      return _TRICKERMASTER_GETINtoHSEWB008('', emit);
    });

    on<TRICKERMASTER_GETINtoHSTHI003>((event, emit) {
      return _TRICKERMASTER_GETINtoHSTHI003('', emit);
    });

    on<TRICKERMASTER_GETINtoHSRGH001>((event, emit) {
      return _TRICKERMASTER_GETINtoHSRGH001('', emit);
    });

    on<TRICKERMASTER_GETINtoHGHRC002>((event, emit) {
      return _TRICKERMASTER_GETINtoHGHRC002('', emit);
    });

    on<TRICKERMASTER_GETINtoHGMCS001>((event, emit) {
      return _TRICKERMASTER_GETINtoHGMCS001('', emit);
    });

    on<TRICKERMASTER_GETINtoSURMIC001>((event, emit) {
      return _TRICKERMASTER_GETINtoSURMIC001('', emit);
    });

    on<TRICKERMASTER_GETINtoHSMCS001>((event, emit) {
      return _TRICKERMASTER_GETINtoHSMCS001('', emit);
    });

    on<TRICKERMASTER_GETINtoCTCSEM001>((event, emit) {
      return _TRICKERMASTER_GETINtoCTCSEM001('', emit);
    });

    on<TRICKERMASTER_FLUSH>((event, emit) {
      return _TRICKERMASTER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKERMASTER_GETINtoAPPPHHES(
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

    print(output);
    emit(output);
  }

  Future<void> _TRICKERMASTER_GETINtoHSEWB008(
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
    //--------------------------------------------->
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

  Future<void> _TRICKERMASTER_GETINtoHSTHI003(
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

  Future<void> _TRICKERMASTER_GETINtoHSRGH001(
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

  Future<void> _TRICKERMASTER_GETINtoHGMCS001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoHGMCS001',
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

  Future<void> _TRICKERMASTER_GETINtoHGHRC002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoHGHRC002',
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

  Future<void> _TRICKERMASTER_GETINtoSURMIC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoSURMIC001',
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

  //
  Future<void> _TRICKERMASTER_GETINtoHSMCS001(
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
    emit(output);
  }

  Future<void> _TRICKERMASTER_GETINtoCTCSEM001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoCTCSEM001',
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

  Future<void> _TRICKERMASTER_GETINtoAPPGASGW(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoAPPGASGW',
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

  Future<void> _TRICKERMASTER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
