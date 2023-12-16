<?php
mb_language("Japanese");
mb_internal_encoding("UTF-8");

$mail_to = "tomail@example.com";
$subject = "メールタイトル" . "\n";
$return_mail = "test@example.com";
$headers = ['From' => 'メール<info@example.com>'];
$headers = $headers
    . "MIME-Version: 1.0\r\n"
    . "Content-Transfer-Encoding: 8bit\r\n"
    . "Content-Type: text/html; charset=UTF-8\r\n";
$message = <<<EOF

    <!DOCTYPE html>
    <html lang="ja">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <h1>Hello</h1>
        <h2>こんにちは</h2>
        <h3>コンニチハ</h3>
        <h4>ｺﾝﾆﾁﾊ</h4>
    </body>
    </html>

EOF;

if (mb_send_mail($mail_to, $subject, $message, $headers, "-f" . $return_mail)) {
    echo "succeeded";
} else {
    echo "succeeded";
};

echo "<br>";
?>

<a href="http://localhost:8025">MailHog</a>