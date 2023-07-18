void main(){
  
  final Map<String, dynamic> rawJson ={
    'name': 'Tony Stark',
    'power': 'Money', 
    'isAlive': true
  };
 
  
  final ironman = Hero.fromJson(
    rawJson
  );
  
  print ( ironman );
}

class Hero {
  
  String name;
  String power;
  bool isAlive;
  
  Hero({
    required this.name, 
    required this.power,
    required this.isAlive
  });
  
  Hero.fromJson( Map<String, dynamic> json )
  : name = json['name'] ?? 'No name found', //es key sensitivity es decir que es bueno el manejo de errores 
    power = json['power'] ?? 'No power found',
    isAlive = json['isAlive']?? 'No isAlive found';
    
    @override
    String toString(){
    return '$name, $power, isAlive: ${ isAlive ? 'YES!' : 'nope' }';
  }
}