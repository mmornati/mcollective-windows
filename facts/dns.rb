# Fact: information on DNS settings
#Select DNSDomain,DNSHostName,DNSServerSearchOrder,DefaultIPGateway From Win32_NetworkAdapterConfiguration Where IPEnabled = True
Facter.add("dnsdomain") do
  confine :kernel => "windows"
  setcode do
      require 'facter/util/wmi'
      result = nil
      Facter::Util::WMI.execquery("Select DNSDomain From Win32_NetworkAdapterConfiguration Where IPEnabled = True").each do |dnsinformation|
        result = dnsinformation.DNSDomain
        break
      end
      result
  end
end

Facter.add("dnshostname") do
  confine :kernel => "windows"
  setcode do
      require 'facter/util/wmi'
      result = nil
      Facter::Util::WMI.execquery("Select DNSHostName From Win32_NetworkAdapterConfiguration Where IPEnabled = True").each do |dnsinformation|
        result = dnsinformation.DNSHostName
        break
      end
      result
  end
end

Facter.add("dnsservers") do
  confine :kernel => "windows"
  setcode do
      require 'facter/util/wmi'
      result = nil
      Facter::Util::WMI.execquery("Select DNSServerSearchOrder From Win32_NetworkAdapterConfiguration Where IPEnabled = True").each do |dnsinformation|
        result = dnsinformation.DNSServerSearchOrder
        break
      end
      result
  end
end