import "package:cnamgs/module/palette_couleur/home.dart";
import"package:flutter/material.dart";

import "home3.dart";
import "home5.dart";

class Home4 extends StatefulWidget {
  const Home4({super.key});

  @override
  State<Home4> createState() => _Home4State();
}

class _Home4State extends State<Home4> {
  late DateTime now;

  String selectedValue3 = '';
  String selectedValue4 = '';
  String selectedValue5 = '';
  String selectedValue6 = '';
  String selectedValue7 = '';
  String selectedValue8 = '';

  String selectedSituation1 = '';
  String selectedSituation2 = '';

  String Pere = '';
  String Mere = '';

  final date_mariage =new TextEditingController();
  final Adress_electro =new TextEditingController();
  final Commune_district_residence=new TextEditingController();
  final Arrondissement_Canton_residence =new TextEditingController();
  final Quartier_Village_residence =new TextEditingController();
  final contact1 =new TextEditingController();
  final contact2 =new TextEditingController();

  final situation =new TextEditingController();

  bool isYesChecked = false;
  bool isNoChecked = false;
  bool isYesChecked1 = false;
  bool isNoChecked1 = false;
  bool isYesChecked2 = false;
  bool isNoChecked2 = false;

  bool Situation1 = false;
  bool Situation2 = false;

  bool pere = false;
  bool mere = false;
  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Etape5",style: TextStyle(color: Palette.white),),
        backgroundColor: Palette.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height/20,
              width: MediaQuery.of(context).size.height*0.9,
              decoration: BoxDecoration(
                  color: Palette.yellow
              ),
              child: Center(
                child: Text("Affiliés au Fonds Gabonais Economiquement Faibles (GEF)"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/45,),

            Row(
              children: [
                Expanded(child: Text("Le demandeur est le (la) conjoint (e) de l'assuré (e) référent:")),

              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: Situation1,
                  onChanged: (value) {
                    setState(() {
                      Situation1 = value!;
                      Situation2 = !value!;
                      selectedSituation1 = Situation1 ? 'Revenu inferieur au SMIG' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Revenu inférieur au SMIG')),
                SizedBox(width: 20),
                Checkbox(
                  value: Situation2,
                  onChanged: (value) {
                    setState(() {
                      Situation2 = value!;
                      Situation1 = !value!;
                      selectedSituation2 = Situation2 ? 'Réfugié(e)' : '';
                      selectedSituation1 = '';

                    });
                  },
                ),
                Expanded(child: Text('Réfugié(e)')),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: Situation1,
                  onChanged: (value) {
                    setState(() {
                      Situation1 = value!;
                      Situation2 = !value!;
                      selectedSituation1 = Situation1 ? 'Etudiant' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Etudiant')),
                //SizedBox(width: 20),
                Text("Ou"),
                SizedBox(width: 20),
                Checkbox(
                  value: Situation2,
                  onChanged: (value) {
                    setState(() {
                      Situation2 = value!;
                      Situation1 = !value!;
                      selectedSituation2 = Situation2 ? 'Elève' : '';
                      selectedSituation1 = '';

                    });
                  },
                ),
                Expanded(child: Text('Elève')),
              ],
            ),
            SizedBox(height: 20),
            if (selectedSituation1.isNotEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/35,),
                      Text("Etablissement scolaire"),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: date_mariage,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: "Etablissement",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/35,),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/35,),
                      Expanded(child: Text("Date de début année scolaire (JJ-MM-AAAA)")),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: date_mariage,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "année scolaire",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/35,),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: Situation1,
                        onChanged: (value) {
                          setState(() {
                            Situation1 = value!;
                            Situation2 = !value!;
                            selectedSituation1 = Situation1 ? 'Réligieux' : '';
                            selectedSituation2 = '';
                          });
                        },
                      ),
                      Expanded(child: Text('Réligieux')),
                      //SizedBox(width: 20),
                      Checkbox(
                        value: Situation2,
                        onChanged: (value) {
                          setState(() {
                            Situation2 = value!;
                            Situation1 = !value!;
                            selectedSituation2 = Situation2 ? 'Ministre de culte' : '';
                            selectedSituation1 = '';

                          });
                        },
                      ),
                      Expanded(child: Text('Ministre de culte')),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: Situation1,
                        onChanged: (value) {
                          setState(() {
                            Situation1 = value!;
                            Situation2 = !value!;
                            selectedSituation1 = Situation1 ? 'Imam' : '';
                            selectedSituation2 = '';
                          });
                        },
                      ),
                      Expanded(child: Text('Imam')),
                      //SizedBox(width: 20),
                      Checkbox(
                        value: Situation2,
                        onChanged: (value) {
                          setState(() {
                            Situation2 = value!;
                            Situation1 = !value!;
                            selectedSituation2 = Situation2 ? 'Prêtre' : '';
                            selectedSituation1 = '';

                          });
                        },
                      ),
                      Expanded(child: Text('Prêtre')),
                      Checkbox(
                        value: Situation2,
                        onChanged: (value) {
                          setState(() {
                            Situation2 = value!;
                            Situation1 = !value!;
                            selectedSituation2 = Situation2 ? 'Autre' : '';
                            selectedSituation1 = '';

                          });
                        },
                      ),
                      Expanded(child: Text('Autre')),
                    ],
                  ),
                  if (selectedSituation1.isNotEmpty)
                    Row(
                      children: [
                        Text("Association religieuse"),
                        Expanded(
                          child: TextFormField(
                            controller: date_mariage,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Association religieuse",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),

          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home5()));

        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
