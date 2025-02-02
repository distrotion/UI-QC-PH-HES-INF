import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-01-SURRGH001.dart';

import '../../bloc/BlocEvent/05-02-TrickSURRGH001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';

import 'HSRGH001var.dart';

class ROUGHNESS_HSRGH001main extends StatelessWidget {
  ROUGHNESS_HSRGH001main({Key? key, this.data}) : super(key: key);
  HSRGH001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HSRGH001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HSRGH001_BlocBuffer extends StatelessWidget {
  _TRICKER_HSRGH001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HSRGH001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HSRGH001_Bloc(),
        child: BlocBuilder<TRICKER_HSRGH001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HSRGH001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HSRGH001body extends StatefulWidget {
  ROCKWELL_HSRGH001body({Key? key, this.data}) : super(key: key);
  HSRGH001SCHEMA? data;

  @override
  State<ROCKWELL_HSRGH001body> createState() => _ROCKWELL_HSRGH001bodyState();
}

class _ROCKWELL_HSRGH001bodyState extends State<ROCKWELL_HSRGH001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HSRGH001_Bloc>().add(HSRGH001_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
    HSRGH001var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    HSRGH001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HSRGH001var.ItemPickSELECT = '';
    context.read<TRICKER_HSRGH001_Bloc>().add(TRICKER_HSRGH001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HSRGH001var.PO = widget.data?.PO ?? '';
        HSRGH001var.CP = widget.data?.CP ?? '';
        HSRGH001var.QTY = widget.data?.QTY ?? '';
        HSRGH001var.PROCESS = widget.data?.PROCESS ?? '';
        HSRGH001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HSRGH001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HSRGH001var.FG = widget.data?.FG ?? '';
        HSRGH001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HSRGH001var.PART = widget.data?.PART ?? '';
        HSRGH001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HSRGH001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HSRGH001var.ItemPick = widget.data?.ItemPick ?? [''];
        HSRGH001var.PCS = widget.data?.PCS ?? '';
        // HSRGH001var.PCS = '10';
        HSRGH001var.PCSleft = widget.data?.PCSleft ?? '';
        // HSRGH001var.PCSleft = '10';
        HSRGH001var.POINTs = widget.data?.POINTs ?? '';
        // HSRGH001var.POINTs = '10';
        HSRGH001var.UNIT = widget.data?.UNIT ?? '';
        // HSRGH001var.UNIT = 'pcs/lots';
        HSRGH001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HSRGH001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HSRGH001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HSRGH001var.GAP = widget.data?.GAP ?? '';
        HSRGH001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HSRGH001var.preview = widget.data?.preview ?? [];
        HSRGH001var.confirmdata = widget.data?.confirmdata ?? [];
        HSRGH001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HSRGH001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HSRGH001var.REFLOT = widget.data?.REFLOT ?? '';

        if (HSRGH001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HSRGH001_Bloc>().add(HSRGH001_READ());
      });
      HSRGH001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-RGH-001",
      PO: HSRGH001var.PO,
      CP: HSRGH001var.CP,
      QTY: HSRGH001var.QTY,
      PROCESS: HSRGH001var.PROCESS,
      CUSLOT: HSRGH001var.CUSLOT,
      TPKLOT: HSRGH001var.TPKLOT,
      FG: HSRGH001var.FG,
      CUSTOMER: HSRGH001var.CUSTOMER,
      PART: HSRGH001var.PART,
      PARTNAME: HSRGH001var.PARTNAME,
      MATERIAL: HSRGH001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HSRGH001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HSRGH001_Bloc>()
            .add(TRICKER_HSRGH001geteachITEM());
      },
      ItemPick: HSRGH001var.ItemPick,
      PCS: HSRGH001var.PCS,
      PCSleft: HSRGH001var.PCSleft,
      POINTs: HSRGH001var.POINTs,
      UNIT: HSRGH001var.UNIT,
      INTERSEC: HSRGH001var.INTERSEC,
      RESULTFORMAT: HSRGH001var.RESULTFORMAT,
      Ghtype: HSRGH001var.GRAPHTYPE,
      GAP: HSRGH001var.GAP,
      GAPnameList: HSRGH001var.GAPnameList,
      GAPname: HSRGH001var.GAPname,
      GAPnamePick: (v) {
        HSRGH001var.GAPname = v;
        context
            .read<TRICKER_HSRGH001_Bloc>()
            .add(TRICKER_HSRGH001geteachGRAPH());
      },
      //------- Bottom
      REFLOT: HSRGH001var.REFLOT,
      REFLOTfn: (v) {
        if (HSRGH001var.REFLOT != '') {
          context.read<TRICKER_HSRGH001_Bloc>().add(TRICKER_HSRGH001REFER());
        }
      },
      ACCEPT: (v) {
        if ((HSRGH001var.RESULTFORMAT == 'Graph' &&
                HSRGH001var.GAPname != '') ||
            HSRGH001var.RESULTFORMAT != 'Graph') {
          if (HSRGH001var.PCS != '' &&
              HSRGH001var.POINTs != '' &&
              HSRGH001var.ItemPickSELECT != '') {
            if (int.parse(HSRGH001var.POINTs) >
                HSRGH001var.confirmdata.length) {
              context
                  .read<TRICKER_HSRGH001_Bloc>()
                  .add(TRICKER_HSRGH001confirmdata());
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
        if (HSRGH001var.PCS != '' &&
            HSRGH001var.POINTs != '' &&
            HSRGH001var.ItemPickSELECT != '') {
          if (int.parse(HSRGH001var.POINTs) == HSRGH001var.confirmdata.length) {
            if (int.parse(HSRGH001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HSRGH001_Bloc>()
                  .add(TRICKER_HSRGH001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HSRGH001var.preview,
      confirmdata: HSRGH001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HSRGH001_Bloc>().add(TRICKER_HSRGH001CLEAR());
      },
      BACKPAGE: (v) {
        HSRGH001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HSRGH001var.ItemPickSELECT = '';
        context.read<TRICKER_HSRGH001_Bloc>().add(TRICKER_HSRGH001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HSRGH001_Bloc>().add(TRICKER_HSRGH001RESETVALUE());
      },
      ITEMleftUNIT: HSRGH001var.ITEMleftUNIT,
      ITEMleftVALUE: HSRGH001var.ITEMleftVALUE,
    );
  }
}
