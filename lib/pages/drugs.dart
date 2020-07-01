import 'package:bluestorm/model/Drug.dart';
import 'package:bluestorm/repositories/getDrugs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(
          children: <Widget>[
            _searchTextField(),           
          ],
        ),
      ),

    );
  }
}

_searchTextField() {
  return Row(
    children: <Widget>[
      Container(
        width: 200,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: ("Drug name")
          ),
        ),
      ),
      Container(
        width: 100,
        child: FlatButton(
          child: Icon(
            Icons.search, 
            color: Colors.grey[100],
          ),
          color: Colors.lightBlue[900],
          onPressed: () {
            _searchDrug();
          },
        ),
      ),
    ],
  );

}

_searchDrug() {
  Future<List<Drug>> drugs = GetDrugs.getDrug();
  return FutureBuilder(
    future: drugs,
    builder: (context, snapshot){

      if(snapshot.hasError){
        return Center(child: Text('API acess error!'));
      }
      if(!snapshot.hasData){
        return Center(
          heightFactor: 100,
          child: CircularProgressIndicator()
        );
      }      
      List<Drug> drugs = snapshot.data;
      return _listView(drugs);
    }
  );
}

_listView(drugs) {
  print("Teste");
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: drugs.length,
    itemBuilder: (context, index) {
      Drug drug = drugs[index];
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(
          children: [
            Card(
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
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Details'),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              )
            ),
          ],
        ),
      );
    }
  );
}