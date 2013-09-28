export $(heroku config --shell)
export EMAIL_RECEIVER=pedrozath@gmail.com
unset DATABASE_URL
foreman start -p 3000