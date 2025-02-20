<?php

if (isset($_POST['status']) && ($_POST['status'] == "Submitted" || $_POST['status'] == "Approved" || $_POST['status'] == "Paid" || $_POST['status'] == "Rejected" )) {
    $status = $_POST['status'];
    $recepient = "";
    $nomor_booking = $_POST['number'];
    $email = "";
    $name = "";
    $content = "";
    $content1 = "";
    $url = "";
    $subject = "Booking Progress $nomor_booking ";
    $subjects = "Booking $nomor_booking has been $status";

    switch ($status) {
        case "Submitted" :
            $content1 = "Kamu memiliki booking yang perlu kamu setujui. ";
            $recepient = "uid = " . $_POST['validator'];
            break;
        case "Approved" :
            $content1 = "Kamu memiliki booking yang siap untuk kamu bayar. ";
            $recepient = "authority = 'payment'";
            break;
        case "Paid" :
            $content1 = "Kamu memiliki booking yang perlu kamu tutup, karena booking yang kamu ajukan sudah dibayar. ";
            $recepient = "uid = " . $_POST['creator'];
            break;
        case "Rejected" :
            $content1 = "Kamu memiliki booking yang perlu kamu tinjau, karena booking yang kamu ajukan ditolak. ";
            $recepient = "uid = " . $_POST['creator'];
            break;
    }
    $link = mysqli_connect('localhost', 'root', 'Basori12', 'jafradb', '3306');
    $sql1 = "SELECT * FROM token ORDER BY RAND() LIMIT 1";
    $result1 = mysqli_query($link, $sql1);
    while ($row1 = mysqli_fetch_assoc($result1)) {
        $token = $row1['value'];
    }
    $url = "https://mbasori.ap.jafraint.com:83/?id=" . $_POST['id_data'] . "&token=" . $token;

    $sql = "SELECT * FROM users WHERE $recepient";
    $result = mysqli_query($link, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $name = $row['fullname'];
        $email = $row['email_address'];
    }

    $pembukaan = "Anda menerima pesan ini karena $email dicantumkan sebagai email untuk menerima notifikasi JafraDB. ";
    $salam = "Hai $name!<br>";
    $isi = $content1 . "<br><br> Kamu dapat membuka <a href='" . $url . "'>link ini</a> untuk melihat booking tersebut. <br> ";
    $penutup = "Tim Firebricss";
    $content = '<table width="100%" height="100%" style="min-width:348px" border="0" cellspacing="0" cellpadding="0"><tbody><tr height="32px"></tr><tr align="center"><td width="32px"></td><td><table border="0" cellspacing="0" cellpadding="0" style="max-width:600px"><tbody><tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td align="left"><img width="92" height="32" src="https://dyt7354sr16hm.cloudfront.net/global/media/images/logo.png" style="display:block;width:130px;height:50px" class="CToWUd"></td><td align="right"><img width="32" height="32" style="display:block;width:32px;height:32px" src="https://ci3.googleusercontent.com/proxy/M66ZNacPlHAzr1syxHojC07BuO63gs0WeUx82IAyCm74zrziOOWb2InfAWL4PI5pkUNG4LG2jaZGZZ-l8d1ogxMxKRf7zQXAhtGygw=s0-d-e1-ft#https://www.gstatic.com/accountalerts/email/shield.png" class="CToWUd"></td></tr></tbody></table></td></tr><tr height="16"></tr><tr><td><table bgcolor="#D94235" width="100%" border="0" cellspacing="0" cellpadding="0" style="min-width:332px;max-width:600px;border:1px solid #f0f0f0;border-bottom:0;border-top-left-radius:3px;border-top-right-radius:3px"><tbody><tr><td height="72px" colspan="3"></td></tr><tr><td width="32px"></td><td style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:24px;color:#ffffff;line-height:1.25;min-width:300px">' . $subjects . '</td><td width="32px"></td></tr><tr><td height="18px" colspan="3"></td></tr></tbody></table></td></tr><tr><td><table bgcolor="#FFFFFF" width="100%" border="0" cellspacing="0" cellpadding="0" style="min-width:332px;max-width:600px;border:1px solid #f0f0f0;border-top:0"><tbody><tr><td height="18px" colspan="3"></td></tr><tr><td width="32px"></td><td style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:13px;color:#202020;line-height:1.5">' . $pembukaan . '</td><td width="10px"></td></tr><tr><td height="18px" colspan="3"></td></tr></tbody></table></td></tr><tr><td><table bgcolor="#FAFAFA" width="100%" border="0" cellspacing="0" cellpadding="0" style="min-width:332px;max-width:600px;border:1px solid #f0f0f0;border-bottom:1px solid #c0c0c0;border-top:0;border-bottom-left-radius:3px;border-bottom-right-radius:3px"><tbody><tr height="16px"><td width="32px" rowspan="3"></td><td></td><td width="32px" rowspan="3"></td></tr><tr><td><table style="min-width:300px" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:13px;color:#202020;line-height:1.5;padding-bottom:4px">' . $salam . '</td></tr><tr><td style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:13px;color:#202020;line-height:1.5;padding:4px 0">' . $isi . '</td></tr><tr><td style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:13px;color:#202020;line-height:1.5;padding-top:28px">' . $penutup . '</td></tr><tr height="16px"></tr><tr><td><table style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:12px;color:#b9b9b9;line-height:1.5"><tbody><tr><td>Email ini tidak dapat menerima balasan. </td></tr></tbody></table></td></tr></tbody></table></td></tr><tr height="32px"></tr></tbody></table></td></tr><tr height="16"></tr><tr><td style="max-width:600px;font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#bcbcbc;line-height:1.5"></td></tr><tr><td><table style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#666666;line-height:18px;padding-bottom:10px"><tbody><tr><td>Anda menerima pengumuman layanan email wajib ini agar memperoleh informasi terbaru tentang perubahan penting pada produk atau akun Firebricss Anda.</td></tr><tr height="6px"></tr><tr><td><div style="direction:ltr;text-align:left">&copy; 2017 Firebricss Inc., </div><div style="display:none!important;max-height:0px;max-width:0px">et:1</div></td></tr></tbody></table></td></tr></tbody></table></td><td width="32px"></td></tr><tr height="32px"></tr></tbody></table>';
    ?>


    <?php

    require 'PHPMailer/PHPMailerAutoload.php';

    date_default_timezone_set("Asia/Jakarta");
    $mailsubjek = $subject;

    $mail = new PHPMailer;
//$mail->SMTPDebug = 2;

    $mail->isSMTP();                                   // Set mailer to use SMTP
    $mail->Host = 'smtp.office365.com';                    // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                            // Enable SMTP authentication
    $mail->Username = 'noreply@elysyle.co.id';        // SMTP username
    $mail->Password = 'Jafra@lt1.2023!!';                 // SMTP password
    $mail->SMTPSecure = 'tls';                         // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;                                 // TCP port to connect to
    $mail->setFrom('noreply@elysyle.co.id', 'JafraDB');
//$mail->addReplyTo('noreplyjafra@gmail.com', 'no-reply Jafra');
    $mail->addAddress($email);
//$mail->addCC("");
//$mail->addBCC("mohamad_basori@jafra.co.id");
    $mail->isHTML(true);

    $bodyContent = $content;

    $mail->Subject = $mailsubjek;
    $mail->Body = $bodyContent;

    if (!$mail->send()) {
        $txt = "ERROR:" . Date("Y-m-d h:i:s a") . ' | ' . $mail->ErrorInfo;
        file_put_contents('email.log', $txt, FILE_APPEND | LOCK_EX);
        echo "/r/n" . $txt . " " . $sql;
    } else {
        $txt = "SUCCESS:" . Date("Y-m-d h:i:s a");
        file_put_contents('email.log', $txt, FILE_APPEND | LOCK_EX);
        echo "/r/n" . "email sent to $name ($email) with title $mailsubjek and content $content";
    }
    ?>

    <?php

} else {
    echo "No Need Notif";
}
?>
