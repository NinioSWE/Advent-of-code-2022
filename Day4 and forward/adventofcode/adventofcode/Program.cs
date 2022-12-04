class Day4
{

    public bool IsFullyContained(int startIndex1, int endIndex1, int startIndex2, int endIndex2)
    {
        return (startIndex1 <= startIndex2 && endIndex1 >= endIndex2) || (startIndex2 <= startIndex1 && endIndex2 >= endIndex1);
    }


    public bool Colliding(int startIndex1, int endIndex1, int startIndex2, int endIndex2)
    {
        return (startIndex1 <= endIndex2 && endIndex1 >= startIndex2);
    }

    public Day4()
    {
        var allLines = File.ReadAllLines("input.txt");
        var sum = 0;
        var sum2 = 0;

        foreach (var line in allLines)
        {
            var groups = line.Split(",");
            var group1 = groups[0];
            var group2 = groups[1];

            var indexes1 = group1.Split("-");
            var startIndex1 = int.Parse(indexes1[0]);
            var endIndex1 = int.Parse(indexes1[1]);

            var indexes2 = group2.Split("-");
            var startIndex2 = int.Parse(indexes2[0]);
            var endIndex2 = int.Parse(indexes2[1]);
            if (IsFullyContained(startIndex1, endIndex1, startIndex2, endIndex2))
            {
                sum++;
            }
            if(Colliding(startIndex1, endIndex1, startIndex2, endIndex2))
            {
                sum2++;
            }
        }

        Console.WriteLine($"first answer: {sum}");
        Console.WriteLine($"second answer: {sum2}");
    }
    public static void Main()
    {
        new Day4();
    }
}
