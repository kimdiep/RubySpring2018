require 'pony'
Pony.options = { :via => 'smtp', :via_options => {
:address => 'smtp.mailgun.org', :port => '587', :enable_starttls_auto => true, :authentication => :plain,
# This is the Default SMTP Login from earlier:
:user_name => 'postmaster@sandbox776e9ed2035c46a8a73dcf3bfb71a4ac.mailgun.org', # This is your Default Password:
:password => '92416027b29c8414270a987c3ad7e12f-833f99c3-048d3540'
} }

message={
  :from=>'shwetzpatil@gmail.com',
  :to=>'shwetzpatil@gmail.com',
  :subject=>'Welcome!',
  :body=>'Thanks	for	signing	up	to	our	awesome	newsletter!'}
  Pony.mail(message)