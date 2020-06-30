import 'package:bluestorm/model/Drug.dart';
import 'package:bluestorm/repositories/getDrugs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}

_body() {
  Future<List<Drug>> drugs = GetDrugs.getDrug();
  return FutureBuilder(
    future: drugs,
    builder: (context, snapshot){

      if(snapshot.hasError){
        return Center(child: Text('API acess error!'));
      }
      if(!snapshot.hasData){
        return Center(
          child: CircularProgressIndicator()
        );
      }      
      List<Drug> drugs = snapshot.data;
      return _listView(drugs);
    }
  );
}

_listView(drugs) {
  return ListView.builder(
    itemCount: drugs.length,
    itemBuilder: (context, index) {
      Drug drug = drugs[index];
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Card(
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),               
                child: Text('Name: ${drug.name}')
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                child: Text('Type: ${drug.typeDescription}')
              ),
                 
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                child: Text('Strengh: ${drug.strength} ${drug.strengthUnit}')
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('Details'),
                      onPressed: () {},
                    )
                  ],
                )
              )
            ],
          )
        ),
      );
    }
  );
}