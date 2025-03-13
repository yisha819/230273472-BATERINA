<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Exercise</title>
</head>

<body>

    <?php
    echo "<b>EXERCISE 1</b>";

    $a = 15;
    $b = 7;

    echo "<p>Sum = " . ($a + $b) . "</p>";
    echo "<p>Difference = " . ($a - $b) . "</p>";
    echo "<p>Product = " . ($a * $b) . "</p>";
    echo "<p>Quotient = " . ($a / $b) . "</p>";

    echo "<b><p>EXERCISE 2</p></b>";

    $number = 3;

    // ODD OR EVEN
    if ($number % 2 == 0) {
        echo "Number is even <br>";
    } else {
        echo "Number is odd <br>";
    }

    // POSITIVE, NEGATIVE, ZERO
    if ($number > 0) {
        echo "Number is positive <br>";
    } elseif ($number < 0) {
        echo "Number is negative <br>";
    } else {
        echo "Number is zero <br>";
    }

    echo "<b><p>EXERCISE 3</p></b>";

    // FIZZBUZZ
    for ($i = 1; $i <= 100; $i++) {
        if ($i % 3 == 0 && $i % 5 == 0) {
            echo "FizzBuzz <br>";
        } elseif ($i % 3 == 0) {
            echo "Fizz <br>";
        } elseif ($i % 5 == 0) {
            echo "Buzz <br>";
        }
    }

    echo "<br>";

    // FIBONACCI
    $num1 = 0;
    $num2 = 1;

    echo "<p>Fibonacci:</p>";
    for ($i = 0; $i < 10; $i++) {
        if ($num1 % 2 == 0) {
            echo $num1 . "<br>";
        }

        $next = $num1 + $num2;
        $num1 = $num2;
        $num2 = $next;
    }

    echo "<b><p>EXERCISE 4</p></b>";

    // Greetings
    function greet($name) {
        return "Hello, " . htmlspecialchars($name) . "!";
    }

    echo greet("Ayisha") . "<br>";

    // Calculate square of a number
    function calculate($number) {
        return $number * $number;
    }

    echo "Square of 2 is: " . calculate(2) . "<br>";
    ?>

    <b><p>EXERCISE 5</p></b>

    <!-- HTML form -->
    <form method="post">
        Username: <input type="text" name="username">
        <input type="submit" value="Submit">
    </form>

    <?php
    // Display the submitted text
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = htmlspecialchars($_POST["username"]);
        echo "<p>Your username is: $username</p>";
    }
    ?>

</body>
</html>
