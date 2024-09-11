public class Square {
    
    Double side;
    
    //constructor 
    
    public  Square( Double s){
        this.side = s;
    }
    
    // Area
    
    public Double SquareArea(){
        Double a = side * side;
        return a;
    }
    
    
    //perimeter
    //
    public  Double perimeterOfSquare(){
        Double p = 4 * side;
  return p;
    }
}