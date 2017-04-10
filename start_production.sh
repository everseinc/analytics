# bin/sh

echo "set up assets"
rake assets:clobber RAILS_ENV=production
rake tmp:create RAILS_ENV=production
rake assets:precompile RAILS_ENV=production

echo "start unicorn server"
unicorn -E production -c config/unicorn.rb