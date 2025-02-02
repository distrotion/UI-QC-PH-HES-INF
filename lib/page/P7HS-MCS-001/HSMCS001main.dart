import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-01-HSMCS001.dart';
import '../../bloc/BlocEvent/07-02-TrickHSMCS001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTIMG/SINGLESHOTIMGwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HSMCS001var.dart';

late BuildContext MICROSCOPEHSMCS001_CONTEXT;

class MICROSCOPE_HSMCS001main extends StatelessWidget {
  MICROSCOPE_HSMCS001main({Key? key, this.data}) : super(key: key);
  HSMCS001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HSMCS001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HSMCS001_BlocBuffer extends StatelessWidget {
  _TRICKER_HSMCS001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HSMCS001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HSMCS001_Bloc(),
        child: BlocBuilder<TRICKER_HSMCS001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HSMCS001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HSMCS001body extends StatefulWidget {
  ROCKWELL_HSMCS001body({Key? key, this.data}) : super(key: key);
  HSMCS001SCHEMA? data;

  @override
  State<ROCKWELL_HSMCS001body> createState() => _ROCKWELL_HSMCS001bodyState();
}

class _ROCKWELL_HSMCS001bodyState extends State<ROCKWELL_HSMCS001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    HSMCS001var.base64pic01 = imgw;
    HSMCS001var.base64pic02 = imgw;
    HSMCS001var.base64pic03 = imgw;
    HSMCS001var.base64pic04 = imgw;
    HSMCS001var.base64pic01data = '';
    HSMCS001var.base64pic02data = '';
    HSMCS001var.base64pic03data = '';
    HSMCS001var.base64pic04data = '';
    // HSMCS001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HSMCS001var.ItemPickSELECT = '';
    context.read<TRICKER_HSMCS001_Bloc>().add(TRICKER_HSMCS001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 6;
    // print(widget.data?.UPDATE);
    MICROSCOPEHSMCS001_CONTEXT = context;

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HSMCS001var.PO = widget.data?.PO ?? '';
        HSMCS001var.CP = widget.data?.CP ?? '';
        HSMCS001var.QTY = widget.data?.QTY ?? '';
        HSMCS001var.PROCESS = widget.data?.PROCESS ?? '';
        HSMCS001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HSMCS001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HSMCS001var.FG = widget.data?.FG ?? '';
        HSMCS001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HSMCS001var.PART = widget.data?.PART ?? '';
        HSMCS001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HSMCS001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HSMCS001var.ItemPick = widget.data?.ItemPick ?? [''];
        HSMCS001var.PCS = widget.data?.PCS ?? '';
        // HSMCS001var.PCS = '10';
        HSMCS001var.PCSleft = widget.data?.PCSleft ?? '';
        // HSMCS001var.PCSleft = '10';
        HSMCS001var.POINTs = widget.data?.POINTs ?? '';
        // HSMCS001var.POINTs = '10';
        HSMCS001var.UNIT = widget.data?.UNIT ?? '';
        // HSMCS001var.UNIT = 'pcs/lots';
        HSMCS001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HSMCS001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HSMCS001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HSMCS001var.GAP = widget.data?.GAP ?? '';
        //
        HSMCS001var.preview = widget.data?.preview ?? [];
        HSMCS001var.confirmdata = widget.data?.confirmdata ?? [];
        HSMCS001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HSMCS001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HSMCS001var.REFLOT = widget.data?.REFLOT ?? '';

        if (HSMCS001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // Timer timer = Timer(const Duration(seconds: 5), () {
      //   context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
      // });
      // HSMCS001var.DHtimer = timer;
    }
    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "SER-MCS-001",
      PO: HSMCS001var.PO,
      CP: HSMCS001var.CP,
      QTY: HSMCS001var.QTY,
      PROCESS: HSMCS001var.PROCESS,
      CUSLOT: HSMCS001var.CUSLOT,
      TPKLOT: HSMCS001var.TPKLOT,
      FG: HSMCS001var.FG,
      CUSTOMER: HSMCS001var.CUSTOMER,
      PART: HSMCS001var.PART,
      PARTNAME: HSMCS001var.PARTNAME,
      MATERIAL: HSMCS001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HSMCS001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HSMCS001_Bloc>()
            .add(TRICKER_HSMCS001geteachITEM());
        HSMCS001var.base64pic01 = imgw;
        HSMCS001var.base64pic02 = imgw;
        HSMCS001var.base64pic03 = imgw;
        HSMCS001var.base64pic04 = imgw;
        HSMCS001var.iscontrol = true;
        HSMCS001var.base64pic01data = '';
        HSMCS001var.base64pic02data = '';
        HSMCS001var.base64pic03data = '';
        HSMCS001var.base64pic04data = '';
        context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
      },
      ItemPick: HSMCS001var.ItemPick,
      PCS: HSMCS001var.PCS,
      PCSleft: HSMCS001var.PCSleft,
      POINTs: HSMCS001var.POINTs,
      UNIT: HSMCS001var.UNIT,
      INTERSEC: HSMCS001var.INTERSEC,
      RESULTFORMAT: HSMCS001var.RESULTFORMAT,
      Ghtype: HSMCS001var.GRAPHTYPE,

      //------- Bottom
      REFLOT: HSMCS001var.REFLOT,
      REFLOTfn: (v) {
        if (HSMCS001var.REFLOT != '') {
          context.read<TRICKER_HSMCS001_Bloc>().add(TRICKER_HSMCS001REFER());
          Timer(const Duration(seconds: 2), () {
            context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
          });
        }
      },
      ACCEPT: (v) {
        if (HSMCS001var.PCS != '' &&
            HSMCS001var.POINTs != '' &&
            HSMCS001var.ItemPickSELECT != '') {
          onLoadingFAKEintTIME(context, 3);
          if (int.parse(HSMCS001var.PCSleft) > 0) {
            print(".......>");
            context.read<TRICKER_HSMCS001_Bloc>().add(TRICKER_HSMCS001FINISH());
            Timer(const Duration(seconds: 3), () {
              context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
            });
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      FINISH: (v) {},
      preview: HSMCS001var.preview,
      confirmdata: HSMCS001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {
        HSMCS001var.base64pic01 = imgw;
        HSMCS001var.base64pic02 = imgw;
        HSMCS001var.base64pic03 = imgw;
        HSMCS001var.base64pic04 = imgw;
        HSMCS001var.base64pic01data = '';
        HSMCS001var.base64pic02data = '';
        HSMCS001var.base64pic03data = '';
        HSMCS001var.base64pic04data = '';
        // HSMCS001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HSMCS001var.ItemPickSELECT = '';
        context.read<TRICKER_HSMCS001_Bloc>().add(TRICKER_HSMCS001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {},
      ITEMleftUNIT: HSMCS001var.ITEMleftUNIT,
      ITEMleftVALUE: HSMCS001var.ITEMleftVALUE,
      wchild: Column(
        children: [
          FileUploadButton01(),
          FileUploadButton02(),
          FileUploadButton03(),
          FileUploadButton04(),
        ],
      ),
    );
  }
}

class FileUploadButton01 extends StatefulWidget {
  const FileUploadButton01({Key? key}) : super(key: key);

  @override
  State<FileUploadButton01> createState() => _FileUploadButton01State();
}

class _FileUploadButton01State extends State<FileUploadButton01> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HSMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HSMCS001var.iscontrol = input;
              });
            },
            sValue: HSMCS001var.base64pic01data,
            returnfunc: (String s) {
              HSMCS001var.base64pic01data = s;
            },
          ),
          InkWell(
            onTap: () {
              //
              PICPOP_ConsoleBoxBODY(context);
              HSMCS001var.base64picPOP = HSMCS001var.base64pic01;
            },
            child: PicShow(
              width: 200,
              height: 100,
              base64: HSMCS001var.base64pic01,
            ),
          ),
          IMGbutton(
            base64pic: HSMCS001var.base64pic01,
            setimg: (img) {
              HSMCS001var.base64pic01 = img;
              context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton02 extends StatefulWidget {
  const FileUploadButton02({Key? key}) : super(key: key);

  @override
  State<FileUploadButton02> createState() => _FileUploadButton02State();
}

class _FileUploadButton02State extends State<FileUploadButton02> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HSMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HSMCS001var.iscontrol = input;
              });
            },
            sValue: HSMCS001var.base64pic02data,
            returnfunc: (String s) {
              HSMCS001var.base64pic02data = s;
            },
          ),
          InkWell(
            onTap: () {
              //
              PICPOP_ConsoleBoxBODY(context);
              HSMCS001var.base64picPOP = HSMCS001var.base64pic02;
            },
            child: PicShow(
              width: 200,
              height: 100,
              base64: HSMCS001var.base64pic02,
            ),
          ),
          IMGbutton(
            base64pic: HSMCS001var.base64pic02,
            setimg: (img) {
              HSMCS001var.base64pic02 = img;
              context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton03 extends StatefulWidget {
  const FileUploadButton03({Key? key}) : super(key: key);

  @override
  State<FileUploadButton03> createState() => _FileUploadButton03State();
}

class _FileUploadButton03State extends State<FileUploadButton03> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HSMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HSMCS001var.iscontrol = input;
              });
            },
            sValue: HSMCS001var.base64pic03data,
            returnfunc: (String s) {
              HSMCS001var.base64pic03data = s;
            },
          ),
          InkWell(
            onTap: () {
              //
              PICPOP_ConsoleBoxBODY(context);
              HSMCS001var.base64picPOP = HSMCS001var.base64pic03;
            },
            child: PicShow(
              width: 200,
              height: 100,
              base64: HSMCS001var.base64pic03,
            ),
          ),
          IMGbutton(
            base64pic: HSMCS001var.base64pic03,
            setimg: (img) {
              HSMCS001var.base64pic03 = img;
              context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton04 extends StatefulWidget {
  const FileUploadButton04({Key? key}) : super(key: key);

  @override
  State<FileUploadButton04> createState() => _FileUploadButton04State();
}

class _FileUploadButton04State extends State<FileUploadButton04> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: HSMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                HSMCS001var.iscontrol = input;
              });
            },
            sValue: HSMCS001var.base64pic04data,
            returnfunc: (String s) {
              HSMCS001var.base64pic04data = s;
            },
          ),
          InkWell(
            onTap: () {
              //
              PICPOP_ConsoleBoxBODY(context);
              HSMCS001var.base64picPOP = HSMCS001var.base64pic04;
            },
            child: PicShow(
              width: 200,
              height: 100,
              base64: HSMCS001var.base64pic04,
            ),
          ),
          IMGbutton(
            base64pic: HSMCS001var.base64pic04,
            setimg: (img) {
              HSMCS001var.base64pic04 = img;
              context.read<HSMCS001_Bloc>().add(HSMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

void PICPOP_ConsoleBoxBODY(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        // color: Colors.blue,

        child: Dialog(child: PICPOPUP()),
      );
    },
  );
}

class PICPOPUP extends StatefulWidget {
  const PICPOPUP({Key? key}) : super(key: key);

  @override
  State<PICPOPUP> createState() => _PICPOPUPState();
}

class _PICPOPUPState extends State<PICPOPUP> {
  @override
  Widget build(BuildContext context) {
    return PicShow(
      width: 900,
      height: 600,
      base64: HSMCS001var.base64picPOP,
    );
  }
}
