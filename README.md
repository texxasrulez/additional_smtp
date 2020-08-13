# Aditional SMTP Users #

**Send Email from an external SMTP account from within Roundcube**  

Supported Webmail Providers "out of the box"  

* gmail.com  
* googlemail.com  
* yahoo.com    
* hotmail.com    
* live.com    
* outlook.com    
* aol.com    
* gmx.com    
* icloud.com    
* yandex.com  
  
If you would like more, just give me the url of the webmail provider and I will add it if able to.  

**Installation**
Easy Way (Recommended)
composer require texxasrulez/additional_smtp
Composer does its thang, puts files where they need to be, injects SQL schema, adds plugin to main RC config.inc.php  
and creates config.inc.php in plugin/additional_smtp directory.  
You just need to edit config.inc.php file if needed to suit your individual needs.

Not as Easy (Old School)
upload files to `/path_to_roundcube/plugins/additional_smtp`  

Import SQL schema to your database.  

Rename `config.inc.php.dist` to `config.inc.php` and edit to suit your needs.  

Enable plugin via config.inc.php with

`$config['plugins'] = array('additional_smtp');`

Enable from Settings - Identities Tab  
Add a new identity with your webmail provided email address, fill in username and password, check that box to enable, save. Done!  

Enjoy!  

:moneybag: **Donations** :moneybag:  

If you use this plugin and would like to show your appreciation by buying me a cup of coffee, I surely would appreciate it.  
A regular cup of Joe is sufficient, but a Starbucks Coffee would be better ...  
Zelle (Zelle is integrated within many major banks Mobile Apps by default) - Just send to texxasrulez at yahoo dot com  
No Zelle in your banks mobile app, no problem, just click [Paypal](https://paypal.me/texxasrulez?locale.x=en_US) and I can make a Starbucks run ...  

I appreciate the interest in this plugin and hope all the best ...
