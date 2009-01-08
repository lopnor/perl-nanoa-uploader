package uploader::start;

use strict;
use warnings;
use utf8;

use base qw(NanoA);

use plugin::form;
use plugin::admin;
use File::Basename;

BEGIN {
    $CGI::Simple::POST_MAX = 1_048_576;
    $CGI::Simple::DISABLE_UPLOADS = 0;
};

define_form(
    fields => [
        file => {
            type => 'file',
            label => 'ファイル',
            required => 1,
            mime => 'image\/jpeg'
        },
        ],
    submit_label => 'アップロード',
);
sub run {
    my $app = shift;
    my $q = $app->query;
    if ($q->request_method eq 'POST' && $app->validate_form) {
        my $filename = $q->param('file');
        my ($ext) = $filename =~ m{(\..*?)$};
        my $file = NanoA::app_dir().'/uploader/files/'.time().lc($ext);
        my $ok = $q->upload($q->param('file'), $file);
        $app->redirect;
    }
    $app->render('uploader/template/start');
}

1
