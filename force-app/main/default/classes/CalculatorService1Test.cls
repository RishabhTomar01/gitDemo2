@isTest
public class CalculatorService1Test {

    static Integer x = 6;
    static Integer y = 3;

    // This testmethod is used to test the addition callout scenario
    @isTest
    public static void testAddCallout() {
        // Setting up the mock class with the correct mode
		Test.setMock(WebServiceMock.class, new CalculatorService1Mock(CalculatorService1Mock.ADD_MODE));
        CalculatorService1.CalculatorSoap calculator = new  CalculatorService1.CalculatorSoap();
        Integer result = calculator.Add(x,y);
        Integer expectedResult = x + y;
        System.assertEquals(expectedResult, result, 'Addition result should be '+expectedResult);
    }

    // This testmethod is used to test the subtraction callout scenario
    @isTest
    public static void testSubtractCallout() {
		Test.setMock(WebServiceMock.class, new CalculatorService1Mock(CalculatorService1Mock.SUB_MODE));
        CalculatorService1.CalculatorSoap calculator = new  CalculatorService1.CalculatorSoap();
        Integer result = calculator.Subtract(x,y);
        Integer expectedResult = x - y;
        System.assertEquals(expectedResult, result, 'Subtraction result should be '+expectedResult);
    }

    // This testmethod is used to test the multiplication callout scenario
    @isTest
    public static void testMultiplyCallout() {
		Test.setMock(WebServiceMock.class, new CalculatorService1Mock(CalculatorService1Mock.MUL_MODE));
        CalculatorService1.CalculatorSoap calculator = new  CalculatorService1.CalculatorSoap();
        Integer result = calculator.Multiply(x,y);
        Integer expectedResult = x * y;
        System.assertEquals(expectedResult, result, 'Multiplication result should be '+expectedResult);
    }

    // This testmethod is used to test the division callout scenario
    @isTest
    public static void testDivideCallout() {
		Test.setMock(WebServiceMock.class, new CalculatorService1Mock(CalculatorService1Mock.DIV_MODE));
        CalculatorService1.CalculatorSoap calculator = new  CalculatorService1.CalculatorSoap();
        Integer result = calculator.Divide(x,y);
        Integer expectedResult = x / y;
        System.assertEquals(expectedResult, result, 'Division result should be '+expectedResult);
    }
}