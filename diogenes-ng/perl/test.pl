#!/usr/bin/perl -w
use strict;
use Diogenes::Base;
use Diogenes::Search;
use Diogenes::Indexed;

my $q = new Diogenes::Indexed(-type=>"tlg");
# $q->read_index("baala");
# print join "--", $q->get_word_info("BAALA");
# $q->do_search("BAALA");


# 2--296--362
$q->{word_list}{"BAALA"} = [2, 296, 362]; 
$q->do_search("BAALA");


# my $q = new Diogenes::Search(-type=>"phi", -pattern=>"scyr");
# $q->check_db;
# $q->do_search();
