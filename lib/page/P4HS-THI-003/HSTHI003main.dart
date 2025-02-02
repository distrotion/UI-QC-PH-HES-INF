import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-01-HSTHI003.dart';
import '../../bloc/BlocEvent/04-02-TrickHSTHI003.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HSTHI003var.dart';

class THICKNESS_HSTHI003main extends StatelessWidget {
  THICKNESS_HSTHI003main({Key? key, this.data}) : super(key: key);
  HSTHI003SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HSTHI003_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HSTHI003_BlocBuffer extends StatelessWidget {
  _TRICKER_HSTHI003_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HSTHI003SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HSTHI003_Bloc(),
        child: BlocBuilder<TRICKER_HSTHI003_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HSTHI003body(data: data);
          },
        ));
  }
}

class ROCKWELL_HSTHI003body extends StatefulWidget {
  ROCKWELL_HSTHI003body({Key? key, this.data}) : super(key: key);
  HSTHI003SCHEMA? data;

  @override
  State<ROCKWELL_HSTHI003body> createState() => _ROCKWELL_HSTHI003bodyState();
}

class _ROCKWELL_HSTHI003bodyState extends State<ROCKWELL_HSTHI003body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HSTHI003_Bloc>().add(HSTHI003_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
    HSTHI003var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    HSTHI003var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HSTHI003var.ItemPickSELECT = '';
    context.read<TRICKER_HSTHI003_Bloc>().add(TRICKER_HSTHI003SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HSTHI003var.PO = widget.data?.PO ?? '';
        HSTHI003var.CP = widget.data?.CP ?? '';
        HSTHI003var.QTY = widget.data?.QTY ?? '';
        HSTHI003var.PROCESS = widget.data?.PROCESS ?? '';
        HSTHI003var.CUSLOT = widget.data?.CUSLOT ?? '';
        HSTHI003var.TPKLOT = widget.data?.TPKLOT ?? '';
        HSTHI003var.FG = widget.data?.FG ?? '';
        HSTHI003var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HSTHI003var.PART = widget.data?.PART ?? '';
        HSTHI003var.PARTNAME = widget.data?.PARTNAME ?? '';
        HSTHI003var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HSTHI003var.ItemPick = widget.data?.ItemPick ?? [''];
        HSTHI003var.PCS = widget.data?.PCS ?? '';
        // HSTHI003var.PCS = '10';
        HSTHI003var.PCSleft = widget.data?.PCSleft ?? '';
        // HSTHI003var.PCSleft = '10';
        HSTHI003var.POINTs = widget.data?.POINTs ?? '';
        // HSTHI003var.POINTs = '10';
        HSTHI003var.UNIT = widget.data?.UNIT ?? '';
        // HSTHI003var.UNIT = 'pcs/lots';
        HSTHI003var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HSTHI003var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HSTHI003var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HSTHI003var.GAP = widget.data?.GAP ?? '';
        HSTHI003var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HSTHI003var.preview = widget.data?.preview ?? [];
        HSTHI003var.confirmdata = widget.data?.confirmdata ?? [];
        HSTHI003var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HSTHI003var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HSTHI003var.REFLOT = widget.data?.REFLOT ?? '';

        if (HSTHI003var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HSTHI003_Bloc>().add(HSTHI003_READ());
      });
      HSTHI003var.DHtimer = timer;
      print("--");
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-THI-002",
      PO: HSTHI003var.PO,
      CP: HSTHI003var.CP,
      QTY: HSTHI003var.QTY,
      PROCESS: HSTHI003var.PROCESS,
      CUSLOT: HSTHI003var.CUSLOT,
      TPKLOT: HSTHI003var.TPKLOT,
      FG: HSTHI003var.FG,
      CUSTOMER: HSTHI003var.CUSTOMER,
      PART: HSTHI003var.PART,
      PARTNAME: HSTHI003var.PARTNAME,
      MATERIAL: HSTHI003var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HSTHI003var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HSTHI003_Bloc>()
            .add(TRICKER_HSTHI003geteachITEM());
      },
      ItemPick: HSTHI003var.ItemPick,
      PCS: HSTHI003var.PCS,
      PCSleft: HSTHI003var.PCSleft,
      POINTs: HSTHI003var.POINTs,
      UNIT: HSTHI003var.UNIT,
      INTERSEC: HSTHI003var.INTERSEC,
      RESULTFORMAT: HSTHI003var.RESULTFORMAT,
      Ghtype: HSTHI003var.GRAPHTYPE,
      GAP: HSTHI003var.GAP,
      GAPnameList: HSTHI003var.GAPnameList,
      GAPname: HSTHI003var.GAPname,
      GAPnamePick: (v) {
        HSTHI003var.GAPname = v;
        context
            .read<TRICKER_HSTHI003_Bloc>()
            .add(TRICKER_HSTHI003geteachGRAPH());
      },
      //------- Bottom
      REFLOT: HSTHI003var.REFLOT,
      REFLOTfn: (v) {
        if (HSTHI003var.REFLOT != '') {
          context.read<TRICKER_HSTHI003_Bloc>().add(TRICKER_HSTHI003REFER());
        }
      },
      ACCEPT: (v) {
        if ((HSTHI003var.RESULTFORMAT == 'Graph' &&
                HSTHI003var.GAPname != '') ||
            HSTHI003var.RESULTFORMAT != 'Graph') {
          if (HSTHI003var.PCS != '' &&
              HSTHI003var.POINTs != '' &&
              HSTHI003var.ItemPickSELECT != '') {
            if (int.parse(HSTHI003var.POINTs) >
                HSTHI003var.confirmdata.length) {
              context
                  .read<TRICKER_HSTHI003_Bloc>()
                  .add(TRICKER_HSTHI003confirmdata());
            } else {
              WORNINGpop(context, "Have completed POINTs");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        } else {
          WORNINGpop(context, "Please select GRAPH");
        }
      },
      FINISH: (v) {
        if (HSTHI003var.PCS != '' &&
            HSTHI003var.POINTs != '' &&
            HSTHI003var.ItemPickSELECT != '') {
          if (int.parse(HSTHI003var.POINTs) == HSTHI003var.confirmdata.length) {
            if (int.parse(HSTHI003var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HSTHI003_Bloc>()
                  .add(TRICKER_HSTHI003FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HSTHI003var.preview,
      confirmdata: HSTHI003var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HSTHI003_Bloc>().add(TRICKER_HSTHI003CLEAR());
      },
      BACKPAGE: (v) {
        HSTHI003var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HSTHI003var.ItemPickSELECT = '';
        context.read<TRICKER_HSTHI003_Bloc>().add(TRICKER_HSTHI003SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HSTHI003_Bloc>().add(TRICKER_HSTHI003RESETVALUE());
      },
      ITEMleftUNIT: HSTHI003var.ITEMleftUNIT,
      ITEMleftVALUE: HSTHI003var.ITEMleftVALUE,
    );
  }
}
