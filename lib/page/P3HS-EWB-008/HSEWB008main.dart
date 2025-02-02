import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:function_tree/function_tree.dart';

import '../../bloc/BlocEvent/03-01-HSEWB008.dart';
import '../../bloc/BlocEvent/03-02-TrickHSEWB008.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTCW/SINGLESHOTCWwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HSEWB008var.dart';

late BuildContext BALANCE_HSEWB008maincontext;

class BALANCE_HSEWB008main extends StatelessWidget {
  BALANCE_HSEWB008main({Key? key, this.data}) : super(key: key);
  HSEWB008SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HSEWB008_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HSEWB008_BlocBuffer extends StatelessWidget {
  _TRICKER_HSEWB008_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HSEWB008SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HSEWB008_Bloc(),
        child: BlocBuilder<TRICKER_HSEWB008_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HSEWB008body(data: data);
          },
        ));
  }
}

class ROCKWELL_HSEWB008body extends StatefulWidget {
  ROCKWELL_HSEWB008body({Key? key, this.data}) : super(key: key);
  HSEWB008SCHEMA? data;

  @override
  State<ROCKWELL_HSEWB008body> createState() => _ROCKWELL_HSEWB008bodyState();
}

class _ROCKWELL_HSEWB008bodyState extends State<ROCKWELL_HSEWB008body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    // HSEWB008var.ANS = '';
    context.read<HSEWB008_Bloc>().add(HSEWB008_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);

    super.dispose();
    HSEWB008var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    HSEWB008var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HSEWB008var.ItemPickSELECT = '';
    context.read<TRICKER_HSEWB008_Bloc>().add(TRICKER_HSEWB008SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    BALANCE_HSEWB008maincontext = context;
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HSEWB008var.PO = widget.data?.PO ?? '';
        HSEWB008var.CP = widget.data?.CP ?? '';
        HSEWB008var.QTY = widget.data?.QTY ?? '';
        HSEWB008var.PROCESS = widget.data?.PROCESS ?? '';
        HSEWB008var.CUSLOT = widget.data?.CUSLOT ?? '';
        HSEWB008var.TPKLOT = widget.data?.TPKLOT ?? '';
        HSEWB008var.FG = widget.data?.FG ?? '';
        HSEWB008var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HSEWB008var.PART = widget.data?.PART ?? '';
        HSEWB008var.PARTNAME = widget.data?.PARTNAME ?? '';
        HSEWB008var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HSEWB008var.ItemPick = widget.data?.ItemPick ?? [''];
        HSEWB008var.PCS = widget.data?.PCS ?? '';
        // HSEWB008var.PCS = '10';
        HSEWB008var.PCSleft = widget.data?.PCSleft ?? '';
        // HSEWB008var.PCSleft = '10';
        HSEWB008var.POINTs = widget.data?.POINTs ?? '';
        // HSEWB008var.POINTs = '10';
        HSEWB008var.UNIT = widget.data?.UNIT ?? '';
        // HSEWB008var.UNIT = 'pcs/lots';
        HSEWB008var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HSEWB008var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HSEWB008var.Area = widget.data?.Area ?? '';
        HSEWB008var.GAP = widget.data?.GAP ?? '';
        HSEWB008var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HSEWB008var.preview = widget.data?.preview ?? [];
        HSEWB008var.confirmdata = widget.data?.confirmdata ?? [];
        HSEWB008var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HSEWB008var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HSEWB008var.VAL1 = widget.data?.VAL1 ?? '';
        HSEWB008var.VAL2 = widget.data?.VAL2 ?? '';
        HSEWB008var.VAL3 = widget.data?.VAL3 ?? '';
        HSEWB008var.VAL4 = widget.data?.VAL4 ?? '';
        HSEWB008var.AearI = widget.data?.AearI ?? '';
        HSEWB008var.FORMULAI = widget.data?.FORMULAI ?? '';

        HSEWB008var.ANS = widget.data?.ANS ?? '';

        HSEWB008var.shape = widget.data?.shape ?? '';

        // print(">>>>${HSEWB008var.FORMULA}");

        HSEWB008var.FORMULA = widget.data?.FORMULA ?? '';

        HSEWB008var.REFLOT = widget.data?.REFLOT ?? '';

        if (HSEWB008var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HSEWB008_Bloc>().add(HSEWB008_READ());
      });
      HSEWB008var.DHtimer = timer;
    }

    // if (HSEWB008var.ANS == '') {
    //   if (HSEWB008var.PCS != '' &&
    //       HSEWB008var.POINTs != '' &&
    //       HSEWB008var.ItemPickSELECT != '') {
    //     if (HSEWB008var.FORMULAI != '' &&
    //         HSEWB008var.VAL1 != '' &&
    //         HSEWB008var.VAL2 != '' &&
    //         HSEWB008var.AearI != '') {
    //       HSEWB008var.PREANS = HSEWB008var.FORMULAI
    //           .replaceAll("X", HSEWB008var.VAL1)
    //           .replaceAll("Y", HSEWB008var.VAL2)
    //           .replaceAll("K1", HSEWB008var.AearI);
    //       // print(HSEWB008var.PREANS.interpret().toString());
    //       setState(() {
    //         HSEWB008var.ANS =
    //             HSEWB008var.PREANS.interpret().toStringAsFixed(4);
    //       });
    //     }
    //   }
    // }
    return SINGLESHOTCWmain(
      //------ Left
      LABEL: "SER-BAL-002",
      PO: HSEWB008var.PO,
      CP: HSEWB008var.CP,
      QTY: HSEWB008var.QTY,
      PROCESS: HSEWB008var.PROCESS,
      CUSLOT: HSEWB008var.CUSLOT,
      TPKLOT: HSEWB008var.TPKLOT,
      FG: HSEWB008var.FG,
      CUSTOMER: HSEWB008var.CUSTOMER,
      PART: HSEWB008var.PART,
      PARTNAME: HSEWB008var.PARTNAME,
      MATERIAL: HSEWB008var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HSEWB008var.ItemPickSELECT = v;
        HSEWB008var.ANS = '';
        //
        context
            .read<TRICKER_HSEWB008_Bloc>()
            .add(TRICKER_HSEWB008geteachITEM());
      },
      Areafn: (v) {
        metrix(context);
      },
      ItemPick: HSEWB008var.ItemPick,
      PCS: HSEWB008var.PCS,
      PCSleft: HSEWB008var.PCSleft,
      POINTs: HSEWB008var.POINTs,
      UNIT: HSEWB008var.UNIT,
      INTERSEC: HSEWB008var.INTERSEC,
      RESULTFORMAT: HSEWB008var.RESULTFORMAT,
      Area: HSEWB008var.Area,
      GAP: HSEWB008var.GAP,
      GAPnameList: HSEWB008var.GAPnameList,
      GAPname: HSEWB008var.GAPname,
      GAPnamePick: (v) {
        HSEWB008var.GAPname = v;
        context
            .read<TRICKER_HSEWB008_Bloc>()
            .add(TRICKER_HSEWB008geteachGRAPH());
      },

      //------- Bottom
      REFLOT: HSEWB008var.REFLOT,
      REFLOTfn: (v) {
        if (HSEWB008var.REFLOT != '') {
          context.read<TRICKER_HSEWB008_Bloc>().add(TRICKER_HSEWB008REFER());
        }
      },
      ACCEPT: (v) {
        print(HSEWB008var.ARAE_ANS);
        print(HSEWB008var.AearI);
        print(HSEWB008var.Area);
        if (HSEWB008var.Area == '-') {
          //
          if (HSEWB008var.AearI != '') {
            if (HSEWB008var.PCS != '' &&
                HSEWB008var.POINTs != '' &&
                HSEWB008var.ItemPickSELECT != '') {
              if (2 > HSEWB008var.confirmdata.length) {
                context
                    .read<TRICKER_HSEWB008_Bloc>()
                    .add(TRICKER_HSEWB008confirmdata());
              } else {
                WORNINGpop(context, "Have completed POINTs");
              }
            } else {
              WORNINGpop(context, "Please select item");
            }
          }
        } else {
          if (HSEWB008var.PCS != '' &&
              HSEWB008var.POINTs != '' &&
              HSEWB008var.ItemPickSELECT != '') {
            if (2 > HSEWB008var.confirmdata.length) {
              context
                  .read<TRICKER_HSEWB008_Bloc>()
                  .add(TRICKER_HSEWB008confirmdata());
            } else {
              WORNINGpop(context, "Have completed POINTs");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      FINISH: (v) {
        // num testou = test.interpret();
        // print(testou);

        if (HSEWB008var.PCSleft != '0') {
          if (HSEWB008var.PCS != '' &&
              HSEWB008var.POINTs != '' &&
              HSEWB008var.ItemPickSELECT != '') {
            if (HSEWB008var.FORMULAI != '' &&
                HSEWB008var.VAL1 != '' &&
                HSEWB008var.VAL2 != '' &&
                HSEWB008var.AearI != '') {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HSEWB008_Bloc>()
                  .add(TRICKER_HSEWB008FINISH());
            } else {
              WORNINGpop(context, "POINTs are not complete");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      preview: HSEWB008var.preview,
      confirmdata: HSEWB008var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HSEWB008_Bloc>().add(TRICKER_HSEWB008CLEAR());
      },
      BACKPAGE: (v) {
        HSEWB008var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HSEWB008var.ItemPickSELECT = '';
        context.read<TRICKER_HSEWB008_Bloc>().add(TRICKER_HSEWB008SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HSEWB008_Bloc>().add(TRICKER_HSEWB008RESETVALUE());
      },
      CAL2: HSEWB008var.RESULTFORMAT != 'CAL2',

      ITEMleftUNIT: HSEWB008var.ITEMleftUNIT,
      ITEMleftVALUE: HSEWB008var.ITEMleftVALUE,
      VAL1: HSEWB008var.VAL1,
      VAL2: HSEWB008var.VAL2,
      VAL3: HSEWB008var.VAL3,
      VAL4: HSEWB008var.VAL4,
      Aear: HSEWB008var.AearI,
      FORMULA: HSEWB008var.FORMULA,
      FORMULAI: HSEWB008var.FORMULAI,
      ANS: HSEWB008var.ANS,
      AearACCEPT: (v) {},
      AearACCEPTbool: false,
    );
  }
}

void metrix(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 1000,
          width: 1100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: select_metrix(),
            ),
          ),
        ),
      );
    },
  );
}

