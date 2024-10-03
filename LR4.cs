using System;
using System.Text;
class Program
{
    static void Main()
    {
        Console.InputEncoding = Encoding.UTF8;
        Console.OutputEncoding = Encoding.UTF8;

        // Вхідні дані
        double[,] matrix = new double[,] { { -5, -10, -18, -25 }, { -8, -7, -8, -23 }, { -21, -18, -12, -21 }, { -30, -22, -19, -15 } };
        double[] probabilities = new double[] { 0.25, 0.25, 0.25, 0.25 };
        double[] probabilities2 = new double[] { 0.15, 0.35, 0.4, 0.1 };
        double[] probabilities3 = new double[] { 0.1, 0.2, 0.3, 0.4 };
        double[] probabilities4 = new double[] { 0.4, 0.3, 0.2, 0.1 };

        // Перевірка вхідних даних
        if (matrix.GetLength(1) != probabilities.Length)
        {
            Console.WriteLine("Кількість станів не співпадає з кількістю ймовірностей.");
            return;
        }

        Console.WriteLine("     MM-creterion");
        // Обчислення мінімального значення для кожного рядка
        Console.WriteLine("Результат оцінювальної функції:");
        double[] minValues = new double[matrix.GetLength(0)];
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            minValues[i] = matrix[i, 0];
            for (int j = 1; j < matrix.GetLength(1); j++)
            {
                if (matrix[i, j] < minValues[i])
                {
                    minValues[i] = matrix[i, j];
                }
            }
            Console.WriteLine($"  E{i + 1}: {minValues[i]}");
        }

        // Знаходження рядка з найбільшим мінімальним значенням
        int bestDecis = 0;
        for (int i = 1; i < minValues.Length; i++)
        {
            if (minValues[i] > minValues[bestDecis])
            {
                bestDecis = i;
            }
        }

        Console.WriteLine($"Найкраще рішення за мінімаксним критерієм: E{bestDecis + 1}");

        Console.WriteLine("     S-creterion");

        // Обчислення максимального значення для кожного стовпця
        double[] maxValues = new double[matrix.GetLength(1)];
        for (int j = 0; j < matrix.GetLength(1); j++)
        {
            maxValues[j] = matrix[0, j];
            for (int i = 1; i < matrix.GetLength(0); i++)
            {
                if (matrix[i, j] > maxValues[j])
                {
                    maxValues[j] = matrix[i, j];
                }
            }
        }
        Console.WriteLine("Результат оцінювальної функції:");
        // Обчислення "жалку" (типу, залишку) для кожного рядка
        double[] regrets = new double[matrix.GetLength(0)];
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            regrets[i] = maxValues[0] - matrix[i, 0];
            for (int j = 1; j < matrix.GetLength(1); j++)
            {
                double regret = maxValues[j] - matrix[i, j];
                if (regret > regrets[i])
                {
                    regrets[i] = regret;
                }
            }
            Console.WriteLine($"  E{i + 1}: {regrets[i]}");
        }

        // знаходження рядка з найменшим максимальним "жалком"
        int bestDec = 0;
        for (int i = 1; i < regrets.Length; i++)
        {
            if (regrets[i] < regrets[bestDec])
            {
                bestDec = i;
            }
        }

        Console.WriteLine($"Найкраще рішення за критерієм Саведжа: E{bestDec + 1}");


        Console.WriteLine("     BL-creterion");

        // Обчислення середнього важеного значення для кожного рядка
        double[] averages = new double[matrix.GetLength(0)];
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                averages[i] += matrix[i, j] * probabilities[j];
            }
        }

        // Знаходження рядка з найбільшим середнім важеним значенням
        int bestDecision = 0;
        for (int i = 1; i < averages.Length; i++)
        {
            if (averages[i] > averages[bestDecision])
            {
                bestDecision = i;
            }
        }

        // Виведення результатів в консоль
        Console.WriteLine("Результат оцінювальної функції (за РІВНОМІРНИМ законом розподілу ймовірностей):");
        for (int i = 0; i < averages.Length; i++)
        {
            Console.WriteLine($"  E{i + 1}: {averages[i]:N2}");
        }

        Console.WriteLine($"Найкраще рішення за критерієм Байєса-Лапласа: E{bestDecision + 1}");

        if (matrix.GetLength(1) != probabilities2.Length)
        {
            Console.WriteLine("Кількість станів природи не співпадає з кількістю ймовірностей.");
            return;
        }

        // Обчислення середнього важеного значення для кожного рядка
        double[] averages2 = new double[matrix.GetLength(0)];
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                averages2[i] += matrix[i, j] * probabilities2[j];
            }
        }

        // Знаходження рядка з найбільшим середнім важеним значенням
        int bestDecision2 = 0;
        for (int i = 1; i < averages2.Length; i++)
        {
            if (averages2[i] > averages2[bestDecision2])
            {
                bestDecision2 = i;
            }
        }
        Console.WriteLine(" ");
        // Виведення результатів в консоль
        Console.WriteLine("Результат оцінювальної функції(за НОРМАЛЬНИМ законом розподілу ймовірностей):");
        for (int i = 0; i < averages2.Length; i++)
        {
            Console.WriteLine($"  E{i + 1}: {averages2[i]:N2}");
        }

        Console.WriteLine($"Найкраще рішення за критерієм Байєса-Лапласа: E{bestDecision2 + 1}");

        if (matrix.GetLength(1) != probabilities3.Length)
        {
            Console.WriteLine("Кількість станів природи не співпадає з кількістю ймовірностей.");
            return;
        }

        // Обчислення середнього важеного значення для кожного рядка
        double[] averages3 = new double[matrix.GetLength(0)];
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                averages3[i] += matrix[i, j] * probabilities3[j];
            }
        }

        // Знаходження рядка з найбільшим середнім важеним значенням
        int bestDecision3 = 0;
        for (int i = 1; i < averages3.Length; i++)
        {
            if (averages3[i] > averages3[bestDecision3])
            {
                bestDecision3 = i;
            }
        }
        Console.WriteLine(" ");
        // Виведення результатів в консоль
        Console.WriteLine("Результат оцінювальної функції (за ЕКСПОНЕНЦІАЛЬНИМ законом розподілу ймовірностей):");
        for (int i = 0; i < averages3.Length; i++)
        {
            Console.WriteLine($"  E{i + 1}: {averages3[i]:N2}");
        }

        Console.WriteLine($"Найкраще рішення за критерієм Байєса-Лапласа: E{bestDecision3 + 1}");

        if (matrix.GetLength(1) != probabilities4.Length)
        {
            Console.WriteLine("Кількість станів природи не співпадає з кількістю ймовірностей.");
            return;
        }

        // Обчислення середнього важеного значення для кожного рядка
        double[] averages4 = new double[matrix.GetLength(0)];
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                averages4[i] += matrix[i, j] * probabilities4[j];
            }
        }

        // Знаходження рядка з найбільшим середнім важеним значенням
        int bestDecision4 = 0;
        for (int i = 1; i < averages4.Length; i++)
        {
            if (averages4[i] > averages4[bestDecision4])
            {
                bestDecision4 = i;
            }
        }
        Console.WriteLine(" ");
        // Виведення результатів в консоль
        Console.WriteLine("Результат оцінювальної функції (за ПУАССОНІВСЬКИМ законом розподілу ймовірностей):");
        for (int i = 0; i < averages4.Length; i++)
        {
            Console.WriteLine($"  E{i + 1}: {averages4[i]:N2}");
        }

        Console.WriteLine($"Найкраще рішення за критерієм Байєса-Лапласа: E{bestDecision4 + 1}");
    }
}
