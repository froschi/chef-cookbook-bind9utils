include_recipe "libbind9"
include_recipe "libdns"
include_recipe "libisc"
include_recipe "libisccc"
include_recipe "libisccfg"

packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "libcap"
  include_recipe "libgssapi-krb5"
  include_recipe "libssl"
  include_recipe "libxml2"

  packages |= %w/
    bind9utils
  /
when "precise"
  packages |= %w/
    bind9utils
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
