# Copyright (C) 2009, The Perl Foundation.
# $Id$

class Perl6::Compiler::Parameter;

has $!var_name;
has $!pos_slurpy;
has $!named_slurpy;
has $!optional;
has $!names;
has $!invocant;
has $!multi_invocant;
has $!default;
has $!default_from_outer;
has $!nom_type;
has $!cons_types;
has $!sub_signature;
has $!type_captures;
has $!is_rw;
has $!is_ref;
has $!is_copy;

method var_name($var_name?) {
    if $var_name { $!var_name := $var_name }
    $!var_name
}

method sigil() {
    my $check;
    if $!var_name { $check := pir::substr($!var_name, 0, 1); }
    unless $check eq '$' || $check eq '@' || $check eq '%' || $check eq '&' {
        $check := '';
    }
    $check
}

method twigil() {
    my $check;
    if $!var_name { $check := pir::substr($!var_name, 1, 1); }
    unless $check eq '!' || $check eq '.' || $check eq '*' {
        $check := '';
    }
    $check
}

method pos_slurpy($pos_slurpy?) {
    if $pos_slurpy { $!pos_slurpy := $pos_slurpy }
    $!pos_slurpy
}

method named_slurpy($named_slurpy?) {
    if $named_slurpy { $!named_slurpy := $named_slurpy }
    $!named_slurpy
}

method optional($optional?) {
    if $optional { $!optional := $optional }
    $!optional
}

method names() {
    unless $!names { $!names := PAST::Node.new() }
    $!names
}

method multi_invocant($multi_invocant?) {
    if $multi_invocant { $!multi_invocant := $multi_invocant }
    $!multi_invocant
}

method invocant($invocant?) {
    if $invocant { $!invocant := $invocant }
    $!invocant
}

method default($default?) {
    if $default { $!default := $default }
    $!default
}

method default_from_outer($default_from_outer?) {
    if $default_from_outer { $!default_from_outer := $default_from_outer }
    $!default_from_outer
}

method nom_type($nom_type?) {
    if $nom_type { $!nom_type := $nom_type }
    $!nom_type
}

method cons_types() {
    unless $!cons_types { $!cons_types := PAST::Node.new() }
    $!cons_types
}

method sub_signature($sub_signature?) {
    if pir::defined__IP($sub_signature) { $!sub_signature := $sub_signature }
    $!sub_signature
}

method type_captures() {
    unless $!type_captures { $!type_captures := PAST::Node.new() }
    $!type_captures
}

method is_rw($is_rw?) {
    if $is_rw { $!is_rw := $is_rw }
    $!is_rw
}

method is_ref($is_ref?) {
    if $is_ref { $!is_ref := $is_ref }
    $!is_ref
}

method is_copy($is_copy?) {
    if $is_copy { $!is_copy := $is_copy }
    $!is_copy
}
