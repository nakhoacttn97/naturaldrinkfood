<?php
spl_autoload_register(function($class){
    include_once("core/".$class.".php");
});

function randomString(int $len){
    $pattern = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $str = '';
    $n = strlen($pattern) -1;
    for($i = 0; $i < $len; $i++){
        $str .= $pattern[random_int(0, $n)];
    }
    return $str;
}

function upload(string $key, string $folder, int $len = 16){
    $fileName = NULL;
    if(isset($_FILES[$key]) && $_FILES[$key]['name'] != ''){
        $ext = pathinfo($_FILES[$key]['name'], PATHINFO_EXTENSION);
        $fileName = randomString($len - strlen($ext) - 1). "." . $ext;
        
        $fileImage = $_FILES[$key]['tmp_name'];
        $pathFile = $folder . "/" . $fileName;

        //var_dump($fileImage);
      
        move_uploaded_file($fileImage, $pathFile);
    }
    return $fileName;
}

function redirect(string $url = '/'){
    return header("location:$url");
}

function convertToValuesArray(array $params) {
    return array_values($params);
}