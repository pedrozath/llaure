export $(heroku config --shell)
unset DATABASE_URL
foreman start -p 5000