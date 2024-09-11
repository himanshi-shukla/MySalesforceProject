public class SI {
    //SI class to calculate Simple Interest
    
    Integer principle, rate, interestTime;
    
    public void calculateSI(){
        principle = 1000;
        rate = 6;
        interestTime = 3;
        
        
       Integer result = (principle* rate * interestTime)/100;
        System.debug('Simple Interest is' + result);
        
    }

}

/*
 * SI simple = new SI();
simple.calculateSI();

Circle result = new Circle(3);
result.area();
result.circumference();

Square s = new Square(10);
Double a = s.areaOfSquare();
System.debug('Area is' + a);*/