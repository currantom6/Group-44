package uts.isd.model;

/**
 * 
 * @author George
 * 
 * This is a simple calculator class to be used for testing purposes
 * JUnit tests defined in the class unit.test.CalculatorTest will verify the functions automatically
 */
public class Calculator {
    
  public int add(int a, int b){
      return a+b;
  }  
  public int subtract(int a, int b){
    return a-b;
  }
  public int mul(int a, int b){
      return a*b;
  }
  public double power(int a, int b){
      return Math.pow(a,b);
  }
  public int evaluate(String expression) {
    int sum = 0;
    for (String summand: expression.split("\\+"))
      sum += Integer.valueOf(summand);
    return sum;
  }
}