 void main() async{
  
  print('Inicio del programa');
  
  try{ 
   final value = await httpGet('https://zetah.dev');
     print (value);
    
  }on Exception {
  print('Tenemos una exepcion');  
  
  }catch(err){
    print('Tenemos un error: $err');
    
  }finally{
     ('Fin del try catch ');
  }
   print('Fin del programa');
}
  


  Future <String> httpGet(String url) async{
    await Future.delayed(const Duration(seconds:1));
    throw Exception('No hay parametros en el URL');

  }
  