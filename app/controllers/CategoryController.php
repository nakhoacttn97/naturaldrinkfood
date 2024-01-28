<?php
class CategoryController extends BaseController{
    protected $cat;
    protected $params;
    function __construct(){
        $this->cat = $this->model('Category');
    }
    function index(){
        $arr = $this->cat->getCategories();
        return $this->view('category/index', ['arr' => $arr]);
    }

    // Function add ==> Failed
    function add(){
        if(isset($_POST['name'])){
            $_POST['image'] = upload('f', 'images');
            $data['name'] = $this->validate(['name' => 'required']);
            if($data !=  NULL){
                $ret = $this->cat->add($_POST);
                if($ret > 0){
                    return redirect('category/index');
                }
            }
        }
        return $this->view('category/add', []);
    }
    function delete(){
        $this->params['id'] = array_splice($_SERVER['REQUEST_URI'], 3);
        var_dump($this->params);
        $arr = $this->cat->delete($this->params);
        return $this->view('category/index', ['arr' => $arr]);
    }
}