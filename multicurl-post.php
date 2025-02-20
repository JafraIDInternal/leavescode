<?php



function readFileToArray($filename) {
    // Check if the file exists
    if (!file_exists($filename)) {
        return false; // File not found
    }

    // Read the file into an array, where each element is a line
    $lines = file($filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

    return $lines;
}



function search_data($text,$pattern)
{




// Regular expression pattern

#echo $text;
// Perform the regex search
if (preg_match($pattern, $text, $matches)) {
    return "True";
} else {
     return "False";
}

}







function fetchUrl($url)
{
	
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    
    // You can add more curl options as needed
    
    $output = curl_exec($ch);
    
    if (curl_errno($ch)) {
        echo 'Curl error: ' . curl_error($ch);
    }
    
    curl_close($ch);

    return $output;
}












function multiCurlPost($urls, $uri, $schema, $postData, $timeout = 30)
{
    $mh = curl_multi_init();
    $handles = [];

    foreach ($urls as $url) {
        $fullUrl = $schema . $url . $uri;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $fullUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        // Set the timeout for the entire request
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);

        // Set the timeout for the connection phase
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        // Set the request method to POST
        curl_setopt($ch, CURLOPT_POST, 1);

        // Set the POST data
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

        // Add more curl options as needed

        curl_multi_add_handle($mh, $ch);
        $handles[$fullUrl] = $ch;
    }

    $active = null;
    do {
        $mrc = curl_multi_exec($mh, $active);
    } while ($mrc == CURLM_CALL_MULTI_PERFORM);

    while ($active && $mrc == CURLM_OK) {
        if (curl_multi_select($mh) != -1) {
            do {
                $mrc = curl_multi_exec($mh, $active);
            } while ($mrc == CURLM_CALL_MULTI_PERFORM);
        }
    }

    $responses = [];
    foreach ($handles as $url => $ch) {
        $response = curl_multi_getcontent($ch);
        //echo $response;
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); // Get HTTP response code

   //     if ($httpCode === 500) {
            // Skip processing for requests with status code 500
     //       continue;
      //  }

        $responses[$url] = ['response' => $response, 'httpCode' => $httpCode];
        curl_multi_remove_handle($mh, $ch);
    }

    curl_multi_close($mh);

    return $responses;
}

















// Example usage:
$schema = $argv[1];
$pattern = $argv[2];

$uri = base64_decode($argv[3]);
$search = "*";
$replace = "'";
$uri = str_replace($search, $replace, $uri);
$post_var = base64_decode($argv[4]);

#$uri=$argv[3];


$currentDirectory = getcwd();
$filename = $currentDirectory."/temp89678.txt";

$url_list = readFileToArray($filename);
#echo $url_list[0];



// Process the responses as needed
$timeout =30;



$postData = $post_var;


$phpCode = '$array = [' . $postData . '];';

eval($phpCode);
//print_r($array);


//$responses = multiCurlPost($url_list,$uri,$schema);


$responses = multiCurlPost($url_list, $uri, $schema, $array, $timeout);
#print $responses;
$i=0;

foreach ($responses as $url => $response) {
   
    $status = search_data($response['response'],$pattern);
    
    echo $url.";".$status.";".$response['httpCode']."\n";
}



?>
