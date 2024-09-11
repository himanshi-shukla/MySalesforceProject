public class Circle {
    Decimal radius;
    
    //constructor
    public Circle( Decimal r){
        this.radius = r;
    }
    
    //area
    public void area(){
        Decimal a = 3.14 * radius * radius;
        System.debug(' the Area is : ' + a);
        
    }

    //circumference
    public void circumference(){
        Decimal c = 3.14 * radius * 2;
        System.debug('The circumference is: ' + c);
       
    }
}