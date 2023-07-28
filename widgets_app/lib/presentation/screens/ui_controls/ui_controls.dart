import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controles de UI'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { bycicle, car, motorcycle, bus, train, plane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selecedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Activar modo desarrollador'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        if (isDeveloper) ...[
          RadioListTile(
            title: const Text('Carro'),
            subtitle: const Text('Transporte personal'),
            value: Transportation.car,
            groupValue: selecedTransportation,
            onChanged: (value) => setState(() {
              selecedTransportation = Transportation.car;
            }),
          ),
          RadioListTile(
            title: const Text('Moto'),
            subtitle: const Text('Transporte personal'),
            value: Transportation.motorcycle,
            groupValue: selecedTransportation,
            onChanged: (value) => setState(() {
              selecedTransportation = Transportation.motorcycle;
            }),
          ),
          RadioListTile(
            title: const Text('Avión'),
            subtitle: const Text('Transporte público'),
            value: Transportation.plane,
            groupValue: selecedTransportation,
            onChanged: (value) => setState(() {
              selecedTransportation = Transportation.plane;
            }),
          ),
          RadioListTile(
            title: const Text('Tren'),
            subtitle: const Text('Transporte público'),
            value: Transportation.train,
            groupValue: selecedTransportation,
            onChanged: (value) => setState(() {
              selecedTransportation = Transportation.train;
            }),
          ),
          RadioListTile(
            title: const Text('Bicicleta'),
            subtitle: const Text('Transporte personal'),
            value: Transportation.bycicle,
            groupValue: selecedTransportation,
            onChanged: (value) => setState(() {
              selecedTransportation = Transportation.bycicle;
            }),
          ),
          RadioListTile(
            title: const Text('Bus'),
            subtitle: const Text('Transporte público'),
            value: Transportation.bus,
            groupValue: selecedTransportation,
            onChanged: (value) => setState(() {
              selecedTransportation = Transportation.bus;
            }),
          ),
        ],
        if (!isDeveloper) ...[
          const ListTile(
              title: Text('Carro'),
              subtitle: Text('Transporte personal'),
              enabled: false,
          ),
          const ListTile(
              title: Text('Moto'),
              subtitle: Text('Transporte personal'),
              enabled: false,
          ),
          const ListTile(
              title: Text('Avión'),
              subtitle: Text('Transporte público'),
              enabled: false,
          ),
          const ListTile(
              title: Text('Tren'),
              subtitle: Text('Transporte público'),
              enabled: false,
          ),
          const ListTile(
              title: Text('Bicicleta'),
              subtitle: Text('Transporte personal'),
              enabled: false,
          ),
          const ListTile(
              title: Text('Bus'),
              subtitle: Text('Transporte público'),
              enabled: false,
          ),
        ]
      ],
    );
  }
}
