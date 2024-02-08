import "package:cnamgs/module/palette_couleur/home.dart";
import"package:flutter/material.dart";

import "home3.dart";

class Home7 extends StatefulWidget {
  const Home7({super.key});

  @override
  State<Home7> createState() => _Home7State();
}

class _Home7State extends State<Home7> {
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
        title: Text("Etape7",style: TextStyle(color: Palette.white),),
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
                child: Text("Affiliés au Fonds Secteur Privé"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/45,),

            Row(
              children: [
                Expanded(child: Text("Position administrative:")),
                Checkbox(
                  value: Situation1,
                  onChanged: (value) {
                    setState(() {
                      Situation1 = value!;
                      Situation2 = !value!;
                      selectedSituation1 = Situation1 ? 'Actif' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Actif')),
                SizedBox(width: 20),
                Checkbox(
                  value: Situation2,
                  onChanged: (value) {
                    setState(() {
                      Situation2 = value!;
                      Situation1 = !value!;
                      selectedSituation2 = Situation2 ? 'Retraité' : '';
                      selectedSituation1 = '';

                    });
                  },
                ),
                Expanded(child: Text('Retraité')),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Code d\'Administration')),
                //SizedBox(width: 20),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: date_mariage,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "code",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text('Date effective de prise de fonction ou d\'embauche (JJ-MM-AAAA)')),
                //SizedBox(width: 20),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: date_mariage,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "date",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            Row(
              children: [
                //Expanded(child: Text("Agent Public")),
                Checkbox(
                  value: Situation1,
                  onChanged: (value) {
                    setState(() {
                      Situation1 = value!;
                      Situation2 = !value!;
                      selectedSituation1 = Situation1 ? 'Agent Public' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Agent Public')),
                SizedBox(width: 20),
                Checkbox(
                  value: Situation2,
                  onChanged: (value) {
                    setState(() {
                      Situation2 = value!;
                      Situation1 = !value!;
                      selectedSituation2 = Situation2 ? 'Membre des institutions constitutionnelles' : '';
                      selectedSituation1 = '';

                    });
                  },
                ),
                Expanded(child: Text('Membre des institutions constitutionnelles')),
              ],
            ),
            Row(
              children: [
                //Expanded(child: Text("Agent Public")),
                Checkbox(
                  value: Situation1,
                  onChanged: (value) {
                    setState(() {
                      Situation1 = value!;
                      Situation2 = !value!;
                      selectedSituation1 = Situation1 ? 'Salarié(e) de l\'état ou d\'une administration publique' : '';
                      selectedSituation2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Salarié(e) de l\'état ou d\'une administration publique')),
                SizedBox(width: 20),
                Checkbox(
                  value: Situation2,
                  onChanged: (value) {
                    setState(() {
                      Situation2 = value!;
                      Situation1 = !value!;
                      selectedSituation2 = Situation2 ? 'Retraité (e) du secteur public' : '';
                      selectedSituation1 = '';

                    });
                  },
                ),
                Expanded(child: Text('Retraité (e) du secteur public')),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Matricule')),
                //SizedBox(width: 20),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: date_mariage,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "matricule",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text('Indice')),
                //SizedBox(width: 20),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: date_mariage,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Indice",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text('Grade :')),
                //SizedBox(width: 20),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: date_mariage,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Grade",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Home5()));

        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
