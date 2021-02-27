

class DomainLayerException implements Exception {
  String cause; 

  DomainLayerException(this.cause);

  @override 
  String toString(){
    return cause;
  }

}