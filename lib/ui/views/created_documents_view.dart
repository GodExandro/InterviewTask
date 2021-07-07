import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:test1/models/document_model.dart';
import 'package:test1/ui/shared/colors.dart';
import 'package:test1/ui/shared/paddings.dart';

import 'package:test1/ui/widgets/navigation_bloc.dart';
import 'package:test1/viewmodels/created_documents_view_model.dart';

class CreatedDocumentsView extends StatelessWidget with NavigationStates {
  final List<DocumentModel> documents;

  CreatedDocumentsView({Key key, this.documents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatedDocumentsViewModel>.reactive(
      viewModelBuilder: () => CreatedDocumentsViewModel(),
      onModelReady: (model) async {},
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Zapisane dokumenty'),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: new ListView.builder(
                  itemBuilder: (BuildContext ctx, int index) =>
                      _buildSavedDocuments(ctx, index, model),
                  itemCount: documents.length > 0 ? documents.length : 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSavedDocuments(
      BuildContext ctx, int index, CreatedDocumentsViewModel model) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: backgroundColor,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.blue[900],
                  ]),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: ExpansionTile(
                title: AutoSizeText(
                  "Nr. faktury: " + documents[index].factureNumber,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  maxFontSize: 20,
                  minFontSize: 1,
                ),
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          " Nazwa kontrahenta: " +
                              documents[index].contractorName,
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          maxFontSize: 20,
                          minFontSize: 1,
                        ),
                        SizedBox(height: 10),
                        AutoSizeText(
                          "Kwota Netto: " +
                              documents[index].nettoNumber.toString(),
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          maxFontSize: 20,
                          minFontSize: 1,
                        ),
                        SizedBox(height: 10),
                        AutoSizeText(
                          " Kwota Brutto: " +
                              documents[index].bruttoNumber.toString(),
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          maxFontSize: 20,
                          minFontSize: 1,
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}
