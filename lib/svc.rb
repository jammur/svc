class Svc
  include Thor::Actions
  
  PATH = File.expand_path("~/.svc")
  
  desc "add <nickname> <path_to_plist>", "add a new service"
  def add(nick, plist)
    load_svc_hash
    @hash[nick] = plist
    save_svc_hash
    puts "Added #{nick} to available services"
  end
  
  desc "delete <nickname>", "delete specified server"
  def delete(nick)
    load_svc_hash
    @hash.delete(nick) {|k| puts "#{k} is not an available service" }
    save_svc_hash
    puts "Deleted #{nick} from available services"
  end
  
  desc "list", "lists all available services"
  def list
    load_svc_hash
    puts "Available services:"
    @hash.each {|nick, plist| puts "  #{nick}: #{plist}" }
  end
  
  desc "start <nickname>", "starts specified service"
  def start(nick)
    load_svc_hash
    system("launchctl load -w #{@hash[nick]}")
  end
  
  desc "stop <nickname>", "stops specified service"
  def stop(nick)
    load_svc_hash
    system("launchctl unload #{@hash[nick]}")
  end
  
  desc "restart <nickname>", "restarts specified service"
  def restart(nick)
    invoke :stop, [nick]
    invoke :start, [nick]
  end
  
  no_tasks do  
    def load_svc_hash
      path = File.expand_path(PATH)
      create_file(PATH, "{}") unless File.exist?(PATH)
      f = File.open(PATH, "r")
      @hash = JSON.parse(f.read)
      f.close
    end
  
    def save_svc_hash
      f = File.open(PATH, "w")
      f.write(@hash.to_json)
      f.close
    end
  end
end
