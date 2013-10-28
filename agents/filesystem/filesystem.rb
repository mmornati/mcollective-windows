module MCollective
   module Agent
    class Filesystem<RPC::Agent
	  require 'sys/filesystem'
	  
	  action "list" do
		require 'ruby-wmi'
        disklist = Array.new
        WMI::Win32_LogicalDisk.find(:all).each do |diskinfo|
            disklist.push({
			   'device_id' => diskinfo.DeviceID,
			   'file_system' => diskinfo.FileSystem,
			   'name' => diskinfo.name,
			   'size' => diskinfo.size,
			   'free_space' => diskinfo.FreeSpace,
			   'volume_serial_number' => diskinfo.VolumeSerialNumber
			})
        end
		reply[:disks] = disklist
      end
	  
	  action "diskstat" do
		validate :disk_name, String
		
		diskstat = Hash.new
		stat = Sys::Filesystem.stat("#{request[:disk_name]}://")
		diskstat[:free_space_mb] = ((stat.blocks_free.to_i * stat.block_size).to_f / 1024 / 1024).round(2)
		diskstat[:free_space_gb] = ((stat.blocks_free.to_i * stat.block_size).to_f / 1024 / 1024 / 1024).round(2)
		diskstat[:total_space_mb] = ((stat.blocks_available.to_i * stat.block_size).to_f / 1024 / 1024).round(2)
		diskstat[:total_space_gb] = ((stat.blocks_available.to_i * stat.block_size).to_f / 1024 / 1024 / 1024).round(2)
		diskstat[:block_size] = stat.block_size
		diskstat[:fs_type] = stat.base_type
		diskstat[:fs_id] = stat.filesystem_id
		
        reply[:diskstat] = diskstat
      end
	end
   end
end