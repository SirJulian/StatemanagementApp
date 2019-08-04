class HttpExcepetion implements Exception {
 final String message;

 HttpExcepetion(this.message);

 @override
 String toString(){
   return message;
 }
}

