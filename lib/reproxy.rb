require "reproxy/version"
require 'thor'

module Reproxy
  class Proxy < Thor

    desc "record", "Record a proxy session"
    option :name, required: true
    def record
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
