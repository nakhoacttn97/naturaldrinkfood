<?php
class Category extends Db{
    function getCategories(){
        $sql = 'SELECT * FROM Category';
        return $this->getAll($sql);
    }
    function add(array $arr = NULL){
        $sql = 'INSERT INTO Category(name, image, filter) VALUES(:name, :image, REPLACE(LOWER(:name), \' \', \'-\'))';
        $ret = $this->save($sql, $arr);
        return $ret;
    }
    function delete($arr){
        $sql = 'DELETE FROM Category WHERE id = :id';
        $ret = $this->save($sql, $arr);
        return $ret;
    }
}