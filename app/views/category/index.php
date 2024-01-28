
<div id="layoutSidenav">
    <div>
        <a href="category/add" class="btn btn-primary">Add</a>

        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
            <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <img src="..." class="rounded me-2" alt="...">
                    <strong class="me-auto">Bootstrap</strong>
                    <small>11 mins ago</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <div class="alert alert-success">
                        <p>This is alert if success</p>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Command</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($arr as $v) : ?>
                        <tr>
                            <td><?= $v['id'] ?></td>
                            <td><?= $v['name'] ?></td>
                            <td>Image</td>
                            <td>
                                <a href="category/delete/<?= $v['id'] ?>" class="btn btn-primary del">Delete</a>
                                <a href="category/edit/<?= $v['id'] ?>" class="btn btn-primary">Edit</a>
                            </td>
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</div>