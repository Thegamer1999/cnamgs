import "package:cnamgs/module/palette_couleur/home.dart";
import"package:flutter/material.dart";

import "home4.dart";

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
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
        title: Text("Etape4",style: TextStyle(color: Palette.white),),
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
                child: Text("Enfants"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/45,),
            Row(
              children: [
                Expanded(child: Text("Si le demandeur est l'enfant de l'assuré(e) référent, remplir ci-dessous:",)),
              ],
            ),
            Row(
              children: [
                Expanded(child: Center(child: Text("Nature de la relation de l'enfant avec l'assuré référent (choix unique):"),))

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
                      isNoChecked = !value!;
                      selectedValue3 = isYesChecked ? 'Enfant d\'un mariage légal' : '';
                    });
                  },
                ),
                Expanded(child: Text('Enfant d\'un mariage légal')),

                Checkbox(
                  value: isNoChecked,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked = value!;
                      isYesChecked = !value!;
                      selectedValue4 = isNoChecked ? 'Enfant recueilli' : '';

                    });
                  },
                ),
                Expanded(child: Text('Enfant recueilli')),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isNoChecked1,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked1 = value!;
                      selectedValue5 = isNoChecked1 ? 'Enfant naturel (né hors mariage légal reconnu par l\'assuré)' : '';
                    });
                  },
                ),
                Expanded(child: Text('Enfant naturel (né hors mariage légal reconnu par l\'assuré)')),
                Checkbox(
                  value: isYesChecked1,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked1 = value!;
                      selectedValue6 = isYesChecked1 ? 'Enfant orphelin (de père et de mère) à la charge et à la garde effective de l\'assuré' : '';

                    });
                  },
                ),
                Expanded(child: Text('Enfant orphelin (de père et de mère) à la charge et à la garde effective de l\'assuré')),
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
                      selectedSituation1 = Situation1 ? 'Adoption plénière et référence du jugement d\'adoption' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Adoption plénière et référence du jugement d\'adoption')),

              ],
            ),
            SizedBox(height: 20),
            if (selectedSituation1.isNotEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/35,),

                      Expanded(
                        child: TextFormField(
                          controller: date_mariage,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Réference",
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
                ],
              ),

            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(child: Text("Autres renseignements concernant l'enfant (choix multiple):")),
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
                      selectedSituation1 = Situation1 ? 'Enfant recueilli' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Enfant recueilli par un tuteur (uniquement si la nature de la relation n\'est pas "Enfant recueilli")')),

              ],
            ),
            SizedBox(height: 20),
            if (selectedSituation1.isNotEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/35,),
                      Text("Nom du tuteur:"),
                      Expanded(
                        child: TextFormField(
                          controller: date_mariage,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Nom du tuteur",
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
                ],
              ),
            Row(
              children: [
                Checkbox(
                  value: isNoChecked1,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked1 = value!;
                      selectedValue5 = isNoChecked1 ? 'Infirmité ou maladie incurable' : '';
                    });
                  },
                ),
                Expanded(child: Text('Infirmité ou maladie incurable)')),

              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isYesChecked1,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked1 = value!;
                      selectedValue6 = isYesChecked1 ? 'Enfant scolarisé' : '';

                    });
                  },
                ),
                Expanded(child: Text('Enfant scolarisé ?')),
                Text("Ou"),
                Checkbox(
                  value: isYesChecked1,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked1 = value!;
                      selectedValue6 = isYesChecked1 ? 'Enfant en apprentissage' : '';
                    });
                  },
                ),
                Expanded(child: Text('Enfant en apprentissage?')),
              ],
            ),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(child: Text("Etablissement scolaire ou d'apprentissage:")),
                Expanded(
                  child: TextFormField(
                    controller: date_mariage,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Etablissement scolaire ou d'apprentissage",
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
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home4()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
