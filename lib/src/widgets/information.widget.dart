import 'package:covid_19/src/models/information.model.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  List<InformationModel> listInformation = new List<InformationModel>();

  @override
  void initState() {
    List<InformationModel> listInfo = new List<InformationModel>();
    listInfo.add(new InformationModel(
        title: 'Lavado de manos',
        subTitle:
            '\nLávese las manos frecuentemente con agua y jabón por al menos 20 segundos, especialmente después de haber estado en un lugar público, o después de sonarse la nariz, toser o estornudar. \nSi no hay agua y jabón fácilmente disponibles, use un desinfectante de manos que contenga al menos un 60 % de alcohol. Cubra todas las superficies de las manos y frótelas hasta que sienta que se secaron. \nEvite tocarse los ojos, la nariz y la boca con las manos sin lavar.',
        imageUrl: 'assets/wash.png'));
    listInfo.add(new InformationModel(
        title: 'Evitar contacto',
        subTitle:
            '\nEvite el contacto cercano con personas que estén enfermas. \nMantenga una distancia entre usted y las otras personas si el COVID-19 se está propagando en su comunidad. Estos es especialmente importante para las personas que tengan un mayor riesgo de enfermarse gravemente.',
        imageUrl: 'assets/sneeze.png'));
    listInfo.add(new InformationModel(
        title: 'Quedarse en casa',
        subTitle:
            '\nQuédese en casa si está enfermo, excepto para conseguir atención médica.',
        imageUrl: 'assets/home.png'));
    listInfo.add(new InformationModel(
        title: 'Cubrise al estornudar',
        subTitle:
            '\nCúbrase la boca y la nariz  con un pañuelo desechable cuando tosa o estornude, o use la parte interna del codo. \nBote los pañuelos desechables que haya usado a la basura. \nDe inmediato, lávese las manos con agua y jabón por al menos 20 segundos. Si no hay agua y jabón fácilmente disponibles, límpiese las manos con un desinfectante de manos que contenga al menos un 60 % de alcohol.',
        imageUrl: 'assets/cough.png'));
    listInfo.add(new InformationModel(
        title: 'Usar mascarilla',
        subTitle:
            '\nSi está enfermo:  Usted debería usar una mascarilla cuando esté cerca de otras personas (p. ej., compartiendo una habitación o un vehículo) y antes de entrar al consultorio de un proveedor de atención médica. Si no puede usar una mascarilla (por ejemplo, porque le causa dificultad para respirar), debe hacer todo lo posible por cubrirse la nariz y la boca al toser y estornudar, y las personas que lo estén cuidando deben ponerse una mascarilla si entran a su habitación. \nSi NO está enfermo: No necesita usar una mascarilla a menos que esté cuidando a alguien que está enfermo (y que no puede usar una). Es posible que las mascarillas empiecen a escasear y deberían reservarse para los cuidadores.',
        imageUrl: 'assets/mask.png'));
    listInfo.add(new InformationModel(
        title: 'Limpiar y desinfectar',
        subTitle:
            '\nLimpie Y desinfecte las superficies que se tocan frecuentemente todo los días. Esto incluye las mesas, las manijas de las puertas, los interruptores de luz, los mesones, las barandas, los escritorios, los teléfonos, los teclados, los inodoros, los grifos, los lavamanos y los lavaplatos.  \nSi las superficies están sucias, límpielas: use agua y jabón o detergente antes de desinfectar.',
        imageUrl: 'assets/clean.png'));
    super.initState();

    setState(() {
      listInformation = listInfo;
    });
  }

  Container _createTile(BuildContext context, InformationModel information) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(information.title.toUpperCase(),
              style: TextStyle(color: Colors.black, fontSize: 25)),
          Divider(),
          Expanded(
            child: Text(information.subTitle,
                style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listInformation.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 1.5,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    _createTile(context, listInformation[index])
                                  ],
                                );
                              });
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.black38))),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(listInformation[index].imageUrl),
                          ),
                        ),
                        title: Text(
                          listInformation[index].title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale, color: Colors.black12),
                            //Text(listInformation[index].subTitle, style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Icon(LineIcons.arrow_circle_o_right,
                            color: Colors.white, size: 30.0)),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
