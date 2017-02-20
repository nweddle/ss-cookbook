#
# Cookbook:: screensaver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

registry_key 'HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop' do
  values [
    { name: 'ScreenSaveActive',
      type: :string,
      data: 1 },
    { name: 'ScreenSaverIsSecure',
      type: :string,
      data: 1 },
    { name: 'ScreenSaveTimeOut',
      type: :string,
      data: 0 }
  ]
  action :create
end

package 'name' do
  action :install
end
