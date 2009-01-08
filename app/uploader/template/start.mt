<?= $app->render('system/header') ?>

<h2>Simple Uploader</h2>

<?= $app->render_form ?>

? use File::Basename;
? for my $file (reverse <app/uploader/files/*>) {
?   my $basename = basename($file);
?   $file = $app->root_uri . '/' . $file;
<li><a href="<?= $file ?>"><?= $basename ?></a>
? if ($app->is_admin) {
[<a href="<?= $app->uri_for('uploader/delete', {file => $basename} ) ?>">x</a>]
? }
</li>
? }
<hr>
? if ($app->is_admin) {
    <a href="<?= $app->admin_logout_uri ?>">管理者ログアウト</a>
? } else {
    <a href="<?= $app->admin_login_uri ?>">管理者ログイン</a>
? }

<?= $app->render('system/footer') ?>
