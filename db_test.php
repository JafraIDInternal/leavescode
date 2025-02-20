<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=jorani;charset=utf8', 'ELY2024', '_37DO&#*0O(-Fk)');
    echo "✅ Database connection successful!";
} catch (PDOException $e) {
    echo "❌ Database connection failed: " . $e->getMessage();
}
?>

