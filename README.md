# Nginx HTTP/2 + SSL. And More..

1 . **Install.**

   $. **``wget https://raw.githubusercontent.com/hitechlinux/nginx-http2-ssl/master/install.sh``**
   
   $. **`` chmod +x install.sh``**
   
   $. **``./install.sh``**
   
   You'll Be Asked For Domain Name. Wrote One Domain "example.com" or subdomain "sub.example.com" 
   If your domain is running on your server ip directly u'r OK. If not then Let's Encrypt Will Fail!.
   So Before To Start Make Sure You Have Point Your Domain On Server IP.
   

2 . After Installation.

  $. **``cd /etc/nginx; mv nginx.conf nginx.old.cf``**
  
  $. **``wget https://raw.githubusercontent.com/hitechlinux/nginx-http2-ssl/master/nginx.conf``**
  
  $. **``cd rules; wget https://raw.githubusercontent.com/hitechlinux/nginx-http2-ssl/master/rules/bad_agent.conf``**
  
  $. **``wget https://raw.githubusercontent.com/hitechlinux/nginx-http2-ssl/master/rules/banned.conf``**
  
  $. **``cd /etc/nginx/live; wget https://raw.githubusercontent.com/hitechlinux/nginx-http2-ssl/master/live/default.conf``**
  
  $. **`` nginx -t; service nginx restart``**
  
  // If Everything it's ok then follow other steps.
  
  $. **``cd /etc/nginx/live``**
  
  $. **``wget https://raw.githubusercontent.com/hitechlinux/nginx-http2-ssl/master/live/example.com.conf``**
  
  $. **``mv example.com.conf yourdomain.com.conf``**
  
  Now open yourdomain.com.conf replace "**24HRadio.net**" With Your Domain Name!
  
  Add More Then 1 Domain?!
  
  $. **``cd ~/letsencrypt; service nginx stop; service apache2 stop``**
  
  $. **``./letsencrypt-auto certonly --standalone -d newdomain.com``**
  
  $. **``cd /etc/nginx/live; cp yourdomain.com.conf newdomain.com.conf``**
  
  $. **``nano newdomain.com.conf``**
  
  Replace YourDomain.com/net with your new domain. (read careful there isn't just 1 line with that domain name) then
  
  $. **``mkdir -p /hostdata/newdomain.com/public_html``**
  
  $. **``nginx -t``**
  
  $. **``service nginx start``**
  
  You can test your website here https://tools.keycdn.com/http2-test
