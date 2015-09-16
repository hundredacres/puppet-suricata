require 'facter'
require 'json'

module RspecPuppetFacts

  def on_supported_os( opts = {} )
    opts[:hardwaremodels] ||= ['x86_64']
    opts[:supported_os] ||= RspecPuppetFacts.meta_supported_os

    h = {}

    opts[:supported_os].map do |os_sup|
      operatingsystem = os_sup['operatingsystem'].downcase
      if os_sup['operatingsystemrelease']
        os_sup['operatingsystemrelease'].map do |operatingsystemmajrelease|
          opts[:hardwaremodels].each do |hardwaremodel|
            os = "#{operatingsystem}-#{operatingsystemmajrelease.split(" ")[0]}-#{hardwaremodel}"
            # TODO: use SemVer here
            facter_minor_version = Facter.version[0..2]
            file = File.expand_path(File.join(File.dirname(__FILE__), "../facts/#{facter_minor_version}/#{os}.facts"))
            # Use File.exists? instead of File.file? here so that we can stub File.file?
            if ! File.exists?(file)
              warn "Can't find facts for '#{os}' for facter #{facter_minor_version}, skipping..."
            else
              h[os] = JSON.parse(IO.read(file), :symbolize_names => true)
            end
          end
        end
      else
        # Assuming this is a rolling release Operating system
        opts[:hardwaremodels].each do |hardwaremodel|
          os = "#{operatingsystem}-#{hardwaremodel}"
          # TODO: use SemVer here
          facter_minor_version = Facter.version[0..2]
          file = File.expand_path(File.join(File.dirname(__FILE__), "../facts/#{facter_minor_version}/#{os}.facts"))
          # Use File.exists? instead of File.file? here so that we can stub File.file?
          if ! File.exists?(file)
            warn "Can't find facts for '#{os}' for facter #{facter_minor_version}, skipping..."
          else
            h[os] = JSON.parse(IO.read(file), :symbolize_names => true)
          end
        end
      end
    end

    h
  end

  # @api private
  def self.meta_supported_os
    @meta_supported_os ||= get_meta_supported_os
  end

  # @api private
  def self.get_meta_supported_os
    metadata = get_metadata
    if metadata['operatingsystem_support'].nil?
      fail StandardError, "Unknown operatingsystem support"
    end
    metadata['operatingsystem_support']
  end

  # @api private
  def self.get_metadata
    if ! File.file?('metadata.json')
      fail StandardError, "Can't find metadata.json... dunno why"
    end
    JSON.parse(File.read('metadata.json'))
  end
end
