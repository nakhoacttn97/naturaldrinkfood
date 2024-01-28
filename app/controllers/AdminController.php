<?php
class AdminController extends BaseController{
    private $member;
    private $adminModel;

    function __construct(){
        //$this->adminModel = $this->model('Admin');
    }

    function index(){
        //return $this->view('admin/login', []);
        return $this->view('admin/dashboard', []);
    }
}