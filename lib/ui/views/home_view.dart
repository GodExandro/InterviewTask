import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:test1/ui/widgets/navigation_bloc.dart';
import 'package:test1/viewmodels/home_view_model.dart';

class HomeView extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) async {},
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Strona Glowna'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                model.save();
              },
            ),
            IconButton(
              icon: Icon(Icons.navigate_next_outlined),
              onPressed: () {
                model.navigateToSavedDocuments();
              },
            )
          ],
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Colors.blue,
              Colors.blue[900],
            ]),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Numer faktury:  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: Theme.of(context).textTheme.bodyText1.fontSize *
                                1.1 +
                            100,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Colors.blue,
                                  Colors.blue[400],
                                ]),
                            borderRadius: BorderRadius.circular(55.0),
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            controller: model.factureNumberInput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(55.0),
                              ),
                              hintText: 'numer',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nazwa kontrahenta:  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: Theme.of(context).textTheme.bodyText1.fontSize *
                                1.1 +
                            100,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Colors.blue,
                                  Colors.blue[400],
                                ]),
                            borderRadius: BorderRadius.circular(55.0),
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            controller: model.contractorNameInput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(55.0),
                              ),
                              hintText: 'nazwa',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kwota netto:  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: Theme.of(context).textTheme.bodyText1.fontSize *
                                1.1 +
                            100,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Colors.blue,
                                  Colors.blue[400],
                                ]),
                            borderRadius: BorderRadius.circular(55.0),
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            controller: model.nettoNumberInput,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(55.0),
                              ),
                              hintText: 'liczba',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              model.countBruttoValue();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Stawka VAT:  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      DropdownButton<String>(
                        value: model.dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        items: <String>['0%', '7%', '23%'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          model.dropdownValue = value;
                          model.countBruttoValue();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kwota brutto:  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        model.bruttoNumberInput,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
