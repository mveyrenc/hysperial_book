release: rails db:migrate
js: yarn build
css: bin/rails dartsass:build
web: bundle exec puma -p $PORT -C ./config/puma.rb
