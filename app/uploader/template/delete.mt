<?= $app->render('system/header') ?>

<h2>削除しますよ?</h2>

<img src="<?= $app->root_uri . '/app/uploader/files/' . $c->{file} ?>" width="300">

<?= $app->render_form ?>

<a href="<?= $app->uri_for('uploader/') ?>">戻る</a>

<?= $app->render('system/footer') ?>
