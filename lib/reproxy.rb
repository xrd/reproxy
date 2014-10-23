require "reproxy/version"
require 'thor'
require 'fileutils'

module Reproxy
  class Proxy < Thor

    desc "record", "Record a proxy session"
    option :name, required: true
    def record
      python_scripts = File.join(__FILE__,"python_scripts","record")
      FileUtils.mkdir_p options[:name]
      # `mitmdump -s "#{python_scripts} #{options[:name]}"
    end

    desc "init", "Create an initialization file for reproxy (where we find recordings git repos)"
    option :recordings, required: true
    def init
      File.open( File.join( ENV['HOME'], ".reproxyrc" ), "w+" ) do |f|
        f.write "recordings=#{options[:recordings]}"
      end
    end

    desc "replay", "Replay a proxy session"
    option :name, required: true
    def replay
    end

    desc "edit", "Edit a proxy session file"
    option :name, required: true
    option :revision, required: true
    def edit
    end

    desc "list", "List all proxy sessions"
    option :filter
    def list
    end

    desc "info", "Print information about a proxy session"
    option :name, required: true
    def info
    end

    desc "list-files", "List proxy session files for a session"
    option :name, required: true
    def list_files
    end

  end
end
