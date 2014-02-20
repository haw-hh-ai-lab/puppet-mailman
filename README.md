# puppet-mailman

This Puppet module is based heavily on thias/puppet-mailman (https://github.com/thias/puppet-mailman) by Matthias Saou

The HAW-HH-AI-Lab version extends it to add more tests and by support for storing list configuration in an external MySQL database.

Copyright 2011-2013 Matthias Saou
          2014      Lutz Behnke

## Overview

This module manages the main Mailman configuration. In addition, you will need
other modules to provide :

* The web server configuration needed for the web interface.
* The mail transport agent configuration needed to receive and send emails.

You can use the default puppet `maillist` type to create and delete lists once
the instance is up and running.

* `mailman` : Configure the main Mailman instance

## Examples

    class { 'mailman':
      default_url_host    => 'lists.example.com',
      default_email_host  => 'example.com',
      default_url_pattern => 'https://%s/mailman/',
      mailman_site_list   => 'mailman-list',
      mm_cfg_settings     => {
        'ALLOW_SITE_ADMIN_COOKIES' => 'Yes',
        'PUBLIC_ARCHIVE_URL' => "'https://%(hostname)s/pipermail/%(listname)s'",
        'MTA' => "'Postfix'",
        'POSTFIX_STYLE_VIRTUAL_DOMAINS' => "'False'",
        'DEFAULT_SUBJECT_PREFIX' => "''",
        'DEFAULT_REPLY_GOES_TO_LIST' => '1',
      },
    }

