<?php
$footer_tags = file_get_contents('views/partial/footer.php');
$session_sha1 = sha1("blob " .strlen( $footer_tags ). "\0" . $footer_tags);
echo $session_sha1;
die();
