ACCESS_TOKEN ||= ENV["FACEBOOK_ACCESS_TOKEN"]
GROUP_ID ||= ENV["FACEBOOK_GROUP_ID"]
USER_NAME ||= ENV["GMAIL_USER"]
PASSWORD ||= ENV["GMAIL_PASS"]
EMAILS ||= [ENV["GMAIL_EMAIL"]]
SMTP_SETTINGS = {
  address:   ENV["GMAIL_SMTP"],
  port:      587,
  domain:    'smtp.gmail.com',
  authentication: 'cram_md5',
  user_name: USER_NAME,
  password:  PASSWORD
}
