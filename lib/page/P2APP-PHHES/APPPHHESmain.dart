import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-01-APPPHHES.dart';

import '../../bloc/BlocEvent/02-02-TrickAPPPHHES.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTAPR/SINGLESHOTAPRwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'APPPHHESvar.dart';

class APPEARANCE_APPPHHESmain extends StatelessWidget {
  APPEARANCE_APPPHHESmain({Key? key, this.data}) : super(key: key);
  APPPHHESSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_APPPHHES_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_APPPHHES_BlocBuffer extends StatelessWidget {
  _TRICKER_APPPHHES_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  APPPHHESSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_APPPHHES_Bloc(),
        child: BlocBuilder<TRICKER_APPPHHES_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_APPPHHESbody(data: data, trick: trick);
          },
        ));
  }
}

class ROCKWELL_APPPHHESbody extends StatefulWidget {
  ROCKWELL_APPPHHESbody({Key? key, this.data, this.trick}) : super(key: key);
  APPPHHESSCHEMA? data;
  String? trick;

  @override
  State<ROCKWELL_APPPHHESbody> createState() => _ROCKWELL_APPPHHESbodyState();
}

class _ROCKWELL_APPPHHESbodyState extends State<ROCKWELL_APPPHHESbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<APPPHHES_Bloc>().add(APPPHHES_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);

    super.dispose();
    APPPHHESvar.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    APPPHHESvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    APPPHHESvar.ItemPickSELECT = '';
    context.read<TRICKER_APPPHHES_Bloc>().add(TRICKER_APPPHHESSETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 8;
    // print(widget.data?.UPDATE);

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        APPPHHESvar.PO = widget.data?.PO ?? '';
        APPPHHESvar.CP = widget.data?.CP ?? '';
        APPPHHESvar.QTY = widget.data?.QTY ?? '';
        APPPHHESvar.PROCESS = widget.data?.PROCESS ?? '';
        APPPHHESvar.CUSLOT = widget.data?.CUSLOT ?? '';
        APPPHHESvar.TPKLOT = widget.data?.TPKLOT ?? '';
        APPPHHESvar.FG = widget.data?.FG ?? '';
        APPPHHESvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        APPPHHESvar.PART = widget.data?.PART ?? '';
        APPPHHESvar.PARTNAME = widget.data?.PARTNAME ?? '';
        APPPHHESvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        APPPHHESvar.ItemPick = widget.data?.ItemPick ?? [''];
        APPPHHESvar.PCS = widget.data?.PCS ?? '';
        // APPPHHESvar.PCS = '10';
        APPPHHESvar.PCSleft = widget.data?.PCSleft ?? '';
        // APPPHHESvar.PCSleft = '10';
        APPPHHESvar.POINTs = widget.data?.POINTs ?? '';
        // APPPHHESvar.POINTs = '10';
        // if (APPPHHESvar.ItemPickSELECT != "") {
        //   //
        //   if (APPPHHESvar.POINTs == "") {
        //     //
        //     APPPHHESvar.POINTs == "0";
        //   }
        // }
        APPPHHESvar.UNIT = widget.data?.UNIT ?? '';
        // APPPHHESvar.UNIT = 'pcs/lots';
        APPPHHESvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        APPPHHESvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        APPPHHESvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        APPPHHESvar.GAP = widget.data?.GAP ?? '';
        //
        APPPHHESvar.preview = widget.data?.preview ?? [];
        APPPHHESvar.confirmdata = widget.data?.confirmdata ?? [];
        APPPHHESvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        APPPHHESvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        APPPHHESvar.PICs = widget.data?.Pic ?? '';

        if (APPPHHESvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // if (widget.trick == 'OK' &&
      //     APPPHHESvar.PCSleft != '0' &&
      //     APPPHHESvar.PCS != '' &&
      //     APPPHHESvar.PCSleft != '' &&
      //     (int.parse(APPPHHESvar.PCSleft) < int.parse(APPPHHESvar.PCS))) {
      //   widget.trick = '';
      //   context.read<TRICKER_APPPHHES_Bloc>().add(TRICKER_APPPHHESFINISH());
      // }

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<APPPHHES_Bloc>().add(APPPHHES_READ());
      });
      APPPHHESvar.DHtimer = timer;
    }
    return SINGLESHOTAPRmain(
      //------ Left
      LABEL: "APP-PHBP12",
      PO: APPPHHESvar.PO,
      CP: APPPHHESvar.CP,
      QTY: APPPHHESvar.QTY,
      PROCESS: APPPHHESvar.PROCESS,
      CUSLOT: APPPHHESvar.CUSLOT,
      TPKLOT: APPPHHESvar.TPKLOT,
      FG: APPPHHESvar.FG,
      CUSTOMER: APPPHHESvar.CUSTOMER,
      PART: APPPHHESvar.PART,
      PARTNAME: APPPHHESvar.PARTNAME,
      MATERIAL: APPPHHESvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        APPPHHESvar.ItemPickSELECT = v;

        context
            .read<TRICKER_APPPHHES_Bloc>()
            .add(TRICKER_APPPHHESgeteachITEM());
      },
      ItemPick: APPPHHESvar.ItemPick,
      PCS: APPPHHESvar.PCS,
      PCSleft: APPPHHESvar.PCSleft,
      POINTs: APPPHHESvar.POINTs,
      UNIT: APPPHHESvar.UNIT,
      INTERSEC: APPPHHESvar.INTERSEC,
      RESULTFORMAT: APPPHHESvar.RESULTFORMAT,
      Ghtype: APPPHHESvar.GRAPHTYPE,
      //------- Bottom
      GOOD: (v) {
        if (APPPHHESvar.PCS != '') {
          APPPHHESvar.APPEARANCE = 'Good';
          if (APPPHHESvar.PCS != '' &&
              APPPHHESvar.POINTs != '' &&
              APPPHHESvar.ItemPickSELECT != '') {
            if (int.parse(APPPHHESvar.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_APPPHHES_Bloc>()
                  .add(TRICKER_APPPHHESFINISH());
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      NOGOOD: (v) {
        if (APPPHHESvar.PCS != '') {
          if (APPPHHESvar.PCS != '' &&
              APPPHHESvar.POINTs != '' &&
              APPPHHESvar.ItemPickSELECT != '') {
            if (int.parse(APPPHHESvar.PCSleft) > 0) {
              APPPHHESvar.APPEARANCE = 'no Good';
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      preview: APPPHHESvar.preview,
      confirmdata: APPPHHESvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_APPPHHES_Bloc>().add(TRICKER_APPPHHESCLEAR());
      },
      BACKPAGE: (v) {
        APPPHHESvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        APPPHHESvar.ItemPickSELECT = '';
        context.read<TRICKER_APPPHHES_Bloc>().add(TRICKER_APPPHHESSETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_APPPHHES_Bloc>().add(TRICKER_APPPHHESRESETVALUE());
      },
      ITEMleftUNIT: APPPHHESvar.ITEMleftUNIT,
      ITEMleftVALUE: APPPHHESvar.ITEMleftVALUE,
      PICB64: APPPHHESvar.PICs,
    );
  }
}
