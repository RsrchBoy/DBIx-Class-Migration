package DBIx::Class::Migration::TempDirSandboxBuilder;

use Moose;
use File::Temp 'tempdir';

has migration => (
  is => 'ro',
  weak_ref => 1,
  required => 1);

sub build {
  my $migration = shift->migration;
  return $migration->db_sandbox_class
    ->new(target_dir=>tempdir(CLEANUP=>1),
     schema_class=>$migration->_infer_schema_class);
}

__PACKAGE__->meta->make_immutable;

=head1 NAME

DBIx::Class::Migration::TempDirSandboxBuilder - Build a sandbox in a temporary directory

=head1 SYNOPSIS

    use DBIx::Class::Migration::TempDirSandboxBuilder;

=head1 DESCRIPTION

Helper class that creates a C<db_sandbox> in the temporary directory, and then
deletes the directory when the migration object goes out of scope.  You might
wish to use this for testing.

=head1 SEE ALSO

L<DBIx::Class::Migration>.

=head1 AUTHOR

See L<DBIx::Class::Migration> for author information

=head1 COPYRIGHT & LICENSE

See L<DBIx::Class::Migration> for copyright and license information

=cut


