#!/usr/bin/perl

#setup of use cases

#use strict;
#use warnings;
use LWP::UserAgent;
use HTML::Parse;

##########################

$site = @ARGV[0];
$filetype = @ARGV[1];

$searchurl = "https://www.google.com/?gws_rd=sslq=network+map+pdf";
$useragent = new LWP::UserAgent;
$useragent->agent('Mozilla/4.0 (compatible; MSIE 5.0; Windows 95)');

$request = HTTP::Request->new('GET');
$request->url($searchurl);
$response = $useragent->request($request);
$body = $response->content;

$parsed = HTML::Parse::parse_html($body);
for (@{ $parsed->extract_links(qw(a)) }) {
  ($link) = @$_;
  if ($link =~ m/url/){
  print $link . "\n";
  }
} 
