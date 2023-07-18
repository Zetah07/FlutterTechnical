import'package:flutter/material.dart';

class CounterFuntionsScreen extends StatefulWidget {
  const CounterFuntionsScreen({super.key});

  @override
  State<CounterFuntionsScreen> createState() => _CounterFuntionsScreenState();
}

class _CounterFuntionsScreenState extends State<CounterFuntionsScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        centerTitle: true,
        actions: [
          IconButton(
          icon: const Icon( Icons.refresh_rounded ), 
          onPressed: () { 
            setState(() {
              clickCounter = 0;
            });
          }),
        ],
      ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('$clickCounter', 
                style:const TextStyle(fontSize: 160, fontWeight: FontWeight.w100) ,), 
              Text('Click${ clickCounter== 1 ? '' : 's'}', 
                style:const TextStyle(fontSize: 25, fontWeight: FontWeight.w100)), 
            ]
          )
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtom(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },),
            const SizedBox(height: 10),
            CustomButtom(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
                });
              },),
            const SizedBox(height: 10,),
            CustomButtom(
              icon: Icons.refresh_rounded,
              onPressed: (){
                setState(() {
                  clickCounter = 0;
                });
              },),
          ],
        )
      );
  }
}

class CustomButtom extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButtom({
    super.key, 
    required this.icon,
    this.onPressed,
  
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}