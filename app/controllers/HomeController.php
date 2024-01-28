<?php
class HomeController extends BaseController{
    protected $home;
    function __construct(){
        $this->home = $this->model('Category');
    }
    function index(){
        return $this->view('home/index', []);
    }
}