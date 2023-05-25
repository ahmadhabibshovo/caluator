

import 'package:get/get.dart';
import 'package:math_parser/math_parser.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
bool swicher=false;
final keyswicher=false.obs;
  final input = "".obs;
  final reasult = "".obs;
  final listOfButton=[].obs;
  
  final listOfButtonNormal = [
    "AC",
    "(",
    ")",
    "=",
    7,
    8,
    9,
    "/",
    4,
    5,
    6,
    "*",
    1,
    2,
    3,
    "-",
    ".",
    0,
    "C",
    "+"
  ];
  
  final listOfButtonSpecial = [
    "√",
    "^",
    "^2",
    "=",
    'sin(',
    'cos(',
    'tan(',
    'π',
    4,
    5,
    6,
    "*",
    1,
    2,
    3,
    "-",
    ".",
    0,
    "C",
    "+"
  ];
  addinput(index) {
    if (listOfButton[index].toString() == "AC") {
      input.value = "";
    } else if (listOfButton[index].toString() == "=") {
      try {
        reasult.value = MathNodeExpression.fromStringExtended(input.value)
            .calc(
              MathVariableValues.none,
            )
            .toString();
      } catch (e) {
        reasult.value = e.toString();
      }
    } else if (listOfButton[index].toString() == "C") {
      if (input.value.isNotEmpty) {
        input.value = input.value.substring(0, input.value.length - 1);
      }
    } else {
      input.value += listOfButton[index].toString();
      print(listOfButton[index].toString());
    }
  }
  swich(index){
    if (listOfButton[index].toString() ==
                                  "AC") {
                                input.value = "";
                                reasult.value = '';
                              } else if (listOfButton[index]
                                      .toString() ==
                                  "=") {
                                if (!swicher) {listOfButton.value =
                                    listOfButtonSpecial;
                                swicher = true;
                                }
                                else {
                                
                                listOfButton.value =
                                    listOfButtonNormal;
                                swicher = false;
                              }
                                
                              } 
  }

  @override
  void onInit() {
    listOfButton.value=listOfButtonNormal;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
