void main() {

final pokemon=<String, dynamic>{
  'name' : 'Ditto',
  'hp' : 100,
  'isAlive' : true,
  'habilities' : <String>['impostor'], 
  'sprites' : <int, String>{
    1:'ditto/front.png',
    2:'ditto/back.png'
  },
};

print(pokemon);
print('Name: ${ pokemon['name'] }');

  
  print('Back: ${ pokemon['sprites'][2] }');
  print('Front: ${ pokemon['sprites'][1] }');
}