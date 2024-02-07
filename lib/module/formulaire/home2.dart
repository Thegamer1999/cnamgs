import "package:cnamgs/module/palette_couleur/home.dart";
import"package:flutter/material.dart";

import "home3.dart";

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
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
        title: Text("Etape3",style: TextStyle(color: Palette.white),),
        backgroundColor: Palette.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height/25,
              width: MediaQuery.of(context).size.height*0.9,
              decoration: BoxDecoration(
                  color: Palette.yellow
              ),
              child: Center(
                child: Text("Situation familiale"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/45,),
            Row(
              children: [
                Text("Cocher suivant le cas (choix unique)",),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isYesChecked,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked = value!;
                      isNoChecked = !value!;
                      selectedValue3 = isYesChecked ? 'Celibataire' : '';
                    });
                  },
                ),
                Expanded(child: Text('Célibataire')),

                Checkbox(
                  value: isNoChecked,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked = value!;
                      isYesChecked = !value!;
                      selectedValue4 = isNoChecked ? 'Marie (e) legal monogame' : '';

                    });
                  },
                ),
                Expanded(child: Text('Marié (e) légal monogame')),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isNoChecked1,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked1 = value!;
                      selectedValue5 = isNoChecked1 ? 'Union libre' : '';
                    });
                  },
                ),
                Expanded(child: Text('Union libre')),
                Checkbox(
                  value: isYesChecked1,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked1 = value!;
                      selectedValue6 = isYesChecked1 ? 'Separe (e)' : '';

                    });
                  },
                ),
                Expanded(child: Text('Séparé (e)')),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isNoChecked2,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked2 = value!;
                      selectedValue6 = isNoChecked2 ? 'Marie (e) à la coutume' : '';
                    });
                  },
                ),
                Expanded(child: Text('Marié (e) à la coutume')),
                Checkbox(
                  value: isYesChecked2,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked2 = value!;
                      selectedValue7 = isYesChecked2 ? 'Marié (e) légal polygame' : '';

                    });
                  },
                ),
                Expanded(child: Text('Marié (e) légal polygame')),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isNoChecked2,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked2 = value!;
                      selectedValue6 = isNoChecked2 ? 'Veuf ou veuve' : '';
                    });
                  },
                ),
                Expanded(child: Text('Veuf ou veuve')),
                Checkbox(
                  value: isYesChecked2,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked2 = value!;
                      selectedValue7 = isYesChecked2 ? 'Divorce (e)' : '';

                    });
                  },
                ),
                Expanded(child: Text('Divorcé (e)')),
              ],
            ),
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
                      selectedSituation1 = Situation1 ? 'Oui' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Oui')),
                SizedBox(width: 20),
                Checkbox(
                  value: Situation2,
                  onChanged: (value) {
                    setState(() {
                      Situation2 = value!;
                      Situation1 = !value!;
                      selectedSituation2 = Situation2 ? 'Non' : '';
                      selectedSituation1 = '';

                    });
                  },
                ),
                Expanded(child: Text('Non')),
              ],
            ),
            SizedBox(height: 20),
            if (selectedSituation1.isNotEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/35,),
                      Text("Date de mariage"),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: date_mariage,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: "Date de mariage",
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
                      Text("Nombre d'enfants issus du mariage"),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: date_mariage,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "enfants",
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
                      Text("Date de décès de l'assuré(e)"),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: date_mariage,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: "Date de décès",
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
                      Expanded(child: Text("En cas de séparation ou divorce Garde des enfants:")),


                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: pere,
                        onChanged: (value) {
                          setState(() {
                            pere = value!;
                            mere = !value!;
                            Pere = pere ? 'Père' : '';
                            Mere = '';
                          });
                        },
                      ),
                      Expanded(child: Text('Père')),
                      SizedBox(width: 20),
                      Checkbox(
                        value: mere,
                        onChanged: (value) {
                          setState(() {
                           mere = value!;
                            pere = !value!;
                            Mere = mere ? 'Mère' : '';
                            Pere = '';

                          });
                        },
                      ),
                      Expanded(child: Text('Mère')),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home3()));

        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
