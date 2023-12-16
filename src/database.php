<?php
$host = "db";
$port = 3306;
$dbname = "local_db";

$user = $pass = "root";

try {
    // DB接続
    $dsn = "mysql:host=$host;port=$port;dbname={$dbname};charset=utf8";
    $pdo =  new PDO($dsn, $user, $pass);

    $stmt = $pdo->prepare("SELECT * FROM test_table");
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($results as $result) {
        echo "<div>id: " . $result["id"] . ", name: " . $result["name"] . "</div>";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$pdo = null;
