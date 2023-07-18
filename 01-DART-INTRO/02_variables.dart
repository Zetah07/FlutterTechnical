
// ignore_for_file: unused_local_variable

void main() {

  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  // bool? isAlive
  final habilities =<String>['impostor'];
  // final habilities = ['impostor'];
  // final List<String> habilities =['impostor'];
  final List<String> sprites = ['ditto/front.png', 'ditto/back.png'];

  //dynamic == null 
  dynamic errorMessage = 'Hola';
  dynamic errorMessage1 = [1,2,3,4,5,6,];
  dynamic errorMessage2 = {1,2,3,4,5,6,};
  dynamic errorMessage3 = true;
  dynamic errorMessage4 = null;
  dynamic errorMessage5 = ()=>true;



  print("""
  $pokemon
  $hp
  $isAlive
  $habilities
  $sprites
  $errorMessage

  """);

}