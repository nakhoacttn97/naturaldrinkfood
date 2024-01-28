<?php require_once ROOT . "/app/views/shared/headerAd.php" ?>
<form action="" method="POST" enctype="multipart/form-data"> 
    <div>
        <label for="">Image</label>
        <input type="file" name="f" accept="image/*">
    </div>
    <div>
        <label for="">Name</label>
        <input type="text" name="name">
    </div>
    <div>
        <button>Save Change</button>
    </div>
</form>
<?php require_once ROOT . "/app/views/shared/footerAd.php" ?>