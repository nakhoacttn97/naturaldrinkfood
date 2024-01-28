<?php
class Db{
    private $pdo;
    private $host = DB_HOST;
    private $dbname = DB_NAME;
    private $user = DB_USER;
    private $pass = DB_PASS;

    function __construct(){
        $connect = 'mysql:dbname='.$this->dbname.';host='.$this->host.';charset=utf8';
        $this->pdo = new PDO($connect, $this->user, $this->pass);
    }
    // method for SELECT return ALL ROWS
    protected function getAll($sql, $params = NULL){
        $arr = NULL;
        if($params == NULL){
            $stmt = $this->pdo->query($sql);
            if($stmt){
                $arr = $stmt->fetchAll(PDO::FETCH_ASSOC);
            }
            $stmt->closeCursor();
        }else{
            $stmt = $this->pdo->prepare($sql);
            if($stmt){
                $stmt->execute($params);
                if($stmt->rowCount() > 0){
                    $arr = $stmt->fetchAll(PDO::FETCH_ASSOC);
                }
                $stmt->closeCursor();
            }
        }
        return $arr;
    }
    // method for INSERT UPDATE DELETE
    protected function save($sql, $params){
        $stmt = $this->pdo->prepare($sql);
        $ret = 0;
        if($stmt){
            if($stmt->execute($params)){
                $ret = $stmt->rowCount();
            }
            $stmt->closeCursor();
        }
        return $ret;
    }
}