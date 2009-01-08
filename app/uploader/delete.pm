package uploader::delete;

use strict;
use warnings;
use utf8;

use base qw(NanoA);

use plugin::form;
use plugin::admin;

sub run {
    my $app = shift;

    $app->redirect($app->uri_for('uplaoder/')) unless $app->is_admin;

    my $file = $app->query->param('file') or $app->redirect($app->uri_for('uploader/'));
    if ($app->query->request_method eq 'POST') {
        my $file = NanoA::app_dir().'/uploader/files/'.$file;
        unlink $file;
        $app->redirect;
    }
    define_form(
        fields => [
        file => {
            type => 'hidden',
            value => $file,
        }
        ],
        submit_label => '削除',
    );
    $app->render('uploader/template/delete', {file => $file});
}

1;
