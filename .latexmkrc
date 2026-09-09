# Direct all build artifacts to build directory
$out_dir = 'build';

# Generate glossaries when a .glo file is produced
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name) = @_;
    my ($dir, $name) = $base_name =~ m{^(?:(.*)[/])?([^/]+)$};
    if ($dir) {
        return system('makeglossaries', '-d', $dir, $name);
    }
    if ($out_dir) {
        return system('makeglossaries', '-d', $out_dir, $base_name);
    }
    return system('makeglossaries', $base_name);
}

$clean_ext .= ' acr acn alg glg glo gls ist';
