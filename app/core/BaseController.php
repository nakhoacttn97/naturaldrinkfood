<?php
abstract class BaseController{
    protected $pathView;
    protected $title = "Drink Food";
    protected array $data;
    protected string $viewName;
    protected $errors;
    protected function model($model){
        require_once("app/models/".$model.".php");
        return new $model();
    }
    protected function view($pathView, array $data = NULL, string $name = NULL){
        $this->data = $data;
        if($this->data != NULL){
            extract($this->data);
        }
        //var_dump($pathView);
        require_once("app/views/".$pathView.".php");
    }
    protected function validate(array $rules){
        foreach($_POST as $k => $v){
            $_POST[$k] = trim($_POST[$k]);
            if($_POST[$k] == ''){
                $_POST[$k] = NULL;
            }
        }
        $errs = array();
        foreach($rules as $k => $v){
            if($v == 'required'){
                if($_POST[$k] == NULL){
                    $errs[] = "Please input {$k}";
                }
            }
        }
        if(count($errs)){
            $this->errors = $errs;
            return NULL;
        }
        return $_POST;
    }
}
?>

