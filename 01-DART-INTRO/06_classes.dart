void main(){
  
  final wolverine = Hero(name: 'Logan', power: 'Regeneración');
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
  
}

class Hero {
  
  String? name;
  String? power;
  
//   Hero(String pName, String pPower)
//    : name =pName,
//      power=pPower;
  
    Hero({
      required this.name,
      this.power = 'Sin poder'
          
      });
  
    @override   
    String toString(){
        return  '$name - $power'; 
    }
  
}