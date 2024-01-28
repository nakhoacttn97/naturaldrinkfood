<?php
class App
{
    protected $url;
    protected $controller;
    protected $controllerName = "HomeController";
    protected $action = "index";
    protected $params = NULL;
    public $controllerPath = "app/controllers/";
    
    function __construct()
    {
        $this->urlProcess();
        $this->loadController();
        $this->callMethod();
    }
    
    protected function urlProcess()
    {
        if (isset($_SERVER['PATH_INFO'])) {
            $this->url = $_SERVER['PATH_INFO'];
        } else {
            $this->url = NULL;
        }

        if ($this->url != NULL) {
            $this->url = explode("/", trim($_SERVER['PATH_INFO'], '/'));
        } else {
            unset($this->url);
        }

        /*  Turn on PATH_INFO
        sudo nano /etc/apache2/sites-available/000-default.conf
        <VirtualHost *:80>
            ...
            AcceptPathInfo On
            ... 
        </VirtualHost>

        */
        // echo "<pre>";
        // print_r($this->url);
        // echo "</pre>";
    }

    protected function loadController()
    {
        if (isset($this->url[0])) {
            $this->controllerName = ucfirst($this->url[0])."Controller";
            $fileName = $this->controllerPath . $this->controllerName . ".php";
            if (file_exists($fileName)) {
                include_once $fileName;
                if (class_exists($this->controllerName)) {
                    $this->controller = new $this->controllerName();
                }
            }
        } else {
            // reuqire url default
            include_once $this->controllerPath . $this->controllerName . ".php";
            $this->controller = new $this->controllerName();
        }
    }

    protected function callMethod()
    {
        // TH1 exists url[1] va url[2]
        if (isset($this->url[2])) {
            $this->action = $this->url[1];
            if (method_exists($this->controller, $this->action)) {
                $this->params = array_splice($this->url, 2);
                $this->controller->{$this->action}($this->params);  // call function inside controller
            } else {
                //header("Location:")
                echo "Not found";
            }
        } else {
            // TH2 chi ton tai url[1], not url[2]
            if (isset($this->url[1])) {
                $this->action = $this->url[1];
                if (method_exists($this->controller, $this->action)) {
                    $this->controller->{$this->action}();
                } else {
                    echo "Not found";
                }
            } else {
                // TH3 khong ton tai ca url[1] & url[2], su dung method default
                if (method_exists($this->controller, $this->action)) {
                    $this->controller->{$this->action}();
                } else {
                    echo "Not found";
                }
            }
        }
    }
}
