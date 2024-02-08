public class ExcludeDivisibleByNine 
{
    public static void notDivisibleByNine() 
    
    {
        List<Integer> result = new List<Integer>();
        
        for (Integer i = 1; i <= 100; i++) 
        {
            if (Math.mod(i, 9) != 0) 
            {
                result.add(i);
            }
        }

        return result;
    }

    