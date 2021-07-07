import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/constants/route_names.dart';
import 'package:test1/models/document_model.dart';
import 'package:test1/service/navigation_service.dart';


import '../locator.dart';
import 'base_model.dart';

class HomeViewModel extends BaseModel {
  TextEditingController factureNumberInput = TextEditingController();
  TextEditingController contractorNameInput = TextEditingController();
  TextEditingController nettoNumberInput = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  String bruttoNumberInput = "0";
  String dropdownValue;

  List<DocumentModel> documentList = [];

  void save() {
    if (nettoNumberInput.text != '' &&
        contractorNameInput.text != '' &&
        factureNumberInput.text != '' &&
        bruttoNumberInput != "0" &&
        double.parse(nettoNumberInput.text.toString()) > 0 &&
        double.parse(bruttoNumberInput) > 0) {
      final document = DocumentModel(
          contractorName: contractorNameInput.text,
          factureNumber: factureNumberInput.text,
          nettoNumber: double.parse(nettoNumberInput.text),
          bruttoNumber: double.parse(bruttoNumberInput));

      documentList.add(document);
    }
  }

  void countBruttoValue() {
    if (nettoNumberInput.text != '' && dropdownValue != null) {
      double bruttoValue = double.parse(nettoNumberInput.text.toString()) -
          double.parse(nettoNumberInput.text.toString()) *
              double.parse(dropdownValue.replaceAll("%", "")) /
              100.0;
      bruttoNumberInput = bruttoValue.toStringAsFixed(2);
    }
    notifyListeners();
  }

  void navigateToSavedDocuments() {
    _navigationService.navigateTo(CreatedDocumentsViewRoute,
        arguments: documentList);
  }
}
