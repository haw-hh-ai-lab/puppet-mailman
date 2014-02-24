require 'spec_helper'

# right now, we only need it to work on Ubuntu machines
describe 'mailman::mysql' do
   let(:hiera_config) { 'spec/fixtures/hiera/hiera.yaml' }

   let(:facts) { { :osfamily => 'Debian',
                   :operatingsystem => 'Ubuntu' } }

   it do
     should contain_class('mysql::server')

     should contain_mysql__db('mailman').with({
       'host' => 'localhost',
     })
   end
end
