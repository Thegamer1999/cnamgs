import "package:cnamgs/module/palette_couleur/home.dart";
import"package:flutter/material.dart";

import "home2.dart";

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  late DateTime now;

  String selectedValue3 = '';
  String selectedValue4 = '';
  final Adress_postal =new TextEditingController();
  final Adress_electro =new TextEditingController();
  final Commune_district_residence=new TextEditingController();
  final Arrondissement_Canton_residence =new TextEditingController();
  final Quartier_Village_residence =new TextEditingController();
  final contact1 =new TextEditingController();
  final contact2 =new TextEditingController();


  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }
  String selectedProvince = 'Estuaire';
  String selectedDepartment = '';

  // Liste des provinces avec leurs départements respectifs
  Map<String, List<String>> provinces = {
    'Estuaire': ['Komo-Mondah', 'Noya', 'Komo-Océan'],
    'Haut-Ogooué': ['Ogooué et des Lacs', 'Mougalaba'],
    'Moyen-Ogooué': ['Abanga-Bigne', 'Moyen-Ogooué'],
    'Ngounié': ['Dola', 'Douya-Onoy'],
    'Nyanga': ['Boumi-Louetsi', 'Doutsila'],
    'Ogooué-Ivindo': ['Lopé', 'Zadié'],
    'Ogooué-Lolo': ['Djoué', 'Djoué 2'],
    'Ogooué-Maritime': ['Douigni', 'Noya'],
    'Woleu-Ntem': ['Haut-Ntem', 'Mvoung'],
  };


  @override
  Widget build(BuildContext context) {

    String formattedDate = "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Etape2",style: TextStyle(color: Palette.white),),
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
                child: Text("Residence"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/45,),
            Row(
              children: [
                SizedBox(width: 20),
                Text("Province"),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Ajouter des bordures autour du premier DropdownButton
                      borderRadius: BorderRadius.circular(5.0), // Facultatif : ajouter des coins arrondis
                    ),
                    child: DropdownButton<String>(
                      value: selectedProvince,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProvince = newValue!;
                          // Réinitialiser le département sélectionné lorsque la province change
                          selectedDepartment = '';
                        });
                      },
                      items: provinces.keys.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(width: 20),

              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            if (selectedProvince.isNotEmpty && provinces[selectedProvince] != null)
              Row(
                children: [
                  SizedBox(width: 20),
                  Text("Departement"),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Ajouter des bordures autour du deuxième DropdownButton
                        borderRadius: BorderRadius.circular(5.0), // Facultatif : ajouter des coins arrondis
                      ),
                      child: DropdownButton<String>(
                        value: selectedDepartment.isNotEmpty && provinces[selectedProvince]!.contains(selectedDepartment) ? selectedDepartment : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDepartment = newValue!;
                          });
                        },
                        items: provinces[selectedProvince]!
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Commune/ district:"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Commune_district_residence,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Commune",
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
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Arrondissement / Canton :"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Arrondissement_Canton_residence,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Arrondissement / Canton",
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
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Adresse Postale"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Adress_postal,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Adresse Postale",
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
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Adresse électronique"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Adress_electro,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Adresse électronique",
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
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Contact téléphonique:"),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("1) "),
                Expanded(
                  child: TextFormField(
                    controller: contact1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Contact téléphonique",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("2) "),
                Expanded(
                  child: TextFormField(
                    controller: contact2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Contact téléphonique",
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
            SizedBox(height: MediaQuery.of(context).size.height/50,),

          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home2()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
