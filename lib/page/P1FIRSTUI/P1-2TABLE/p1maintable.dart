import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-01-SAP.dart';
import '../../../bloc/BlocEvent/01-02-GetINS.dart';

import '../../../model/model.dart';
import '../../../widget/common/ComInputText.dart';

import '../../../widget/common/Safty.dart';
import '../FIRSTuiVAR.dart';
import 'p1widgettablefield.dart';

class MAINTABLEP1 extends StatefulWidget {
  MAINTABLEP1({Key? key, this.sapdata}) : super(key: key);
  List<dataset>? sapdata;

  @override
  State<MAINTABLEP1> createState() => _MAINTABLEP1State();
}

class _MAINTABLEP1State extends State<MAINTABLEP1> {
  @override
  void initState() {
    super.initState();
    context.read<LOADSAP_Bloc>().add(LOADSAP_Pressed());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ComInputText(
                  isSideIcon: true,
                  height: 40,
                  width: 400,
                  isContr: FIRSTUI.iscontrol,
                  fnContr: (input) {
                    FIRSTUI.iscontrol = input;
                  },
                  sValue: FIRSTUI.SEARCH,
                  returnfunc: (String s) {
                    setState(() {
                      FIRSTUI.SEARCH = s;
                    });
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      FIRSTUI.iscontrol = true;
                      FIRSTUI.SEARCH = '';
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.orange,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Center(
                      child: Text("SEARCH CLEAR"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<LOADSAP_Bloc>().add(LOADSAP_Pressed());
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.blueAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Center(
                      child: Text("RELOAD"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await Dio().post(
                      "http://172.23.10.40:16700/" + 'RAWDATA/sapget',
                      data: {
                        "ORDER": FIRSTUI.SEARCH,
                      },
                    ).then((result) {
                      //
                      var buff = result.data;
                      if (buff.length > 0) {
                        FIRSTUI.POACTIVE = FIRSTUI.SEARCH;
                        FIRSTUI.CPACTIVE =
                            int.parse(ConverstStr(buff[0]['CPMAT'].toString()))
                                .toString();
                        context.read<GetINS_Bloc>().add(GETINSset());
                      }
                    });

                    // context.read<GetINS_Bloc>().add(GETINSset());
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.brown,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Center(
                      child: Text("Query"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: P1WIDGETFIELD(
              height: 20,
              forntsize: 10,
              B01: 'PO NO.', //f1
              B02: 'CUS.', //f19
              B03: 'PART NAME.', //f17
              B04: 'PART NO.', //f16
              B05: 'QTY', //f9
              B06: 'TPK LOT.', //f30
              B07: 'INSPEC STD.', //--
              B08: 'ACTION',
              CB01: Colors.black54,
              CB02: Colors.black54,
              CB03: Colors.black54,
              CB04: Colors.black54,
              CB05: Colors.black54,
              CB06: Colors.black54,
              CB07: Colors.black54,
              CB08: Colors.black54,
              FCB: Colors.white,
            ),
          ),
          Expanded(
            flex: 46,
            child: SizedBox(
              child: tabledetailsearchlist(
                sapdata: widget.sapdata,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class tabledetailsearchlist extends StatelessWidget {
  tabledetailsearchlist({Key? key, this.sapdata}) : super(key: key);
  List<dataset>? sapdata;
  @override
  Widget build(BuildContext context) {
    List<dataset> _data = sapdata ?? [];
    List<dataset> _data_exp = [];

    for (int i = 0; i < _data.length; i++) {
      if (_data[i].f01.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f02.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f03.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f04.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f05.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f06.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f07.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f08.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f09.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f10.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f11.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f12.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f13.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f19.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f17.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f16.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase()) ||
          _data[i].f30.toUpperCase().contains(FIRSTUI.SEARCH.toUpperCase())) {
        _data_exp.add(_data[i]);
      }
    }
    return tabledetailsearch(
      sapdata: _data_exp,
    );
  }
}

class tabledetailsearch extends StatelessWidget {
  tabledetailsearch({
    Key? key,
    this.sapdata,
  }) : super(key: key);
  List<dataset>? sapdata;

  @override
  Widget build(BuildContext context) {
    List<dataset> _data_exp = sapdata ?? [];
    List<Widget> tableout = [];
    for (int i = 0; i < _data_exp.length; i++) {
      tableout.add(P1WIDGETFIELD(
        height: 45,
        B01: _data_exp[i].f01,
        B02: _data_exp[i].f19,
        B03: _data_exp[i].f17,
        B04: _data_exp[i].f16,
        B05: _data_exp[i].f09,
        B06: _data_exp[i].f30,
        B07: _data_exp[i].f37,
        B08: '',
        B09: '',
        B10: _data_exp[i].f36,
        B11: _data_exp[i].f06,
        B12: _data_exp[i].f07,
        CB01: _data_exp[i].f36 == 'finish-no'
            ? Colors.red
            : _data_exp[i].f36 == 'finish'
                ? Colors.green
                : _data_exp[i].f36 == 'ip'
                    ? Colors.yellow
                    : Colors.transparent,
        isSELECTFUNC: true,
        SELECTFUNC: (PO, CP, FG) {
          print(PO);
          print(CP);
          print(FG);
          FIRSTUI.POACTIVE = PO;
          FIRSTUI.CPACTIVE = CP;

          context.read<GetINS_Bloc>().add(GETINSset());
        },
      ));
    }
    return tabledetailinside(
      tableout: tableout,
    );
  }
}

class tabledetailinside extends StatelessWidget {
  tabledetailinside({Key? key, this.tableout}) : super(key: key);
  List<Widget>? tableout;
  @override
  Widget build(BuildContext context) {
    List<Widget> _tableout = tableout ?? [];
    return SingleChildScrollView(
      child: SizedBox(
        height: _tableout.length * 45 + 35,
        child: Column(
          children: _tableout,
        ),
      ),
    );
  }
}


// List<Widget> tableout = [
//       P1WIDGETFIELD(
//         isSELECTFUNC: true,
//         SELECTFUNC: (input) {
//           FIRSTUI.INSCOUTTEST = 2;
//           contextGB.read<BlocPageRebuild>().rebuildPage();
//         },
//       ),
//       P1WIDGETFIELD(
//         isSELECTFUNC: true,
//         SELECTFUNC: (input) {
//           FIRSTUI.INSCOUTTEST = 3;
//           contextGB.read<BlocPageRebuild>().rebuildPage();
//         },
//       ),
//     ];