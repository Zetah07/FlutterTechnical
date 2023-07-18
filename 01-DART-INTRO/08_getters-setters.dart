void main (){
  
  final mySquare = Square( side: 10);
  mySquare.side = 5;
  
  print ('area: ${ mySquare.area }');
  
  
  
}

class Square {
  
   double _side;
  
  Square ({ required double side })
    : assert (side >= 0, 'side must be >= 0 '), // colocar aserciones y reglas para que en desarrollo se cumplan las normas establecidas.
      _side = side;
  
  double get area {
    return _side * _side;
  }
  
  set side( double value ){
    print ('setting new value $value');
    if (value <0 ) throw 'Value must be>=0';
    
    _side = value;
  }
  
//   double calculateArea() {
//     return side * side;
//   }
}