class select_metrix extends StatefulWidget {
  const select_metrix({Key? key}) : super(key: key);

  @override
  State<select_metrix> createState() => _select_metrixState();
}

class _select_metrixState extends State<select_metrix> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            if (HSEWB008var.shape == 'sheet') ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    HSEWB008var.SelectAEAR = 'RS';
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(1),
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/squre.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            if (HSEWB008var.shape == 'cylinder') ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    HSEWB008var.SelectAEAR = 'CYNH';
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(1),
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/rol2.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            if (HSEWB008var.shape == 'tube') ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    HSEWB008var.SelectAEAR = 'CYWH';
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(1),
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/rolin2.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        Container(
          height: 800,
          width: 500,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  // if (HSEWB008var.SelectAEAR == 'RS') ...[
                  if (HSEWB008var.shape == 'sheet') ...[
                    Text("rectangular shape"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("L1*L2 + L1*L2 + L1*H*2 + L2*H*2"),
                    ),
                    // Text("L1 ความกว้าง , L2 ความยาว , H ความสูง"),
                    Text("--------------------------------------"),
                    ComInputText(
                      sLabel: "L1 ความกว้าง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.RS_L1,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.RS_L1 = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "L2 ความยาว",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.RS_L2,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.RS_L2 = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "H ความสูง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.RS_HI,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.RS_HI = s;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {
                          if (HSEWB008var.RS_HI != '' &&
                              HSEWB008var.RS_L1 != '' &&
                              HSEWB008var.RS_L2 != '') {
                            double L1 =
                                (double.parse(ConverstStr(HSEWB008var.RS_L1)) /
                                    2);
                            double L2 =
                                (double.parse(ConverstStr(HSEWB008var.RS_L2)) /
                                    2);
                            double H =
                                (double.parse(ConverstStr(HSEWB008var.RS_HI)));
                            HSEWB008var.ARAE_ANS =
                                "${(L1 * L2 + L1 * L2 + L1 * H * 2 + L2 * H * 2).toStringAsFixed(4)}";
                            BALANCE_HSEWB008maincontext.read<
                                    TRICKER_HSEWB008_Bloc>()
                                .add(TRICKER_HSEWB008AEAR());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 400,
                          color: Colors.blue,
                          child: Center(
                            child: Text("SAVE"),
                          ),
                        ),
                      ),
                    ),
                  ],
                  // if (HSEWB008var.SelectAEAR == 'CYNH') ...[
                  if (HSEWB008var.shape == 'cylinder') ...[
                    Text("Cylinser"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("2*PI*(DI/2)*H + PI*(DI/2)^2"),
                    ),
                    // Text("R รัศมี , H ความสูง , PI 3.1415"),
                    Text("PI 3.1415"),
                    Text("--------------------------------------"),
                    ComInputText(
                      sLabel: "DI เส้นผ่านศูนย์กลาง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.CYNH_DI,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.CYNH_DI = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "H ความสูง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.CYNH_HI,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.CYNH_HI = s;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {
                          if (HSEWB008var.CYNH_DI != '' &&
                              HSEWB008var.CYNH_HI != '') {
                            double PI = 3.1415;
                            double R = (double.parse(
                                    ConverstStr(HSEWB008var.CYNH_DI)) /
                                2);

                            double H = (double.parse(
                                ConverstStr(HSEWB008var.CYNH_HI)));
                            HSEWB008var.ARAE_ANS =
                                "${((2 * PI * R * H) + (PI * R * R) * 2).toStringAsFixed(4)}";
                            BALANCE_HSEWB008maincontext.read<
                                    TRICKER_HSEWB008_Bloc>()
                                .add(TRICKER_HSEWB008AEAR());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 400,
                          color: Colors.blue,
                          child: Center(
                            child: Text("SAVE"),
                          ),
                        ),
                      ),
                    ),
                  ],
                  // if (HSEWB008var.SelectAEAR == 'CYWH') ...[
                  if (HSEWB008var.shape == 'tube') ...[
                    Text("Cylinser with hold"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "2*PI*(DIOUT/2)*H + 2*PI*(DIIN/2)*H + (PI*(DIOUT/2)^2 - PI*(DIIN/2)^2)*2"),
                    ),
                    // Text("R1 รัศมีนอก , R2 รัศมีใน , H ความสูง , PI 3.1415"),
                    Text("PI 3.1415"),
                    Text("--------------------------------------"),
                    ComInputText(
                      sLabel: "DIOUT เส้นผ่านศูนย์กลางนอก",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.CYWH_DIOUT,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.CYWH_DIOUT = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "DIIN เส้นผ่านศูนย์กลางใน",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.CYWH_DIIN,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.CYWH_DIIN = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "H ความสูง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: HSEWB008var.iscontrol,
                      fnContr: (input) {
                        HSEWB008var.iscontrol = input;
                      },
                      sValue: HSEWB008var.CYWH_HI,
                      returnfunc: (String s) {
                        setState(() {
                          HSEWB008var.CYWH_HI = s;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {
                          if (HSEWB008var.CYWH_DIOUT != '' &&
                              HSEWB008var.CYWH_DIIN != '' &&
                              HSEWB008var.CYWH_HI != '') {
                            double PI = 3.1415;
                            double R1 = (double.parse(
                                    ConverstStr(HSEWB008var.CYWH_DIOUT)) /
                                2);
                            double R2 = (double.parse(
                                    ConverstStr(HSEWB008var.CYWH_DIIN)) /
                                2);
                            double H = (double.parse(
                                ConverstStr(HSEWB008var.CYWH_HI)));

                            print(PI);
                            print(R1);
                            print(R2);
                            print(H);

                            HSEWB008var.ARAE_ANS =
                                "${((2 * PI * R1 * H) + (2 * PI * R2 * H) + (R1 * R1 - R2 * R2) * 2 * PI).toStringAsFixed(4)}";
                            BALANCE_HSEWB008maincontext.read<
                                    TRICKER_HSEWB008_Bloc>()
                                .add(TRICKER_HSEWB008AEAR());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 400,
                          color: Colors.blue,
                          child: Center(
                            child: Text("SAVE"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
