require 'spec_helper'

describe 'mailman' do
  let(:node) { 'testhost.example.org' }
  let(:hiera_config) { 'spec/fixtures/hiera/hiera.yaml' }

  context 'with default settings' do
    it do
      should contain_package('mailman')

      should contain_class('mailman')

      should contain_service('mailman')
     end
  end

  context 'with rich config' do
    let(:params) { {
      :default_url_host    => 'lists.example.org',
      :default_email_host  => 'example.org',
      :default_url_pattern => 'https://%s/mailman/',
      :mailman_site_list   => 'mailman-list',
      :mm_cfg_settings     => {
        'ALLOW_SITE_ADMIN_COOKIES' => 'Yes',
        'PUBLIC_ARCHIVE_URL' => "'https://%(hostname)s/pipermail/%(listname)s'",
        'MTA' => "'Postfix'",
        'POSTFIX_STYLE_VIRTUAL_DOMAINS' => "'False'",
        'DEFAULT_SUBJECT_PREFIX' => "''",
        'DEFAULT_REPLY_GOES_TO_LIST' => '1',
      }}}

    it do
      should contain_package('mailman')

      should contain_class('mailman')

      should contain_service('mailman')
     end

  end
end

