void main(){
  
  print( greetEveryone() );
  print ('suma: ${ addTwoNumbers (10, 20)}');
  print ( greetPerson( name: 'Sebastian', message: 'Si, Buenas... ' ));
  
}

// String greetEveryone(){
//   return 'Hello Everyone';
// }

String greetEveryone() => 'Hello Everyone';

// int addTwoNumbers (int a, int b){
//   return a+b;
// }

int addTwoNumbers (int a, int b)=> a + b;

int addTwoNumbersOptional ( int a, [int? b]){
b ??= 0;
return a + b;
}

String greetPerson({ required String name, String message= 'Hola, '}){
  return '$message Sebastian';
}