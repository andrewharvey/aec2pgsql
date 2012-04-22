#!/usr/bin/perl -w

use strict;
use Text::CSV;
use Test::Simple tests => 610;

die "Usage: $0 <year>" if (@ARGV < 1);
my $year = $ARGV[0];

for my $room (qw/House Senate/) {
  for my $dataset (qw/Informal_Votes Turnout Votes/) {
    my $dataset_path = "$year/$room/$dataset.csv";
    print "$dataset_path\n";
    my $csv = Text::CSV->new();
    open (my $src_file, '<', "$dataset_path") or die $!;
    
    my $header = readline($src_file);
    # 6 tests
    ok($header =~ /^$year Federal Election $room/);

    my @column_names = $csv->column_names($csv->getline($src_file));

    # 4 tests
    ok(@column_names = qw/DivisionID DivisionNm StateAb FormalVotes InformalVotes TotalVotes InformalPercent/) if (($dataset eq "Informal_Votes") && ($room eq "House"));
    ok(@column_names = qw/DivisionID DivisionNm StateAb Enrolment Turnout TurnoutPercentage/) if (($dataset eq "Turnout") && ($room eq "House"));
    ok(@column_names = qw/DivisionID DivisionNm StateAb Enrolment OrdinaryVotes AbsentVotes ProvisionalVotes PrePollVotes PostalVotes TotalVotes TotalPercentage/) if ($dataset eq "Votes");
    
    # 150 * 4 tests
    my $row_count = 0;
    while (my $row = $csv->getline_hr($src_file)) {
      if ($dataset eq "Informal_Votes") {
        ok($row->{"TotalVotes"} == $row->{"FormalVotes"} + $row->{"InformalVotes"});
      }

      if ($dataset eq "Turnout") {
      }

      if ($dataset eq "Votes") {
        ok($row->{"TotalVotes"} == $row->{"OrdinaryVotes"} + $row->{"AbsentVotes"} + $row->{"ProvisionalVotes"} + $row->{"PrePollVotes"} + $row->{"PostalVotes"});
      }

      $row_count++;
    }

    close ($src_file) or warn $!;

    print " all $row_count rows passed.\n";
  }
}
