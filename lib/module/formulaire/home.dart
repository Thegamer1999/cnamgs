import "package:cnamgs/module/palette_couleur/home.dart";
import"package:flutter/material.dart";

import "home1.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime now;
  bool isYesChecked = false;
  bool isNoChecked = false;
  String selectedValue1 = '';
  String selectedValue2 = '';
  bool isman = false;
  bool iswoman = false;
  String selectedValue3 = '';
  String selectedValue4 = '';
  final matricule =new TextEditingController();
  final Nationalite =new TextEditingController();
  final Nom =new TextEditingController();
  final Nom_jeune_fille =new TextEditingController();
  final Prenom =new TextEditingController();
  final date_naiss_civil =new TextEditingController();
  final Departement_civil =new TextEditingController();
  final Commune_district_civil=new TextEditingController();
  final Arrondissement_Canton_civil =new TextEditingController();
  final Quartier_Village_civil =new TextEditingController();
  final Pere =new TextEditingController();
  final date_naiss_pere =new TextEditingController();
  final Mere =new TextEditingController();
  final date_naiss_mere =new TextEditingController();

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
        title: Text("Etape1",style: TextStyle(color: Palette.white),),
        backgroundColor: Palette.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(child: Text("Date de dépot du dossier (JJ-MM-AAAA) :")),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(child: Text(formattedDate))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/35,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Nature du dossier:"),
                Checkbox(
                  value: isYesChecked,
                  onChanged: (value) {
                    setState(() {
                      isYesChecked = value!;
                      isNoChecked = !value!;
                      selectedValue1 = isYesChecked ? 'Assuré principal' : '';
                      selectedValue2 = '';
                    });
                  },
                ),
                Expanded(child: Text('Assuré principal')),
                SizedBox(width: 20),
                Checkbox(
                  value: isNoChecked,
                  onChanged: (value) {
                    setState(() {
                      isNoChecked = value!;
                      isYesChecked = !value!;
                      selectedValue2 = isNoChecked ? 'Ayant droit' : '';
                      selectedValue1 = '';

                    });
                  },
                ),
                Expanded(child: Text('Ayant droit')),
              ],
            ),
            SizedBox(height: 20),
            if (selectedValue2.isNotEmpty)
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width/35,),
                  Expanded(
                    child: Text(
                      'Si Ayant droit, Matricule CNAMGS de l\'assuré référent (NAG)',
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: matricule,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Matricule",
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
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              height: MediaQuery.of(context).size.height/25,
              width: MediaQuery.of(context).size.height*0.9,
              decoration: BoxDecoration(
                color: Palette.yellow
              ),
              child: Center(
                child: Text("Etat civil"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/45,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Genre:"),
                Checkbox(
                  value: isman,
                  onChanged: (value) {
                    setState(() {
                      isman = value!;
                      iswoman = !value!;
                      selectedValue3 = isman ? 'Homme' : '';
                      selectedValue4 = '';
                    });
                  },
                ),
                Expanded(child: Text('Homme')),
                SizedBox(width: 20),
                Checkbox(
                  value: iswoman,
                  onChanged: (value) {
                    setState(() {
                      iswoman = value!;
                      isman = !value!;
                      selectedValue4 = iswoman ? 'Femme' : '';
                      selectedValue3 = '';

                    });
                  },
                ),
                Expanded(child: Text('Femme')),
              ],
            ),
            //SizedBox(height: MediaQuery.of(context).size.height/50,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Text("Natinalité:"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Nationalite,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nationalite",
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
                Text("Nom:"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Nationalite,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nom",
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
                Text("Nom de jeune fille :"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Nom_jeune_fille,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nom de jeune fille",
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
                Text("Prénom(s) :"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Prenom,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Prénom(s)",
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
                Text("Né le (JJ-MM-AAAA):"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: date_naiss_civil,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Né le (JJ-MM-AAAA)",
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
                    controller: Commune_district_civil,
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
                    controller: Arrondissement_Canton_civil,
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
                Text("Père: Nom et Prénom(s)"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Pere,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nom et Prénom(s)",
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
                Text("Né le (JJ-MM-AAAA):"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: date_naiss_pere,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Né le (JJ-MM-AAAA)",
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
                Text("Mère: Nom et Prénom(s)"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: Mere,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nom et Prénom(s)",
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
                Text("Né le (JJ-MM-AAAA):"),
                SizedBox(width: MediaQuery.of(context).size.width/35,),
                Expanded(
                  child: TextFormField(
                    controller: date_naiss_mere,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Né le (JJ-MM-AAAA)",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/30,),
              ],
            ),
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home1()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
